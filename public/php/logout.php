<?php
session_start();

// Destroy the session
session_destroy();

// Redirect to login page
header('Location: ../form.html?logout=1');
exit;
?>
