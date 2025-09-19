<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Sesión y autenticación
session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php';
requireAuth();                  // Verifica que el usuario esté logueado

// NUEVAS VALIDACIONES PROFESIONALES
requireRole(['Director','Tutor']); // Solo ciertos roles pueden crear tipología
requireGroup($pdo);                // Asegura que haya un grupo válido y autorizado

// Datos básicos
$cod_centro = $_SESSION['cod_centro'] ?? '';
$cod_grupo  = $_SESSION['current_group'] ?? null;

if (!$cod_grupo) {
    die("No se ha seleccionado ningún grupo. <a href='select_group.php'>Seleccionar grupo</a>");
}

// Obtener datos del grupo y centro
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE cod_grupo = ? AND cod_centro = ?");
$stmt->execute([$cod_grupo, $cod_centro]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$grupo) die("Grupo no encontrado.");

$stmt2 = $pdo->prepare("SELECT nombre_centro, tipo_centro, loc FROM ttCentros WHERE cod_centro = ?");
$stmt2->execute([$cod_centro]);
$centro = $stmt2->fetch(PDO::FETCH_ASSOC);

// Configuración de variables
$listado = $grupo['listado'];
$Curso   = $grupo['Curso'];
$Grupo   = $grupo['Grupo'];
$index   = max(1, intval($_GET['index'] ?? 1));

$extras = [
    "TDAH"     => ["Leve", "Moderado", "Severo"],
    "Dislexia" => ["Lectora", "Escritura", "Comprensión"],
    "Autismo"  => ["Nivel 1", "Nivel 2", "Nivel 3"]
];

// Cuando se completan todos los alumnos
if ($index > $listado) {
    $stmt = $pdo->prepare("UPDATE TI_Gr1 SET tipo_completado = 1 WHERE cod_grupo = ?");
    $stmt->execute([$cod_grupo]);
    echo "<p>Todos los alumnos han sido registrados correctamente.</p>";
    echo "<p><a href='menu.php'>Volver al Menú</a></p>";
    exit();
}

// Procesar formulario
$msg = "";
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $Tipo1            = isset($_POST['Tipo1']) ? 1 : 0;
    $Informe          = isset($_POST['Informe']) ? 1 : 0;
    $Perfil1          = trim($_POST['Perfil1'] ?? '');
    $ExtraPerfil1     = trim($_POST['ExtraPerfil1'] ?? '');
    $Perfil2          = trim($_POST['Perfil2'] ?? '');
    $ExtraPerfil2     = trim($_POST['ExtraPerfil2'] ?? '');
    $OtrasObservaciones = trim($_POST['OtrasObservaciones'] ?? '');

    // Validaciones
    $error = false;
    if ($Tipo1 && !$Perfil1) { $error = true; $msg = "Debes seleccionar Perfil1"; }
    if ($Perfil1 && !$ExtraPerfil1) { $error = true; $msg = "Debes seleccionar ExtraPerfil1"; }
    if ($Perfil1 && !$Perfil2) { $error = true; $msg = "Debes seleccionar Perfil2"; }
    if ($Perfil2 && !$ExtraPerfil2) { $error = true; $msg = "Debes seleccionar ExtraPerfil2"; }

    if (!$error) {
        $id_alu = $cod_centro . $Curso . $Grupo . $index;
        $stmt = $pdo->prepare("
            INSERT INTO ti_alu1
            (id_alu, cod_centro, cod_grupo, Tipo1, Informe, Perfil1, ExtraPerfil1, Perfil2, ExtraPerfil2, OtrasObservaciones)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([
            $id_alu, $cod_centro, $cod_grupo,
            $Tipo1, $Informe, $Perfil1, $ExtraPerfil1, $Perfil2, $ExtraPerfil2, $OtrasObservaciones
        ]);

        // Redirigir al siguiente alumno
        header("Location: create_tipo.php?index=" . ($index + 1));
        exit();
    }
}

// Generar ID del alumno actual
$id_alu = $cod_centro . $Curso . $Grupo . $index;
?>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear Tipología - Alumno <?= $index ?></title>
</head>
<body>
<h2>Crear Tipología - Alumno <?= $index ?> (ID: <?= htmlspecialchars($id_alu) ?>)</h2>

