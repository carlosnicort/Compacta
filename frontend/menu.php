<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: /public/login.php");
    exit();
}

$rol = $_SESSION['rol'];
$menu = [
    ['label' => 'Crear Grupo', 'url' => 'create_group.php', 'activo' => true],
    ['label' => 'Crear Tipología', 'url' => 'create_tipo.php', 'activo' => false],
    ['label' => 'Ver Tipología', 'url' => 'view_tipo.php', 'activo' => false],
    ['label' => 'Siguiente: Crear Materias', 'url' => 'create_mat.php', 'activo' => false]
];
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Menú Principal</title>
<style>
body { font-family: Arial, sans-serif; }
ul { list-style-type: none; padding: 0; }
li { margin: 10px 0; }
a { text-decoration: none; color: blue; }
a.bloqueado { color: gray; pointer-events: none; }
</style>
</head>
<body>
<h2>Menú</h2>
<ul>
<?php foreach ($menu as $item): ?>
    <li>
        <?php if ($item['activo']): ?>
            <a href="<?= $item['url'] ?>"><?= $item['label'] ?></a>
        <?php else: ?>
            <a class="bloqueado"><?= $item['label'] ?> (bloqueado)</a>
        <?php endif; ?>
    </li>
<?php endforeach; ?>
</ul>
<p><a href="/backend/logout.php">Cerrar sesión</a></p>
</body>
</html>
