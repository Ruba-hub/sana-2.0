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

// Check if user already exists
if ($db->getUserByEmail($email)) {
    header('Location: ../form.html?error=exists');
    exit;
}

// Create hashed password
$hashed = password_hash($password, PASSWORD_DEFAULT);

// Create user (MySQLi class method)
$userId = $db->createUser($email, $display, "student");

// If user creation succeeded, update the password. Otherwise fail gracefully.
if ($userId) {
    $ok = $db->updateUserPassword($userId, $hashed);
    if (!$ok) {
        // Optionally remove the created user or log the issue. For now, redirect with error.
        header('Location: ../form.html?error=pwfail');
        exit;
    }
} else {
    header('Location: ../form.html?error=createfail');
    exit;
}

// Auto login
$_SESSION['user_email'] = $email;

header('Location: ../stdntdashb.html?registered=1');
exit;
?>
