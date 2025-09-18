<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php'; 

$msg = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $nombre = trim($_POST['nombre'] ?? '');
    $rol = trim($_POST['rol'] ?? '');
    $cod_centro = trim($_POST['cod_centro'] ?? '');

    if ($email && $password && $nombre && $rol && $cod_centro) {
        $result = registerUser($email, $password, $nombre, $rol, $cod_centro);

        if (isset($result['ok'])) {
            // ✅ Guardamos sesión al registrarse
            $_SESSION['user_id'] = $result['id_user'];

            header("Location: menu.php");
            exit();
        } else {
            $msg = $result['error'] ?? "Error desconocido.";
        }
    } else {
        $msg = "Todos los campos son obligatorios.";
    }
}
?>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Registro de usuario</title>
</head>
<body>
  <h1>Crear cuenta</h1>
  <?php if ($msg): ?>
    <p style="color:red;"><?= htmlspecialchars($msg) ?></p>
  <?php endif; ?>
  <form method="post">
    <label>Nombre:
      <input type="text" name="nombre" required>
    </label><br>
    <label>Email:
      <input type="email" name="email" required>
    </label><br>
    <label>Password:
      <input type="password" name="password" required minlength="6">
    </label><br>
	<label>Centro:
      <input type="text" name="cod_centro" required minlength="11">
    </label><br>
	<label>Cargo:
      <input type="text" name="cargo" required minlength="6">
    </label><br>

    <button type="submit">Registrarse</button>
  </form>

  <p>¿Ya tienes cuenta? <a href="index.php">Inicia sesión</a></p>
</body>
</html>
