
<?php
require_once __DIR__ . '/db.php';

function registerUser($email, $password, $nombre) {
    global $pdo;

    try {
        // Verificar si el email ya existe
        $stmt = $pdo->prepare("SELECT id_user FROM usuarios WHERE email = ?");
        $stmt->execute([$email]);
        if ($stmt->fetch()) {
            return ['error' => 'El email ya está registrado'];
        }

        // Hashear la contraseña
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Insertar usuario
        $stmt = $pdo->prepare("INSERT INTO usuarios (nombre, email, password) VALUES (?, ?, ?)");
        $stmt->execute([$nombre, $email, $hashedPassword]);

        return ['ok' => true];
    } catch (PDOException $e) {
        return ['error' => $e->getMessage()];
    }
}
