<?php
// backend/auth/register.php
header("Content-Type: application/json");
require __DIR__ . '/../db/db.php'; // conexión PDO

$raw = file_get_contents("php://input");
$data = json_decode($raw, true);

$nombre       = trim($data['nombre'] ?? '');
$apellidos    = trim($data['apellidos'] ?? '');
$email        = trim($data['email'] ?? '');
$password     = $data['password'] ?? '';
$cod_centro   = trim($data['cod_centro'] ?? '');
$rol          = $data['rol'] ?? '';
$observaciones = trim($data['observaciones'] ?? '');

// Validaciones
$centros = $pdo->query("SELECT cod_centro FROM ttCentros")->fetchAll(PDO::FETCH_COLUMN);

$error = '';
if (!$nombre) $error = "El nombre no puede estar vacío.";
elseif (!$apellidos) $error = "Los apellidos no pueden estar vacíos.";
elseif (!$password) $error = "La contraseña no puede estar vacía.";
elseif (!in_array($cod_centro, $centros)) $error = "Centro inválido";
elseif (!in_array($rol, ['Tutor','Director'])) $error = "Rol inválido";
elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) $error = "Email inválido";

if ($error) {
    echo json_encode(['success' => false, 'message' => $error]);
    exit();
}

// Hashear contraseña
$hash = password_hash($password, PASSWORD_DEFAULT);

// Insertar usuario
$stmt = $pdo->prepare("INSERT INTO usuarios 
    (nombre, apellidos, email, password, cod_centro, rol, observaciones)
    VALUES (?, ?, ?, ?, ?, ?, ?)");

try {
    $stmt->execute([$nombre, $apellidos, $email, $hash, $cod_centro, $rol, $observaciones]);
    echo json_encode(['success' => true, 'message' => "Registro completado correctamente."]);
} catch (PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => "Error al registrar usuario: " . $e->getMessage()
    ]);
}
