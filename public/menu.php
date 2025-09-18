<?php
session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php';
requireAuth();

// Comprobar si hay grupo seleccionado en sesión
$current_group = $_SESSION['current_group'] ?? null;

// Obtener progreso del usuario
$stmt = $pdo->prepare("SELECT progreso FROM usuarios WHERE id_user = ?");
$stmt->execute([$_SESSION['user_id']]);
$progreso = $stmt->fetchColumn();
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Menú principal</title>
</head>
<body>
  <h1>Menú</h1>

  <ul>
    <li><a href="create_group.php">Crear Grupo</a></li>

    <li>
      <?php if ($progreso >= 1 && $current_group): ?>
        <a href="create_tipo.php">Tipología de Alumnado</a>
      <?php else: ?>
        <span style="color:gray;">Tipología de Alumnado (bloqueado)</span>
      <?php endif; ?>
    </li>

    <li>
      <?php if ($progreso >= 2 && $current_group): ?>
        <a href="create_mat.php">Materias Optativas</a>
      <?php else: ?>
        <span style="color:gray;">Materias Optativas (bloqueado)</span>
      <?php endif; ?>
    </li>

    <li>
      <?php if ($current_group): ?>
        <a href="ver_group.php">Ver Grupos</a>
      <?php else: ?>
        <span style="color:gray;">Ver Grupos (selecciona un grupo)</span>
      <?php endif; ?>
    </li>
  </ul>

  <a href="logout.php">Cerrar sesión</a>
</body>
</html>