<h3>Centro y Grupo</h3>
<p><strong>Código Centro:</strong> <?= htmlspecialchars($cod_centro) ?></p>
<p><strong>Nombre Centro:</strong> <?= htmlspecialchars($centro['nombre_centro'] ?? '') ?></p>
<p><strong>Tipo Centro:</strong> <?= htmlspecialchars($centro['tipo_centro'] ?? '') ?></p>
<p><strong>Localidad:</strong> <?= htmlspecialchars($centro['loc'] ?? '') ?></p>
<p><strong>Cod Grupo:</strong> <?= htmlspecialchars($cod_grupo) ?></p>
<p><strong>Alumnos:</strong> <?= htmlspecialchars($listado) ?></p>

<?php if($msg): ?><p style="color:red;"><?= htmlspecialchars($msg) ?></p><?php endif; ?>

<form method="POST">
    <label><input type="checkbox" name="Tipo1" id="Tipo1" onclick="togglePerfil1()"> Tipo1</label><br>
    <label><input type="checkbox" name="Informe"> Informe</label><br><br>

    <label>Perfil1:</label><br>
    <select name="Perfil1" id="Perfil1" onchange="toggleExtra1(); togglePerfil2();" disabled>
        <option value="">Selecciona</option>
        <option value="TDAH">TDAH</option>
        <option value="Dislexia">Dislexia</option>
        <option value="Autismo">Autismo</option>
    </select><br><br>

    <label>ExtraPerfil1:</label><br>
    <select name="ExtraPerfil1" id="ExtraPerfil1" style="display:none;">
        <option value="">Selecciona Perfil1 primero</option>
    </select><br><br>

    <label>Perfil2:</label><br>
    <select name="Perfil2" id="Perfil2" onchange="toggleExtra2();" disabled>
        <option value="">Selecciona Perfil1 primero</option>
        <option value="TDAH">TDAH</option>
        <option value="Dislexia">Dislexia</option>
        <option value="Autismo">Autismo</option>
    </select><br><br>

    <label>ExtraPerfil2:</label><br>
    <select name="ExtraPerfil2" id="ExtraPerfil2" style="display:none;">
        <option value="">Selecciona Perfil2 primero</option>
    </select><br><br>

    <label>Otras Observaciones:</label><br>
    <input type="text" name="OtrasObservaciones" maxlength="255"><br><br>

    <button type="submit">Guardar y Siguiente</button>
</form>

<p><a href="menu.php">Volver al Menú</a></p>

<script>
const extras = <?= json_encode($extras) ?>;

function togglePerfil1() {
    const tipo1 = document.getElementById('Tipo1').checked;
    const perfil1 = document.getElementById('Perfil1');
    perfil1.disabled = !tipo1;
    if (!tipo1) { perfil1.value=''; toggleExtra1(); togglePerfil2(); }
}

function toggleExtra1() {
    const perfil1 = document.getElementById('Perfil1').value;
    const extra1 = document.getElementById('ExtraPerfil1');
    if (perfil1) {
        extra1.style.display='inline';
        extra1.innerHTML = '';
        extras[perfil1].forEach(opt => extra1.add(new Option(opt,opt)));
    } else {
        extra1.style.display='none';
        extra1.innerHTML = '<option value="">Selecciona Perfil1 primero</option>';
    }
}

function togglePerfil2() {
    const perfil1 = document.getElementById('Perfil1').value;
    const perfil2 = document.getElementById('Perfil2');
    perfil2.disabled = !perfil1;
    if (!perfil1) { perfil2.value=''; toggleExtra2(); }
}

function toggleExtra2() {
    const perfil2 = document.getElementById('Perfil2').value;
    const extra2 = document.getElementById('ExtraPerfil2');
    if (perfil2) {
        extra2.style.display='inline';
        extra2.innerHTML = '';
        extras[perfil2].forEach(opt => extra2.add(new Option(opt,opt)));
    } else {
        extra2.style.display='none';
        extra2.innerHTML = '<option value="">Selecciona Perfil2 primero</option>';
    }
}

// Inicializar estados al cargar la página
document.addEventListener('DOMContentLoaded', () => {
    togglePerfil1();
    toggleExtra1();
    togglePerfil2();
    toggleExtra2();
});
</script>

</body>
</html>
