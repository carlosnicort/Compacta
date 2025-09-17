<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once __DIR__ . '/../src/db.php';

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

// Mensaje de éxito/error
$msg = "";

// Procesar el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $cod_centro = trim($_POST['cod_centro'] ?? '');
    $Etapa = trim($_POST['Etapa'] ?? '');
    $Curso = intval($_POST['Curso'] ?? 0); // columna Curso
    $Grupo = trim($_POST['Grupo'] ?? '');
    $listado = intval($_POST['listado'] ?? 0);

    // Validación básica
    if ($cod_centro && $Etapa && $Curso > 0 && $Grupo && $listado > 0) {

        // Crear el código del grupo automáticamente
		$cod_grupo = strtoupper(substr($Etapa, 0, 3)) . $Curso . $Grupo;

        try {
            $stmt = $pdo->prepare("
                INSERT INTO TI_Gr1 (cod_centro, Etapa, Curso, Grupo, cod_grupo, listado) 
                VALUES (?, ?, ?, ?, ?, ?)
            ");
            $stmt->execute([$cod_centro, $Etapa, $Curso, $Grupo, $cod_grupo, $listado]);
            $msg = "Grupo creado correctamente. Código: $cod_grupo";
        } catch (PDOException $e) {
            $msg = "Error al crear el grupo: " . $e->getMessage();
        }
    } else {
        $msg = "Por favor, completa todos los campos correctamente.";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Grupo</title>
</head>
<body>
    <h2>Crear Grupo</h2>
    <?php if ($msg): ?>
        <p style="color:<?= strpos($msg, 'Error') === 0 ? 'red' : 'green' ?>"><?= htmlspecialchars($msg) ?></p>
    <?php endif; ?>
    <form method="POST">
        <label>Código Centro:</label><br>
        <input type="text" name="cod_centro" required><br><br>

        <label>Etapa:</label><br>
        <select name="Etapa" required>
            <option value="">Selecciona</option>
            <option value="Infantil">Infantil</option>
            <option value="Primaria">Primaria</option>
            <option value="ESO">ESO</option>
            <option value="Bachillerato">Bachillerato</option>
        </select><br><br>

        <label>Curso (Nivel):</label><br>
        <input type="number" name="Curso" min="1" max="6" required><br><br>

        <label>Grupo:</label><br>
        <input type="text" name="Grupo" maxlength="1" required><br><br>

        <label>Nº de alumnos:</label><br>
        <input type="number" name="listado" min="1" value="1" required><br><br>

        <button type="submit">Crear Grupo</button>
    </form>
    <p><a href="logout.php">Cerrar sesión</a></p>
</body>
</html>
