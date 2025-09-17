<?php
session_start();
require_once __DIR__ . '/../src/db.php';

// Verificar sesión de usuario
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

// Verificar que haya un grupo en sesión
if (!isset($_SESSION['ultimo_grupo'])) {
    die("No se ha seleccionado ningún grupo.");
}

$cod_grupo = $_SESSION['ultimo_grupo'];

// Obtener información del grupo
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE cod_grupo = ?");
$stmt->execute([$cod_grupo]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    die("Grupo no encontrado.");
}

// Obtener información del centro
$stmt2 = $pdo->prepare("SELECT * FROM ttCentros WHERE cod_centro = ?");
$stmt2->execute([$grupo['cod_centro']]);
$centro = $stmt2->fetch(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Grupo <?= htmlspecialchars($grupo['cod_grupo']) ?></title>
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
        <!-- Aquí puedes añadir más campos de ttCentros -->
    <?php else: ?>
        <p>No se encontró información del centro.</p>
    <?php endif; ?>

    <h3>Acceso a otros formularios:</h3>
    <ul>
        <li><a href="form_alumnos.php">Perfiles  del alumnado</a></li>
        <li><a href="form_horarios.php">Materias Optativas</a></li>
        <li><a href="form_evaluaciones.php">Fase 2</a></li>
        <!-- Añade aquí los demás formularios necesarios -->
    </ul>

    <p><a href="logout.php">Cerrar sesión</a></p>
</body>
</html>
