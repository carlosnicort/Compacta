<?php
require_once __DIR__ . '/../src/auth.php';

$msg = "";
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';
    $nombre = $_POST['nombre'] ?? '';

    $result = registerUser($email, $password, $nombre);
    if (isset($result['ok'])) {
        $msg = "Usuario creado correctamente. <a href='/index.php'>Inicia sesión aquí</a>";
    } else {
        $msg = $result['error'] ?? "Error desconocido.";
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
    <p><?= htmlspecialchars($msg) ?></p>
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
    <button type="submit">Registrarse</button>
  </form>
</body>
</html>
