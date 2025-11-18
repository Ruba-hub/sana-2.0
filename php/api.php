        case 'upload_audio':
            // Accepts multipart/form-data: file, conversation_id, uploader_id (optional), duration_seconds (optional)
            if ($_SERVER['REQUEST_METHOD'] !== 'POST') respond(['error'=>'POST required'],405);
            if (empty($_FILES['file']) || empty($_POST['conversation_id'])) respond(['error'=>'file and conversation_id required'],400);
            $conv = $_POST['conversation_id'];
            $uploader = $_POST['uploader_id'] ?? null;
            $duration = isset($_POST['duration_seconds']) ? (float)$_POST['duration_seconds'] : null;
            $file = $_FILES['file'];
            if ($file['error'] !== UPLOAD_ERR_OK) respond(['error'=>'Upload failed'],400);
            $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
            $mime = $file['type'] ?? 'application/octet-stream';
            $size = $file['size'];
            $uuid = uniqid('audio_', true);
            $safeName = $uuid . ($ext ? ('.' . preg_replace('/[^a-zA-Z0-9]/','',$ext)) : '');
            $targetDir = __DIR__ . '/uploads/';
            if (!is_dir($targetDir)) mkdir($targetDir, 0775, true);
            $targetPath = $targetDir . $safeName;
            if (!move_uploaded_file($file['tmp_name'], $targetPath)) respond(['error'=>'Failed to save file'],500);
            $url = 'uploads/' . $safeName;
            // Insert attachment
            $attId = $db->addAttachment($conv, $uploader, $url, $mime, $size, $duration);
            // Optionally create a message referencing this attachment
            $msgId = null;
            if (!empty($_POST['create_message'])) {
                $msgId = $db->addMessage($conv, $uploader ?: 'user', null, $attId, true, null);
            }
            respond(['ok'=>true, 'attachment_id'=>$attId, 'message_id'=>$msgId, 'url'=>$url]);
            break;
<?php
// Simple JSON API wrapper for DB operations (for development/testing)
// Place in webroot or serve with PHP built-in server for local testing.

require_once __DIR__ . '/db.php';

header('Content-Type: application/json; charset=utf-8');

$db = new Database();

$method = $_SERVER['REQUEST_METHOD'] ?? 'GET';
$action = $_GET['action'] ?? ($_POST['action'] ?? null);

function respond($data, $status = 200) {
    http_response_code($status);
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    exit;
}

try {
    if (!$action) {
        respond(['error' => 'Missing action parameter'], 400);
    }

    switch ($action) {
        case 'create_user':
            $body = json_decode(file_get_contents('php://input'), true) ?: $_POST;
            $email = $body['email'] ?? null;
            $name = $body['display_name'] ?? null;
            $id = $db->createUser($email, $name);
            respond(['ok' => true, 'id' => $id]);
            break;

        case 'create_conversation':
            $body = json_decode(file_get_contents('php://input'), true) ?: $_POST;
            $userId = $body['user_id'] ?? null;
            if (!$userId) respond(['error' => 'user_id required'], 400);
            $title = $body['title'] ?? null;
            $id = $db->createConversation($userId, $title);
            respond(['ok' => true, 'id' => $id]);
            break;

        case 'add_message':
            $body = json_decode(file_get_contents('php://input'), true) ?: $_POST;
            $conv = $body['conversation_id'] ?? null;
            $sender = $body['sender'] ?? 'user';
            if (!$conv) respond(['error' => 'conversation_id required'], 400);
            $content = $body['content'] ?? null;
            $attachment = $body['attachment_id'] ?? null;
            $isAudio = !empty($body['is_audio']);
            $metadata = $body['metadata'] ?? null;
            $id = $db->addMessage($conv, $sender, $content, $attachment, $isAudio, $metadata);
            respond(['ok' => true, 'id' => $id]);
            break;

        case 'add_attachment':
            $body = json_decode(file_get_contents('php://input'), true) ?: $_POST;
            $conv = $body['conversation_id'] ?? null;
            $uploader = $body['uploader_id'] ?? null;
            $url = $body['url'] ?? null;
            $mime = $body['mime'] ?? null;
            $size = isset($body['size_bytes']) ? (int)$body['size_bytes'] : null;
            $duration = isset($body['duration_seconds']) ? (float)$body['duration_seconds'] : null;
            $id = $db->addAttachment($conv, $uploader, $url, $mime, $size, $duration);
            respond(['ok' => true, 'id' => $id]);
            break;

        case 'get_messages':
            $conv = $_GET['conversation_id'] ?? null;
            if (!$conv) respond(['error' => 'conversation_id required'], 400);
            $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 50;
            $offset = isset($_GET['offset']) ? (int)$_GET['offset'] : 0;
            $msgs = $db->getMessages($conv, $limit, $offset);
            respond(['ok' => true, 'messages' => $msgs]);
            break;

        case 'log_workflow':
            $body = json_decode(file_get_contents('php://input'), true) ?: $_POST;
            $conv = $body['conversation_id'] ?? null;
            $msg = $body['message_id'] ?? null;
            $req = $body['request_payload'] ?? null;
            $res = $body['response_payload'] ?? null;
            $ct = $body['response_content_type'] ?? null;
            $status = isset($body['status_code']) ? (int)$body['status_code'] : null;
            $latency = isset($body['latency_ms']) ? (int)$body['latency_ms'] : null;
            $id = $db->logWorkflow($conv, $msg, $req, $res, $ct, $status, $latency);
            respond(['ok' => true, 'id' => $id]);
            break;

        default:
            respond(['error' => 'Unknown action'], 400);
    }

} catch (Exception $e) {
    respond(['error' => $e->getMessage()], 500);
}

?>
