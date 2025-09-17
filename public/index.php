<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once __DIR__ . '/../src/db.php';

// Si ya está logueado, redirigir a crear grupo
if (isset($_SESSION['user_id'])) {
    header("Location: create_group.php");
    exit();
}

// Manejo de login
$error = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST["email"] ?? "");
    $password = trim($_POST["password"] ?? "");

    $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user["password"])) {
        // Guardar el ID real del usuario en la sesión
        $_SESSION["user_id"] = $user["id_user"]; 
        header("Location: create_group.php");
        exit();
    } else {
        $error = "Usuario o contraseña incorrectos.";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Acceso - Proyecto</title>
</head>
<body>
    <h2>Iniciar Sesión</h2>
    <?php if ($error): ?>
        <p style="color:red;"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>
    <form method="POST" action="">
        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>
        <label>Contraseña:</label><br>
        <input type="password" name="password" required><br><br>
        <button type="submit">Entrar</button>
    </form>
    <p>¿No tienes cuenta? <a href="register.php">Crear usuario</a></p>
</body>
</html>
