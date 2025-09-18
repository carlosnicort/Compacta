<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once __DIR__ . '/../src/db.php';

$msg = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($email && $password) {
        $stmt = $pdo->prepare("SELECT id_user, password FROM usuarios WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            // ✅ Guardar usuario en sesión
            $_SESSION['user_id'] = $user['id_user'];

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
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Login</title>
</head>
<body>
  <h1>Iniciar sesión</h1>
  <?php if ($msg): ?>
    <p style="color:red;"><?= htmlspecialchars($msg) ?></p>
  <?php endif; ?>
  <form method="post">
    <label>Email:
      <input type="email" name="email" required>
    </label><br>
    <label>Password:
      <input type="password" name="password" required>
    </label><br>
    <button type="submit">Entrar</button>
  </form>

  <p>¿No tienes cuenta? <a href="register.php">Crear usuario</a></p>
</body>
</html>
