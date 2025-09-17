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

$msg = "";

// Procesar el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $cod_centro = trim($_POST['cod_centro'] ?? '');
    $Etapa = trim($_POST['Etapa'] ?? '');
    $Modalidad = trim($_POST['Modalidad'] ?? '');
    $Curso = intval($_POST['Curso'] ?? 0);
    $Grupo = trim($_POST['Grupo'] ?? '');
    $listado = intval($_POST['listado'] ?? 0);

    // Validación básica
    if ($cod_centro && $Etapa && $Curso > 0 && $Grupo && $listado > 0) {
        // Validación adicional según modalidad y curso
        $error = false;
        if (in_array($Etapa, ['ESO','Bachillerato','FP']) && !$Modalidad) {
            $msg = "Debes seleccionar la Modalidad/Grado para esta etapa.";
            $error = true;
        }

        if (!$error) {
            // Crear el código del grupo automáticamente
            if (in_array($Etapa, ['ESO','Bachillerato','FP']) && !empty($Modalidad)) {
                $cod_grupo = strtoupper(substr($Modalidad, 0, 3)) . $Curso . $Grupo;
            } else {
                $cod_grupo = strtoupper(substr($Etapa, 0, 3)) . $Curso . $Grupo;
            }

            try {
                $stmt = $pdo->prepare("
                    INSERT INTO TI_Gr1 (cod_centro, Etapa, Modalidad, Curso, Grupo, cod_grupo, listado) 
                    VALUES (?, ?, ?, ?, ?, ?, ?)
                ");
                $stmt->execute([$cod_centro, $Etapa, $Modalidad, $Curso, $Grupo, $cod_grupo, $listado]);
				$_SESSION['ultimo_grupo'] = $cod_grupo;
				header("Location: menu_group.php");
				exit();
            } catch (PDOException $e) {
                $msg = "Error al crear el grupo: " . $e->getMessage();
            }
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

        <label>Etapa/Modalidad/Programa:</label><br>
        <select name="Etapa" id="etapa" required onchange="actualizarModalidadYCurso()">
            <option value="">Selecciona</option>
            <option value="Infantil">Infantil</option>
            <option value="Primaria">Primaria</option>
            <option value="ESO">ESO</option>
            <option value="Bachillerato">Bachillerato</option>
            <option value="FP">Formación Profesional</option>            
        </select><br><br>

        <div id="modalidad-container" style="display:none;">
            <label>Modalidad/Grado:</label><br>
            <select name="Modalidad" id="modalidad"></select><br><br>
        </div>

        <label>Curso:</label><br>
        <input type="number" name="Curso" id="Curso" required min="1" max="6"><br><br>

        <label>Grupo:</label><br>
        <input type="text" name="Grupo" maxlength="1" required><br><br>

        <label>Nº de alumnos:</label><br>
        <input type="number" name="listado" min="1" value="1" required><br><br>

        <button type="submit">Crear Grupo</button>
    </form>
    <p><a href="logout.php">Cerrar sesión</a></p>

<script>
function actualizarModalidadYCurso() {
    const etapa = document.getElementById('etapa').value;
    const contModalidad = document.getElementById('modalidad-container');
    const selectModalidad = document.getElementById('modalidad');
    const inputCurso = document.getElementById('Curso');

    // Reset
    contModalidad.style.display = 'none';
    selectModalidad.innerHTML = '';
    inputCurso.min = 1;
    inputCurso.max = 6;

    if (etapa === 'Infantil') {
        inputCurso.min = 1;
        inputCurso.max = 3;
    } else if (etapa === 'Primaria') {
        inputCurso.min = 1;
        inputCurso.max = 6;
    } else if (etapa === 'ESO') {
        contModalidad.style.display = 'block';
        selectModalidad.innerHTML = `
            <option value="">Selecciona modalidad</option>
            <option value="DIV">DIV</option>
            <option value="ESO">ESO</option>
        `;
        selectModalidad.onchange = function() {
            const mod = selectModalidad.value;
            if(mod === 'DIV') {
                inputCurso.min = 1;
                inputCurso.max = 2;
            } else if(mod === 'ESO') {
                inputCurso.min = 1;
                inputCurso.max = 4;
            }
        };
    } else if (etapa === 'Bachillerato') {
        contModalidad.style.display = 'block';
        selectModalidad.innerHTML = `
            <option value="">Selecciona modalidad</option>
            <option value="BHS">BHS</option>
            <option value="BCT">BCT</option>
            <option value="BGR">BGR</option>
            <option value="BAP">BAP</option>
            <option value="BAE">BAE</option>
        `;
        selectModalidad.onchange = function() {
            inputCurso.min = 1;
            inputCurso.max = 2;
        };
    } else if (etapa === 'FP') {
        contModalidad.style.display = 'block';
        selectModalidad.innerHTML = `
            <option value="">Selecciona modalidad</option>
            <option value="CFB">CFB</option>
            <option value="CFM">CFM</option>
            <option value="CFS">CFS</option>
        `;
        selectModalidad.onchange = function() {
            inputCurso.min = 1;
            inputCurso.max = 2;
        };
    }
}
</script>
</body>
</html>
