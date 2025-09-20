<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require __DIR__ . '/../db/db.php'; // conexión PDO
header('Content-Type: application/json');

// Solo POST permitido
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit();
}

$raw = file_get_contents('php://input');
$data = json_decode($raw, true);

$email = filter_var($data['email'] ?? '', FILTER_SANITIZE_EMAIL);
$password = $data['password'] ?? '';

if (!$email || !$password) {
    echo json_encode(['success' => false, 'message' => 'Faltan datos']);
    exit();
}

// Buscar usuario
$stmt = $pdo->prepare("SELECT id_user, email, nombre, cod_centro, rol, password FROM usuarios WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user && password_verify($password, $user['password'])) {
    session_regenerate_id(true);
    $_SESSION['user_id']    = $user['id_user'];
    $_SESSION['email']      = $user['email'];
    $_SESSION['nombre']     = $user['nombre'];
    $_SESSION['cod_centro'] = $user['cod_centro'];
    $_SESSION['rol']        = $user['rol'];

    echo json_encode(['success' => true, 'message' => 'Login correcto']);
} else {
    echo json_encode(['success' => false, 'message' => 'Usuario o contraseña incorrectos']);
}
