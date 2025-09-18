<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once __DIR__ . '/../src/db.php';

// Verificar login
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

$msg = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $cod_centro = $_SESSION['cod_centro']; // el usuario ya tiene centro asignado
    $Etapa = trim($_POST['Etapa'] ?? '');
    $Modalidad = trim($_POST['Modalidad'] ?? '');
    $Curso = intval($_POST['Curso'] ?? 0);
    $Grupo = trim($_POST['Grupo'] ?? '');
    $listado = intval($_POST['listado'] ?? 0);

    $error = false;

    if (!$Etapa || !$Grupo || $Curso <= 0 || $listado <= 0) {
        $msg = "Por favor, completa todos los campos correctamente.";
        $error = true;
    }

    if (in_array($Etapa, ['ESO','Bachillerato','FP']) && !$Modalidad) {
        $msg = "Debes seleccionar la Modalidad/Grado para esta etapa.";
        $error = true;
    }

    if (!$error) {
        // Generar código de grupo
        if (in_array($Etapa, ['ESO','Bachillerato','FP']) && $Modalidad) {
            $cod_grupo = strtoupper(substr($Modalidad, 0, 3)) . $Curso . $Grupo;
        } else {
            $cod_grupo = strtoupper(substr($Etapa, 0, 3)) . $Curso . $Grupo;
        }

        try {
            $stmt = $pdo->prepare("INSERT INTO TI_Gr1 
                (cod_centro, Etapa, Modalidad, Curso, Grupo, cod_grupo, listado, id_user)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$cod_centro, $Etapa, $Modalidad, $Curso, $Grupo, $cod_grupo, $listado, $_SESSION['user_id']]);

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
<p style="color:<?= strpos($msg,'Error')===0 ? 'red' : 'green' ?>"><?= htmlspecialchars($msg) ?></p>
<?php endif; ?>
<form method="POST">
    <label>Código Centro:</label><br>
    <input type="text" name="cod_centro" required maxlength="20" value="<?= htmlspecialchars($_SESSION['cod_centro'] ?? '') ?>"><br><br>

    <label>Etapa:</label><br>
    <select name="Etapa" id="etapa" onchange="mostrarModalidad()" required>
        <option value="">Selecciona</option>
        <option value="Infantil">Infantil</option>
        <option value="Primaria">Primaria</option>
        <option value="ESO">ESO</option>
        <option value="Bachillerato">Bachillerato</option>
        <option value="FP">FP</option>
    </select><br><br>

    <div id="modalidad-container" style="display:none;">
        <label>Modalidad/Grado:</label><br>
        <select name="Modalidad" id="modalidad"></select><br><br>
    </div>

    <label>Curso:</label><br>
    <input type="number" name="Curso" id="Curso" min="1" max="6" required><br><br>

    <label>Grupo:</label><br>
    <input type="text" name="Grupo" maxlength="1" required><br><br>

    <label>Nº alumnos:</label><br>
    <input type="number" name="listado" min="1" value="1" required><br><br>

    <!-- Botones -->
    <button type="submit">Guardar</button>
    <button type="button" onclick="window.location='menu.php'">Volver al Menú</button>
</form>


<script>
function mostrarModalidad() {
    const etapa = document.getElementById('etapa').value;
    const cont = document.getElementById('modalidad-container');
    const select = document.getElementById('modalidad');
    select.innerHTML = '';
    if(['ESO','Bachillerato','FP'].includes(etapa)) {
        cont.style.display = 'block';
        let opciones = [];
        if(etapa === 'ESO') opciones = ['DIV','ESO'];
        if(etapa === 'Bachillerato') opciones = ['BHS','BCT','BGR','BAP','BAE'];
        if(etapa === 'FP') opciones = ['CFB','CFM','CFS'];
        opciones.forEach(o => select.add(new Option(o,o)));
    } else {
        cont.style.display = 'none';
    }
}
</script>
</body>
</html>
