<?php
require_once __DIR__ . '/../backend/selectAlumnoTipoHandler.php';

if ($result['status'] === 'error') {
    echo "<p>Error: " . htmlspecialchars($result['message']) . "</p>";
    echo "<p><a href='select_group_tipo.php'>Volver a grupos</a></p>";
    exit();
}

$alumnos = $result['alumnos'];
$cod_centro = htmlspecialchars($_GET['cod_centro']);
$cod_grupo  = htmlspecialchars($_GET['cod_grupo']);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seleccionar Alumno</title>
</head>
<body>
    <h1>Seleccionar Alumno</h1>
    <p><strong>Código Centro:</strong> <?= $cod_centro ?></p>
    <p><strong>Código Grupo:</strong> <?= $cod_grupo ?></p>

    <?php if (count($alumnos) === 0): ?>
        <p>No hay alumnos en este grupo.</p>
    <?php else: ?>
        <ul>
        <?php foreach ($alumnos as $a): ?>
            <li>
                <a href="edit_tipo.php?id_alu=<?= htmlspecialchars($a['id_alu']) ?>&cod_centro=<?= $cod_centro ?>&cod_grupo=<?= $cod_grupo ?>">
                    <?= htmlspecialchars($a['nombre'] . ' ' . $a['apellidos']) ?> (ID: <?= htmlspecialchars($a['id_alu']) ?>)
                </a>
            </li>
        <?php endforeach; ?>
        </ul>
    <?php endif; ?>

    <p><a href="select_group_tipo.php">Volver a grupos</a></p>
</body>
</html>
