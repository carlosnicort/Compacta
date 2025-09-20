<?php
require_once __DIR__ . '/../../backend/tipo/verTipoHandler.php';

if ($result['status'] === 'error') {
    echo "<p>Error: " . htmlspecialchars($result['message']) . "</p>";
    echo "<p><a href='ver_group.php'>Volver a Grupos</a></p>";
    exit();
}

$grupo = $result['grupo'];
$alumnos = $result['alumnos'];
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alumnos del Grupo <?= htmlspecialchars($grupo['cod_grupo']) ?></title>
</head>
<body>
    <h2>Alumnos del Grupo <?= htmlspecialchars($grupo['cod_grupo']) ?></h2>

    <?php if (empty($alumnos)): ?>
        <p>No hay alumnos registrados para este grupo.</p>
    <?php else: ?>
        <table border="1" cellpadding="5">
            <tr>
                <th>ID Alumno</th>
                <th>Tipo Acneae</th>
            </tr>
            <?php foreach ($alumnos as $a): ?>
                <tr>
                    <td><?= htmlspecialchars($a['id']) ?></td>
                    <td><?= htmlspecialchars($a['tipo_acneae']) ?></td>
                </tr>
            <?php endforeach; ?>
        </table>
    <?php endif; ?>

    <p><a href="ver_group.php">⬅ Volver a Grupos</a></p>
    <p><a href="menu.php">⬅ Volver al Menú</a></p>
</body>
</html>
