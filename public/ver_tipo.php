<?php
session_start();
require_once __DIR__ . '/../src/db.php';

// Verificar usuario en sesión
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

// Verificar que se recibió ID del grupo
$grupoId = $_GET['grupo'] ?? null;
if (!$grupoId) {
    die("Grupo no especificado.");
}

// Obtener información del grupo
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id = ? AND id_user = ?");
$stmt->execute([$grupoId, $_SESSION['user_id']]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$grupo) {
    die("Grupo no encontrado o no tienes permisos para verlo.");
}

// Obtener alumnos asociados a este grupo
$stmt = $pdo->prepare("SELECT id, tipo_acneae FROM TI_Alumnos WHERE cod_grupo = ?");
$stmt->execute([$grupo['cod_grupo']]);
$alumnos = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
