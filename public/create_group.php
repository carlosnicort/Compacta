<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php';
requireAuth();

// Obtener info del usuario y centro
$user_id = $_SESSION['user_id'];
$rol = $_SESSION['rol'] ?? '';
$cod_centro = $_SESSION['cod_centro'] ?? '';

$stmt = $pdo->prepare("SELECT nombre_centro, tipo_centro, loc FROM ttCentros WHERE cod_centro = ?");
$stmt->execute([$cod_centro]);
$centro = $stmt->fetch(PDO::FETCH_ASSOC);

$msg = "";

// Validar si el tutor ya tiene un grupo creado
if ($rol === 'Tutor') {
    $stmt2 = $pdo->prepare("SELECT COUNT(*) FROM TI_Gr1 WHERE cod_centro = ? AND id_user = ?");
    $stmt2->execute([$cod_centro, $user_id]);
    $existeGrupo = $stmt2->fetchColumn() > 0;
    if ($existeGrupo) {
        die("Los tutores solo pueden crear un grupo. Ya existe un grupo creado. <a href='menu.php'>Volver al menú</a>");
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $Etapa = trim($_POST['Etapa'] ?? '');
    $Modalidad = trim($_POST['Modalidad'] ?? '');
    $Curso = intval($_POST['Curso'] ?? 0);
    $Grupo = trim($_POST['Grupo'] ?? '');
    $listado = intval($_POST['listado'] ?? 0);

    $error = false;
    $grupos_validos = ['A','B','C','D','E','F','G','H'];
    $alumnos_validos = range(1,33);

    if (!$Etapa || !$Grupo || $Curso <= 0 || $listado <= 0) {
        $msg = "Por favor, completa todos los campos correctamente.";
        $error = true;
    } elseif (in_array($Etapa, ['ESO','Bachillerato','FP']) && !$Modalidad) {
        $msg = "Debes seleccionar la Modalidad/Grado para esta etapa.";
        $error = true;
    } elseif (!in_array($Grupo, $grupos_validos)) {
        $msg = "Grupo inválido.";
        $error = true;
    } elseif (!in_array($listado, $alumnos_validos)) {
        $msg = "Número de alumnos inválido.";
        $error = true;
    }

    // Validar Curso según reglas
    if (!$error) {
        $maxCurso = match($Etapa) {
            'Infantil' => 3,
            'Primaria' => 6,
            'ESO' => ($Modalidad === 'ESO') ? 4 : 2,
            'Bachillerato', 'FP' => 2,
            default => 3
        };

        if ($Curso < 1 || $Curso > $maxCurso) {
            $msg = "Curso fuera de rango para la etapa/modalidad.";
            $error = true;
        }
    }

    if (!$error) {
        // Generar código de grupo
        $cod_grupo = strtoupper(substr($Etapa,0,3)) . $Curso . $Grupo;
        if (in_array($Etapa,['ESO','Bachillerato','FP']) && $Modalidad) {
            $cod_grupo = strtoupper(substr($Modalidad,0,3)) . $Curso . $Grupo;
        }

        try {
            $stmt = $pdo->prepare("INSERT INTO TI_Gr1
                (cod_centro, Etapa, Modalidad, Curso, Grupo, cod_grupo, listado, id_user)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$cod_centro, $Etapa, $Modalidad, $Curso, $Grupo, $cod_grupo, $listado, $user_id]);

            $_SESSION['ultimo_grupo'] = $cod_grupo;
            $_SESSION['current_group'] = $pdo->lastInsertId();

            header("Location: menu.php");
            exit();
        } catch (PDOException $e) {
            $msg = "Error al crear el grupo: " . $e->getMessage();
        }
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

<?php if($msg): ?>
<p style="color:red;"><?= htmlspecialchars($msg) ?></p>
<?php endif; ?>

<p><strong>Código Centro:</strong> <?= htmlspecialchars($cod_centro) ?></p>
<p><strong>Nombre Centro:</strong> <?= htmlspecialchars($centro['nombre_centro']) ?></p>
<p><strong>Tipo Centro:</strong> <?= htmlspecialchars($centro['tipo_centro']) ?></p>
<p><strong>Localidad:</strong> <?= htmlspecialchars($centro['loc']) ?></p>

<form method="POST">
<label>Etapa:</label><br>
<select name="Etapa" id="etapa" onchange="mostrarModalidad()" required>
    <option value="">Selecciona</option>
    <?php foreach(['Infantil','Primaria','ESO','Bachillerato','FP'] as $e): ?>
        <option value="<?= $e ?>" <?= ($Etapa ?? '') === $e ? 'selected' : '' ?>><?= $e ?></option>
    <?php endforeach; ?>
</select><br><br>

<div id="modalidad-container" style="display:none;">
<label>Modalidad/Grado:</label><br>
<select name="Modalidad" id="modalidad"></select><br><br>
</div>

<label>Curso:</label><br>
<input type="number" name="Curso" id="Curso" min="1" required><br><br>

<label>Grupo:</label><br>
<select name="Grupo" required>
    <?php foreach(['A','B','C','D','E','F','G','H'] as $g): ?>
        <option value="<?= $g ?>" <?= ($Grupo ?? '')===$g?'selected':'' ?>><?= $g ?></option>
    <?php endforeach; ?>
</select><br><br>

<label>Nº alumnos:</label><br>
<select name="listado" required>
    <?php for($i=1;$i<=33;$i++): ?>
        <option value="<?= $i ?>" <?= ($listado ?? 1)==$i?'selected':'' ?>><?= $i ?></option>
    <?php endfor; ?>
</select><br><br>

<button type="submit">Guardar</button>
<button type="button" onclick="window.location='menu.php'">Volver al Menú</button>
</form>

<script>
function actualizarCurso() {
    const etapa = document.getElementById('etapa').value;
    const mod = document.getElementById('modalidad').value;
    const cursoInput = document.getElementById('Curso');
    let max = 3;
    if(etapa==='Infantil') max=3;
    else if(etapa==='Primaria') max=6;
    else if(etapa==='ESO') max = (mod==='ESO')?4:2;
    else if(etapa==='Bachillerato' || etapa==='FP') max=2;
    cursoInput.max=max;
}
function mostrarModalidad() {
    const etapa=document.getElementById('etapa').value;
    const cont=document.getElementById('modalidad-container');
    const select=document.getElementById('modalidad');
    const prev=select.value;
    select.innerHTML='';
    if(['ESO','Bachillerato','FP'].includes(etapa)) {
        cont.style.display='block';
        let opciones=[];
        if(etapa==='ESO') opciones=['DIV','ESO'];
        if(etapa==='Bachillerato') opciones=['BHS','BCT','BGR','BAP','BAE'];
        if(etapa==='FP') opciones=['CFB','CFM','CFS'];
        opciones.forEach(o=>select.add(new Option(o,o)));
        if(prev && [...select.options].some(opt=>opt.value===prev)) select.value=prev;
    } else cont.style.display='none';
    actualizarCurso();
}
document.getElementById('modalidad').addEventListener('change', actualizarCurso);
</script>
</body>
</html>
