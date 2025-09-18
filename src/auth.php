<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
// Función para obligar a iniciar sesión
function requireAuth() {
    if (!isset($_SESSION['user_id'])) {
        header("Location: index.php");
        exit();
    }
}

// Función para registrar un usuario
function registerUser($email, $password, $nombre) {
    global $pdo;

    // Comprobar si el email ya existe
    $stmt = $pdo->prepare("SELECT id_user FROM usuarios WHERE email = ?");
    $stmt->execute([$email]);
    if ($stmt->fetch()) {
        return ['error' => 'El email ya está registrado'];
    }

    // Hashear contraseña
    $hashed = password_hash($password, PASSWORD_DEFAULT);

    // Insertar nuevo usuario
    $stmt = $pdo->prepare("INSERT INTO usuarios (email, password, nombre, progreso) VALUES (?, ?, ?, 0)");
    $stmt->execute([$email, $hashed, $nombre]);

    // Devolver ID del nuevo usuario
    return [
        'ok' => true,
        'id_user' => $pdo->lastInsertId()
    ];
}
