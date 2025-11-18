<?php
/**
 * Simple PDO-based Database helper for Sana app (MySQL)
 * Configure DB credentials below or load from environment variables.
 */

class Database {
    private $pdo;

    public function __construct(array $config = []) {
        $host = $config['host'] ?? getenv('DB_HOST') ?: '127.0.0.1';
        $port = $config['port'] ?? getenv('DB_PORT') ?: '3306';
        $db   = $config['database'] ?? getenv('DB_NAME') ?: 'sana';
        $user = $config['user'] ?? getenv('DB_USER') ?: 'root';
        $pass = $config['pass'] ?? getenv('DB_PASS') ?: '';

        $dsn = "mysql:host={$host};port={$port};dbname={$db};charset=utf8mb4";

        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ];

        $this->pdo = new PDO($dsn, $user, $pass, $options);
    }

    public function getPdo(): PDO {
        return $this->pdo;
    }

    // Create a user, returns inserted id (UUID string)
    public function createUser(string $email = null, string $displayName = null, string $role = 'student') {
        $sql = "INSERT INTO users (id, email, display_name, role) VALUES (UUID(), :email, :display_name, :role)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':email' => $email,
            ':display_name' => $displayName,
            ':role' => $role
        ]);
        // MySQL UUID() returns a string; fetch last inserted id by selecting LAST_INSERT_ID() is not helpful for UUID
        // We can return the UUID by querying the row we just inserted using a unique column (email) if provided.
        if ($email) {
            $row = $this->getUserByEmail($email);
            return $row ? $row['id'] : null;
        }
        return null;
    }

    public function getUserByEmail(string $email) {
        $stmt = $this->pdo->prepare("SELECT * FROM users WHERE email = :email LIMIT 1");
        $stmt->execute([':email' => $email]);
        return $stmt->fetch();
    }

    // Create conversation
    public function createConversation(string $userId, string $title = null) {
        $sql = "INSERT INTO conversations (id, user_id, title) VALUES (UUID(), :user_id, :title)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([':user_id' => $userId, ':title' => $title]);
        // return the created conversation id by selecting the latest for this user and title
        $q = $this->pdo->prepare("SELECT id FROM conversations WHERE user_id = :user_id ORDER BY created_at DESC LIMIT 1");
        $q->execute([':user_id' => $userId]);
        $r = $q->fetch();
        return $r ? $r['id'] : null;
    }

    // Add attachment (audio metadata) and return id
    public function addAttachment(string $conversationId = null, string $uploaderId = null, string $url = null, string $mime = null, int $size = null, float $duration = null, string $checksum = null) {
        $sql = "INSERT INTO attachments (id, conversation_id, uploader_id, url, mime, size_bytes, duration_seconds, checksum) VALUES (UUID(), :conversation_id, :uploader_id, :url, :mime, :size_bytes, :duration_seconds, :checksum)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':conversation_id' => $conversationId,
            ':uploader_id' => $uploaderId,
            ':url' => $url,
            ':mime' => $mime,
            ':size_bytes' => $size,
            ':duration_seconds' => $duration,
            ':checksum' => $checksum
        ]);
        $q = $this->pdo->prepare("SELECT id FROM attachments WHERE id IS NOT NULL ORDER BY created_at DESC LIMIT 1");
        $q->execute();
        $r = $q->fetch();
        return $r ? $r['id'] : null;
    }

    // Add message (optionally with attachment)
    public function addMessage(string $conversationId, string $sender, string $content = null, string $attachmentId = null, bool $isAudio = false, array $metadata = null, int $seq = null) {
        $sql = "INSERT INTO messages (id, conversation_id, sender, content, attachment_id, is_audio, metadata, seq) VALUES (UUID(), :conversation_id, :sender, :content, :attachment_id, :is_audio, :metadata, :seq)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':conversation_id' => $conversationId,
            ':sender' => $sender,
            ':content' => $content,
            ':attachment_id' => $attachmentId,
            ':is_audio' => $isAudio ? 1 : 0,
            ':metadata' => $metadata ? json_encode($metadata, JSON_UNESCAPED_UNICODE) : null,
            ':seq' => $seq
        ]);
        // Return the created message id (best-effort)
        $q = $this->pdo->prepare("SELECT id FROM messages WHERE conversation_id = :conversation_id ORDER BY created_at DESC LIMIT 1");
        $q->execute([':conversation_id' => $conversationId]);
        $r = $q->fetch();
        return $r ? $r['id'] : null;
    }

    // Log workflow interaction
    public function logWorkflow(?string $conversationId, ?string $messageId, $requestPayload = null, $responsePayload = null, ?string $contentType = null, ?int $status = null, ?int $latencyMs = null) {
        $sql = "INSERT INTO workflow_logs (id, conversation_id, message_id, request_payload, response_payload, response_content_type, status_code, latency_ms) VALUES (UUID(), :conversation_id, :message_id, :request_payload, :response_payload, :response_content_type, :status_code, :latency_ms)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':conversation_id' => $conversationId,
            ':message_id' => $messageId,
            ':request_payload' => $requestPayload ? json_encode($requestPayload, JSON_UNESCAPED_UNICODE) : null,
            ':response_payload' => $responsePayload ? json_encode($responsePayload, JSON_UNESCAPED_UNICODE) : null,
            ':response_content_type' => $contentType,
            ':status_code' => $status,
            ':latency_ms' => $latencyMs
        ]);
        // return id of inserted log
        $q = $this->pdo->query("SELECT id FROM workflow_logs ORDER BY created_at DESC LIMIT 1");
        $r = $q->fetch();
        return $r ? $r['id'] : null;
    }

    // Utility: fetch last N messages for conversation
    public function getMessages(string $conversationId, int $limit = 50, int $offset = 0) {
        $stmt = $this->pdo->prepare("SELECT * FROM messages WHERE conversation_id = :conversation_id ORDER BY created_at DESC LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':conversation_id', $conversationId, PDO::PARAM_STR);
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        return array_reverse($stmt->fetchAll()); // return oldest->newest
    }
}

// Usage note: include this file and instantiate Database with config
// $db = new Database(['host'=>'127.0.0.1','database'=>'sana','user'=>'sana_user','pass'=>'secret']);

?>
