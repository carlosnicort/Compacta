<?php
require_once __DIR__ . '/../backend/menuGroupHandler.php';
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Menú Grupo <?= htmlspecialchars($grupo['cod_grupo']) ?></title>
    <style>
        body { font-family: Arial, sans-serif; }
        ul { list-style-type: none; padding: 0; }
        li { margin: 10px 0; }
        a { text-decoration: none; color: blue; }
        a.bloqueado { color: gray; pointer-events: none; }
    </style>
</head>
<body>
    <h2>Grupo: <?= htmlspecialchars($grupo['cod_grupo']) ?></h2>
    <p>Etapa: <?= htmlspecialchars($grupo['Etapa']) ?></p>
    <?php if(!empty($grupo['Modalidad'])): ?>
        <p>Modalidad: <?= htmlspecialchars($grupo['Modalidad']) ?></p>
    <?php endif; ?>
    <p>Curso: <?= htmlspecialchars($grupo['Curso']) ?></p>
    <p>Grupo: <?= htmlspecialchars($grupo['Grupo']) ?></p>
    <p>Nº de alumnos: <?= htmlspecialchars($grupo['listado']) ?></p>

    <h3>Centro asociado:</h3>
    <?php if($centro): ?>
        <p>Código: <?= htmlspecialchars($centro['cod_centro']) ?></p>
        <p>Nombre: <?= htmlspecialchars($centro['nombre_centro']) ?></p>
        <p>Localidad: <?= htmlspecialchars($centro['loc']) ?></p>
    <?php else: ?>
        <p>No se encontró información del centro.</p>
    <?php endif; ?>

    <h3>Acceso a otros formularios:</h3>
    <ul>
        <?php foreach($formItems as $item): ?>
            <li>
                <?php if($item['activo']): ?>
                    <a href="<?= htmlspecialchars($item['url']) ?>"><?= htmlspecialchars($item['label']) ?></a>
                <?php else: ?>
                    <a class="bloqueado"><?= htmlspecialchars($item['label']) ?> (bloqueado)</a>
                <?php endif; ?>
            </li>
        <?php endforeach; ?>
    </ul>

    <p><a href="../backend/logout.php">Cerrar sesión</a></p>
</body>
</html>
