<?php
session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php';
requireAuth();

$msg = "";

$cod_centro = $_SESSION['cod_centro'] ?? '';
$id_user     = $_SESSION['user_id'] ?? 0;

// ✅ Recoger id del grupo desde GET
$current_group = $_GET['grupo'] ?? null;

if (!$current_group) {
    header("Location: create_tipo.php");
    exit();
}

// Obtener info del grupo
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id = ?");
$stmt->execute([$current_group]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    header("Location: create_tipo.php");
    exit();
}

$cod_grupo = $grupo['cod_grupo'];
$Curso     = $grupo['Curso'];
$Grupo     = $grupo['Grupo'];
$listado   = $grupo['listado'];

// Info del centro
$stmt2 = $pdo->prepare("SELECT nombre_centro, tipo_centro, loc FROM ttCentros WHERE cod_centro = ?");
$stmt2->execute([$cod_centro]);
$centro = $stmt2->fetch(PDO::FETCH_ASSOC);

// Procesar formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $Tipo1              = isset($_POST['Tipo1']) ? 1 : 0;
    $Informe            = isset($_POST['Informe']) ? 1 : 0;
    $Perfil1            = trim($_POST['Perfil1'] ?? '');
    $ExtraPerfil1       = trim($_POST['ExtraPerfil1'] ?? '');
    $Perfil2            = trim($_POST['Perfil2'] ?? '');
    $ExtraPerfil2       = trim($_POST['ExtraPerfil2'] ?? '');
    $OtrasObservaciones = trim($_POST['OtrasObservaciones'] ?? '');

    // Validación
    $error = false;
    if ($Tipo1 && !$Perfil1) { $msg = "Debes seleccionar Perfil1"; $error = true; }
    if ($Perfil1 && !$ExtraPerfil1) { $msg = "Debes seleccionar ExtraPerfil1"; $error = true; }
    if ($Perfil1 && !$Perfil2) { $msg = "Debes seleccionar Perfil2"; $error = true; }
    if ($Perfil2 && !$ExtraPerfil2) { $msg = "Debes seleccionar ExtraPerfil2"; $error = true; }

    if (!$error) {
        try {
            for ($i = 1; $i <= $listado; $i++) {
                $id_alu = $cod_centro . $Curso . $Grupo . $i;
                $stmt = $pdo->prepare("INSERT INTO ti_alu1
                    (id_alu, cod_centro, cod_grupo, Tipo1, Informe, Perfil1, ExtraPerfil1, Perfil2, ExtraPerfil2, OtrasObservaciones)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                $stmt->execute([
                    $id_alu, $cod_centro, $cod_grupo,
                    $Tipo1, $Informe, $Perfil1, $ExtraPerfil1, $Perfil2, $ExtraPerfil2, $OtrasObservaciones
                ]);
            }
            $msg = "Tipología guardada correctamente.";
        } catch(PDOException $e) {
            $msg = "Error: " . $e->getMessage();
        }
    }
}

$extras = [
    "TDAH"    => ["Leve", "Moderado", "Severo"],
    "Dislexia"=> ["Lectora", "Escritura", "Comprensión"],
    "Autismo" => ["Nivel 1", "Nivel 2", "Nivel 3"]
];
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear Tipología - Formulario</title>
</head>
<body>
<h2>Crear Tipología - Formulario</h2>

<?php if($msg): ?>
<p style="color:<?= strpos($msg,'Error')===0 ? 'red' : 'green' ?>"><?= htmlspecialchars($msg) ?></p>
<?php endif; ?>

<h3>Centro y Grupo</h3>
<p><strong>Código Centro:</strong> <?= htmlspecialchars($cod_centro) ?></p>
<p><strong>Nombre Centro:</strong> <?= htmlspecialchars($centro['nombre_centro'] ?? '') ?></p>
<p><strong>Cod Grupo:</strong> <?= htmlspecialchars($cod_grupo) ?></p>
<p><strong>Número de alumnos:</strong> <?= htmlspecialchars($listado) ?></p>

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

    <button type="submit">Guardar todos</button>
    <button type="button" onclick="window.location='create_tipo.php'">Volver a selección de grupo</button>
</form>

<script>
const extras = <?php echo json_encode($extras); ?>;

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
        extra1.innerHTML='';
        extras[perfil1].forEach(opt => {
            let option = document.createElement('option');
            option.value = opt; option.text = opt;
            extra1.add(option);
        });
    } else {
        extra1.style.display='none';
        extra1.innerHTML='<option value="">Selecciona Perfil1 primero</option>';
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
        extra2.innerHTML='';
        extras[perfil2].forEach(opt => {
            let option = document.createElement('option');
            option.value = opt; option.text = opt;
            extra2.add(option);
        });
    } else {
        extra2.style.display='none';
        extra2.innerHTML='<option value="">Selecciona Perfil2 primero</option>';
    }
}
</script>

<p><a href="logout.php">Cerrar sesión</a></p>
</body>
</html>
