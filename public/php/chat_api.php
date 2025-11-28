<?php
require_once __DIR__ . '/db.php';
session_start();

header('Content-Type: application/json');

// Check if user is logged in
if (!isset($_SESSION['user_email'])) {
    http_response_code(401);
    echo json_encode(['error' => 'Not authenticated']);
    exit;
}

$method = $_SERVER['REQUEST_METHOD'];
$db = new Database();

// Get user by email
$user = $db->getUserByEmail($_SESSION['user_email']);
if (!$user) {
    http_response_code(401);
    echo json_encode(['error' => 'User not found']);
    exit;
}

$userId = $user['id'];

if ($method === 'POST') {
    // Determine if request is JSON or multipart/form-data
    $contentType = $_SERVER['CONTENT_TYPE'] ?? '';
    $data = [];
    
    if (strpos($contentType, 'application/json') !== false) {
        // JSON request (text or base64 audio)
        $data = json_decode(file_get_contents('php://input'), true) ?? [];
    } elseif (strpos($contentType, 'multipart/form-data') !== false) {
        // Multipart request (file upload)
        $data = $_POST;
    }

    if (!isset($data['sender'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required fields']);
        exit;
    }

    $message = $data['message'] ?? null;
    $sender = $data['sender']; // 'user' or 'sana'
    $conversationId = $data['conversation_id'] ?? null;
    $messageType = $data['type'] ?? null; // 'text' or 'audio'
    
    // If no conversation exists, create one
    if (!$conversationId) {
        $conversationId = $db->createConversation($userId, null);
    }

    $attachmentId = null;
    $isAudio = 0;

    // Handle multipart file upload
    if (isset($_FILES['audio']) && $_FILES['audio']['error'] === UPLOAD_ERR_OK) {
        $uploadsDir = __DIR__ . '/uploads';
        if (!is_dir($uploadsDir)) mkdir($uploadsDir, 0755, true);

        $file = $_FILES['audio'];
        $mime = $file['type'] ?? 'audio/webm';
        $tmpPath = $file['tmp_name'];
        $size = filesize($tmpPath);

        // Validate file size (max 50MB)
        if ($size > 50 * 1024 * 1024) {
            http_response_code(413);
            echo json_encode(['error' => 'Audio file too large (max 50MB)']);
            exit;
        }

        // Determine extension from mime
        $ext = 'webm';
        $map = [
            'audio/webm' => 'webm',
            'audio/wav' => 'wav',
            'audio/mpeg' => 'mp3',
            'audio/mp3' => 'mp3',
            'audio/ogg' => 'ogg',
            'audio/opus' => 'opus',
            'audio/flac' => 'flac'
        ];
        if (isset($map[$mime])) $ext = $map[$mime];

        $filename = uniqid('audio_', true) . '.' . $ext;
        $filepath = $uploadsDir . '/' . $filename;

        // Move uploaded file
        if (!move_uploaded_file($tmpPath, $filepath)) {
            http_response_code(500);
            echo json_encode(['error' => 'Failed to save audio file']);
            exit;
        }

        $urlPath = 'php/uploads/' . $filename;
        $messageType = 'audio';
        $isAudio = 1;

        // Add attachment record
        $attachmentId = $db->addAttachment($conversationId, $userId, $urlPath, $mime, $size, null, null);
    }
    
    // Handle JSON base64 audio (backward compatibility)
    elseif ($messageType === 'audio' && isset($data['audio_base64']) && isset($data['audio_mime'])) {
        $audioBase64 = $data['audio_base64'];
        $audioMime = $data['audio_mime'];
        
        $uploadsDir = __DIR__ . '/uploads';
        if (!is_dir($uploadsDir)) mkdir($uploadsDir, 0755, true);

        $ext = 'webm';
        $map = [
            'audio/webm' => 'webm',
            'audio/ogg' => 'ogg',
            'audio/wav' => 'wav',
            'audio/mpeg' => 'mp3',
            'audio/mp3' => 'mp3',
            'audio/opus' => 'opus'
        ];
        if (isset($map[$audioMime])) $ext = $map[$audioMime];

        $filename = uniqid('audio_', true) . '.' . $ext;
        $filepath = $uploadsDir . '/' . $filename;

        $decoded = base64_decode($audioBase64, true);
        if ($decoded === false) {
            http_response_code(400);
            echo json_encode(['error' => 'Invalid base64 audio']);
            exit;
        }

        file_put_contents($filepath, $decoded);
        $urlPath = 'php/uploads/' . $filename;
        $size = strlen($decoded);

        $isAudio = 1;
        $messageType = 'audio';

        // Add attachment record
        $attachmentId = $db->addAttachment($conversationId, $userId, $urlPath, $audioMime, $size, null, null);
    }
    
    // Handle audio_url from workflow (no local save needed)
    elseif ($messageType === 'audio' && isset($data['audio_url'])) {
        $audioUrl = $data['audio_url'];
        $audioMime = $data['audio_mime'] ?? 'audio/opus';
        
        $isAudio = 1;
        $attachmentId = $db->addAttachment($conversationId, $userId, $audioUrl, $audioMime, null, null, null);
    }
    
    // Default to text if no audio detected
    if (!$messageType) {
        $messageType = 'text';
    }

    // Add message to database (include attachment id if any)
    $metadata = ['type' => $messageType];
    $messageId = $db->addMessage($conversationId, $sender, $message, $attachmentId, $isAudio, $metadata);

    // Build response payload and include attachment details when available
    $responsePayload = [
        'success' => true,
        'message_id' => $messageId,
        'conversation_id' => $conversationId,
        'type' => $messageType
    ];

    if ($attachmentId) {
        $att = $db->getAttachment($attachmentId);
        if ($att) {
            // Provide attachment metadata to client so it can compute a matching signature
            $responsePayload['attachment'] = $att;
        }
    }

    echo json_encode($responsePayload);

} elseif ($method === 'GET') {
    // Get all conversations for the user
    $action = $_GET['action'] ?? null;

    if ($action === 'get_conversations') {
        $conversations = $db->getUserConversations($userId);
        echo json_encode([
            'success' => true,
            'conversations' => $conversations
        ]);
    } elseif ($action === 'get_messages') {
        $conversationId = $_GET['conversation_id'] ?? null;
        if (!$conversationId) {
            http_response_code(400);
            echo json_encode(['error' => 'Missing conversation_id']);
            exit;
        }
        
        $messages = $db->getMessages($conversationId);

        // Enrich messages with attachment metadata and type field
        foreach ($messages as &$m) {
            // Extract type from metadata or default to 'text'
            $metadata = $m['metadata'] ? json_decode($m['metadata'], true) : [];
            $m['type'] = $metadata['type'] ?? ($m['is_audio'] ? 'audio' : 'text');
            
            // Include attachment metadata when present
            if (!empty($m['attachment_id'])) {
                $att = $db->getAttachment($m['attachment_id']);
                if ($att) {
                    $m['attachment'] = $att;
                }
            }
        }

        echo json_encode([
            'success' => true,
            'messages' => $messages
        ]);
    } elseif ($action === 'create_conversation') {
        // Create a new conversation for the current logged-in user
        $title = $_GET['title'] ?? null;
        $convId = $db->createConversation($userId, $title);
        if ($convId) {
            echo json_encode([
                'success' => true,
                'conversation_id' => $convId
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'error' => 'Failed to create conversation'
            ]);
        }
    } elseif ($action === 'get_latest_conversation') {
        $latest = $db->getLatestConversation($userId);
        if ($latest && isset($latest['id'])) {
            echo json_encode([
                'success' => true,
                'conversation_id' => $latest['id'],
                'conversation' => $latest
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'error' => 'No conversations found.'
            ]);
        }
    } else {
        http_response_code(400);
        echo json_encode(['error' => 'Unknown action']);
    }
} else {
    http_response_code(405);
    echo json_encode(['error' => 'Method not allowed']);
}
?>
