<?php
require_once __DIR__ . '/db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../form.html?error=method');
    exit;
}

$email = trim($_POST['email'] ?? '');
$display = trim($_POST['display_name'] ?? '');
$password = $_POST['password'] ?? '';

if (!$email || !$password) {
    header('Location: ../form.html?error=missing');
    exit;
}

$db = new Database();
if ($db->getUserByEmail($email)) {
    header('Location: ../form.html?error=exists');
    exit;
}

$hash = password_hash($password, PASSWORD_DEFAULT);
// Insert user with password hash
$stmt = $db->getPdo()->prepare("INSERT INTO users (id, email, display_name, role, created_at, last_seen, password) VALUES (UUID(), :email, :display, 'student', NOW(), NOW(), :password)");
$stmt->execute([':email'=>$email, ':display'=>$display, ':password'=>$hash]);

// Auto-login after registration
$_SESSION['user_email'] = $email;
header('Location: ../chat.html?registered=1');
exit;
