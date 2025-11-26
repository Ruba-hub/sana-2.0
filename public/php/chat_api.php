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
    // Save message to database
    $data = json_decode(file_get_contents('php://input'), true);
    
    if (!$data || !isset($data['message']) || !isset($data['sender'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required fields']);
        exit;
    }

    $message = $data['message'];
    $sender = $data['sender']; // 'user' or 'sana'
    $conversationId = $data['conversation_id'] ?? null;
    $isAudio = isset($data['is_audio']) ? (int)$data['is_audio'] : 0;

    // If no conversation exists, create one
    if (!$conversationId) {
        $conversationId = $db->createConversation($userId, null);
    }

    // Add message to database
    $messageId = $db->addMessage($conversationId, $sender, $message, null, $isAudio);

    echo json_encode([
        'success' => true,
        'message_id' => $messageId,
        'conversation_id' => $conversationId
    ]);

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
