<?php
require_once __DIR__ . '/../backend/selectGroupTipoHandler.php';

if ($result['status'] === 'error') {
    echo "<p>Error: " . htmlspecialchars($result['message']) . "</p>";
    exit();
}

// Si viene redirect (caso Tutor), redirigimos automáticamente
if ($result['redirect']) {
    header("Location: " . $result['redirect']);
    exit();
}

$grupos = $result['grupos'];
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seleccionar Grupo</title>
</head>
<body>
    <h1>Seleccionar Grupo</h1>

    <?php if (count($grupos) === 0): ?>
        <p>No hay grupos disponibles.</p>
    <?php else: ?>
        <ul>
        <?php foreach ($grupos as $g): ?>
            <li>
                <a href="select_alumno_tipo.php?cod_centro=<?= htmlspecialchars($_SESSION['cod_centro']) ?>&cod_grupo=<?= htmlspecialchars($g['cod_grupo']) ?>">
                    <?= htmlspecialchars($g['cod_grupo']) ?>
                </a>
            </li>
        <?php endforeach; ?>
        </ul>
    <?php endif; ?>

    <p><a href="menu.php">Volver al menú</a></p>
</body>
</html>
