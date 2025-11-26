<?php
require_once __DIR__ . '/db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../form.html?error=method');
    exit;
}

$email = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

if (!$email || !$password) {
    header('Location: ../form.html?error=missing');
    exit;
}

$db = new Database();
$user = $db->getUserByEmail($email);

if (!$user || empty($user['password']) || !password_verify($password, $user['password'])) {
    header('Location: ../form.html?error=invalid');
    exit;
}

// Login success
// Save both email AND user ID in session
$_SESSION['user_email'] = $email;
$_SESSION['user_id'] = $user['id'];   // <-- THIS is required for dashboard


header('Location: ../stdntdashb.html?login=1');
exit;
?>
