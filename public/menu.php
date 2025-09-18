<?php
session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php';
requireAuth();

// Obtener datos del usuario
$stmt = $pdo->prepare("SELECT cod_centro, rol, progreso FROM usuarios WHERE id_user = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

$rol = $user['rol'];
$cod_centro = $user['cod_centro'];
$progreso = $user['progreso'];

// Comprobar si tiene grupos según rol
if ($rol === 'Tutor') {
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM TI_Gr1 WHERE id_user = ?");
    $stmt->execute([$_SESSION['user_id']]);
} elseif ($rol === 'Director') {
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM TI_Gr1 WHERE cod_centro = ?");
    $stmt->execute([$cod_centro]);
}

$tiene_grupos = $stmt->fetchColumn() > 0;
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Menú principal</title>
</head>
<body>
  <h1>Menú principal</h1>

  <p>Rol: <?= htmlspecialchars($rol) ?></p>
  <p>Centro: <?= htmlspecialchars($cod_centro) ?></p>
  <p>Progreso: <?= htmlspecialchars($progreso) ?></p>

<ul>
    <?php if (!$tiene_grupos): ?>
        <!-- No hay grupo creado: solo crear grupo -->
        <li><a href="create_group.php">Crear Grupo</a></li>
    <?php else: ?>
        <!-- Hay grupo creado -->
        <li><a href="ver_group.php">Ver Grupos</a></li>

        <?php if ($rol === 'Director'): ?>
            <li><a href="create_group.php">Crear Grupo</a></li>
        <?php endif; ?>

        <li><a href="create_tipo.php">Crear Tipo</a></li>

        <?php
        // Comprobar si hay tipos creados
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM TI_tipologia WHERE cod_grupo IN (SELECT cod_grupo FROM TI_Gr1 WHERE id_user = ?)");
        $stmt->execute([$_SESSION['user_id']]);
        $tiene_tipo = $stmt->fetchColumn() > 0;
        ?>

        <?php if ($tiene_tipo): ?>
            <li><a href="ver_tipo.php">Ver Tipo</a></li>
            <li><a href="create_mat.php">Crear Material</a></li>
        <?php endif; ?>
    <?php endif; ?>
</ul>


  <p><a href="logout.php">Cerrar sesión</a></p>
</body>
</html>