<?php
session_start();
require __DIR__ . '/../src/db.php'; // Aquí incluyes tu conexión PDO en $pdo

$msg = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitizar la entrada
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'] ?? '';

    if ($email && $password) {
        // Buscar usuario
        $stmt = $pdo->prepare("SELECT id_user, email, nombre, cod_centro, rol, password 
                               FROM usuarios WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verificar contraseña
        if ($user && password_verify($password, $user['password'])) {
            // Regenerar sesión por seguridad
            session_regenerate_id(true);

            // Guardar datos en sesión
            $_SESSION['user_id']    = $user['id_user'];
            $_SESSION['email']      = $user['email'];
            $_SESSION['nombre']     = $user['nombre'];
            $_SESSION['cod_centro'] = $user['cod_centro'];
            $_SESSION['rol']        = $user['rol'];

            // Redirigir
            header("Location: menu.php");
            exit();
        } else {
            $msg = "Usuario o contraseña incorrectos.";
        }
    } else {
        $msg = "Por favor, introduce email y contraseña.";
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión</title>
</head>
<body>
    <h2>Iniciar sesión</h2>

    <?php if (!empty($msg)) : ?>
        <p style="color:red;"><?= htmlspecialchars($msg) ?></p>
    <?php endif; ?>

    <form method="POST" action="">
        <label for="email">Email:</label><br>
        <input type="email" name="email" id="email" required><br><br>

        <label for="password">Contraseña:</label><br>
        <input type="password" name="password" id="password" required><br><br>

        <button type="submit">Entrar</button>
    </form>

    <p>¿No tienes cuenta? <a href="register.php">Crear usuario</a></p>
</body>
</html>
