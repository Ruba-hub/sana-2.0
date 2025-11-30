<?php
// Test API endpoint for admin stats
require_once __DIR__ . '/../php/db.php';

header('Content-Type: application/json; charset=utf-8');

// Simulate admin session
session_start();
$_SESSION['user_id'] = 'test-admin-id'; // For testing

try {
    $db = new Database();
    
    echo json_encode([
        'test' => 'Database connection successful',
        'activeUsers' => $db->getActiveUsersCount(),
        'newSignups' => $db->getNewSignupsCount(30),
        'avgSessionDuration' => $db->getAvgSessionDuration(),
        'avgWellBeingScore' => $db->getAvgWellBeingScore(),
        'totalEngagement' => $db->getTotalEngagement(),
        'recentUsers' => $db->getRecentUsers(3)
    ], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'error' => $e->getMessage(),
        'file' => $e->getFile(),
        'line' => $e->getLine()
    ], JSON_PRETTY_PRINT);
}
?>
