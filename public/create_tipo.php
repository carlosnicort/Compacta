<?php
session_start();
require_once __DIR__ . '/../src/db.php';

// Verificar usuario
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

// Guardar grupo seleccionado en sesión si llega por GET
if (isset($_GET['grupo'])) {
    $_SESSION['current_group'] = $_GET['grupo'];
}

// Verificar que hay grupo en sesión
if (!isset($_SESSION['current_group'])) {
    die("⚠️ No se ha seleccionado ningún grupo. <a href='menu.php'>Volver al menú</a>");
}

$current_group = $_SESSION['current_group'];
// Obtener datos del grupo
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id = ? AND id_user = ?");
$stmt->execute([$current_group, $_SESSION['user_id']]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    die("⚠️ Grupo no encontrado. <a href='menu.php'>Volver al menú</a>");
}

$msg = "";

// Procesar formulario tipo de alumno
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $tipo_acneae = trim($_POST['tipo_acneae'] ?? '');

    if ($tipo_acneae) {
        // Aquí se insertarían los registros por alumno
        // Por ahora solo un ejemplo de guardado simple
        $stmt = $pdo->prepare("
            INSERT INTO TI_Tipo (id_grupo, tipo_acneae)
            VALUES (?, ?)
        ");
        $stmt->execute([$current_group, $tipo_acneae]);

        // Actualizar progreso
        $stmt = $pdo->prepare("UPDATE usuarios SET progreso = 2 WHERE id_user = ?");
        $stmt->execute([$_SESSION['user_id']]);

        $msg = "Tipo de alumnado creado correctamente.";
    } else {
        $msg = "Por favor, complete el campo.";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Tipo de Alumnado</title>
</head>
<body>
    <h2>Crear Tipo de Alumnado para Grupo <?= htmlspecialchars($grupo['cod_grupo']) ?></h2>
    <?php if ($msg): ?>
        <p style="color: <?= strpos($msg,'correctamente')!==false ? 'green':'red' ?>"><?= htmlspecialchars($msg) ?></p>
    <?php endif; ?>

    <form method="POST">
        <label>Tipo de ACNEAE:</label><br>
        <input type="text" name="tipo_acneae" required><br><br>
        <button type="submit">Guardar</button>
    </form>

    <p><a href="ver_group.php?grupo=<?= $grupo['id'] ?>">⬅ Volver al grupo</a></p>
</body>
</html>
