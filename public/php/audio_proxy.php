<?php
require_once __DIR__ . '/db.php';

// Simple audio proxy to avoid CORS when playing remote audio URLs
// Usage: audio_proxy.php?u=<url>  or audio_proxy.php?id=<attachment_id>

$u = isset($_GET['u']) ? trim($_GET['u']) : null;
$id = isset($_GET['id']) ? trim($_GET['id']) : null;

if (!$u && !$id) {
    http_response_code(400);
    echo "Missing url or id";
    exit;
}

$db = new Database();

if ($id && !$u) {
    $att = $db->getAttachment($id);
    if (!$att || empty($att['url'])) {
        http_response_code(404);
        echo "Attachment not found";
        exit;
    }
    $u = $att['url'];
}

// If URL is a local path (relative), serve file directly
if (strpos($u, 'php/uploads/') === 0 || preg_match('#^uploads/#', $u)) {
    $local = __DIR__ . '/' . ltrim($u, '/');
    if (!file_exists($local)) {
        http_response_code(404);
        echo "File not found";
        exit;
    }
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $mime = finfo_file($finfo, $local) ?: 'application/octet-stream';
    finfo_close($finfo);
    header('Content-Type: ' . $mime);
    header('Cache-Control: max-age=86400');
    readfile($local);
    exit;
}

// Validate URL
$parts = parse_url($u);
if (!$parts || !isset($parts['scheme']) || !in_array(strtolower($parts['scheme']), ['http', 'https'])) {
    http_response_code(400);
    echo "Invalid URL";
    exit;
}

// Disallow accessing local files via URLs like file://
if (in_array(strtolower($parts['scheme']), ['file'])) {
    http_response_code(400);
    echo "Invalid scheme";
    exit;
}

// Fetch with cURL
$ch = curl_init($u);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_TIMEOUT, 15);
// don't verify peer in local dev environments (you may adjust)
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
$response = curl_exec($ch);
$code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$contentType = curl_getinfo($ch, CURLINFO_CONTENT_TYPE) ?: 'application/octet-stream';
$err = curl_error($ch);
curl_close($ch);

if ($response === false || $code >= 400) {
    http_response_code(502);
    echo "Failed to fetch audio";
    if ($err) echo ": " . $err;
    exit;
}

header('Content-Type: ' . $contentType);
header('Cache-Control: private, max-age=3600');
echo $response;
exit;
?>