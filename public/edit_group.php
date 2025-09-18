<?php
session_start();
require_once __DIR__ . '/../src/db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

$id = intval($_GET['id'] ?? 0);

// Recuperar datos del grupo
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id = ?");
$stmt->execute([$id]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    die("Grupo no encontrado.");
}

// Solo el creador o director del centro pueden editar
if ($_SESSION['rol'] === 'Tutor' && $grupo['id_user'] != $_SESSION['user_id']) {
    die("No tienes permiso para editar este grupo.");
}

$msg = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $Etapa = trim($_POST['Etapa'] ?? '');
    $Modalidad = trim($_POST['Modalidad'] ?? '');
    $Curso = intval($_POST['Curso'] ?? 0);
    $Grupo = trim($_POST['Grupo'] ?? '');
    $listado = intval($_POST['listado'] ?? 0);

    // Validación y generación cod_grupo
    if (in_array($Etapa, ['ESO','Bachillerato','FP']) && $Modalidad) {
        $cod_grupo = strtoupper(substr($Modalidad,0,3)).$Curso.$Grupo;
    } else {
        $cod_grupo = strtoupper(substr($Etapa,0,3)).$Curso.$Grupo;
    }

    $stmt = $pdo->prepare("UPDATE TI_Gr1 SET Etapa=?, Modalidad=?, Curso=?, Grupo=?, cod_grupo=?, listado=? WHERE id=?");
    $stmt->execute([$Etapa, $Modalidad, $Curso, $Grupo, $cod_grupo, $listado, $id]);

    $msg = "Grupo actualizado correctamente.";
}
?>

<form method="POST">
    Etapa: <input type="text" name="Etapa" value="<?= htmlspecialchars($grupo['Etapa']) ?>"><br>
    Modalidad: <input type="text" name="Modalidad" value="<?= htmlspecialchars($grupo['Modalidad']) ?>"><br>
    Curso: <input type="number" name="Curso" value="<?= htmlspecialchars($grupo['Curso']) ?>"><br>
    Grupo: <input type="text" name="Grupo" value="<?= htmlspecialchars($grupo['Grupo']) ?>"><br>
    Nº alumnos: <input type="number" name="listado" value="<?= htmlspecialchars($grupo['listado']) ?>"><br>
    <button type="submit">Guardar cambios</button>
	<button type="button" onclick="window.location='ver_group.php'">Volver sin guardar</button>
</form>
<p><?= $msg ?></p>
