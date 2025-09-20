<?php
require_once __DIR__ . '/../backend/selectGroupHandler.php';
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Seleccionar Grupo</title>
<style>
    ul { list-style-type: none; padding: 0; }
    li { margin: 5px 0; }
    a { text-decoration: none; color: blue; }
</style>
</head>
<body>
<h2>Selecciona un grupo para crear/editar Tipología</h2>

<?php if(empty($grupos)): ?>
    <p>No hay grupos disponibles.</p>
    <?php if($puedeCrear): ?>
        <a href="create_group.php">Crear Grupo</a>
    <?php endif; ?>
<?php else: ?>
    <ul>
        <?php foreach($grupos as $g): ?>
            <li>
                <?= htmlspecialchars($g['cod_grupo']) ?> 
                <a href="set_current_group.php?cod_grupo=<?= urlencode($g['cod_grupo']) ?>">✏️ Editar Tipología</a>
            </li>
        <?php endforeach; ?>
    </ul>
    <?php if($puedeCrear): ?>
        <a href="create_group.php">Crear Nuevo Grupo</a>
    <?php endif; ?>
<?php endif; ?>

<p><a href="menu.php">Volver al Menú</a></p>
<p><a href="../backend/logout.php">Cerrar sesión</a></p>
</body>
</html>
