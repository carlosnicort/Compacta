<?php
if (session_status() === PHP_SESSION_NONE) session_start();

require_once __DIR__ . '/../../config/auth/auth.php';
require_once __DIR__ . '/../../config/db/db.php';
requireAuth();

$userId = $_SESSION['user_id'];
$rol = $_SESSION['rol'];
$cod_centro = $_SESSION['cod_centro'] ?? '';

// Contar grupos ya creados
$stmt = $pdo->prepare("SELECT COUNT(*) FROM ti_gr1 WHERE id_user = ?");
$stmt->execute([$userId]);
$numGrupos = (int) $stmt->fetchColumn();

// Limites por rol
$maxGrupos = ($rol === 'Director') ? 5 : 1;

if ($numGrupos >= $maxGrupos) {
    header('Content-Type: application/json');
    echo json_encode([
        'success' => false,
        'message' => 'Has alcanzado el número máximo de grupos que puedes crear'
    ]);
    exit;
}

// ---------------------------
// 1. Datos del centro
// ---------------------------
$centro = null;
try {
    $stmt = $pdo->prepare("SELECT * FROM ttcentros WHERE cod_centro = ?");
    $stmt->execute([$cod_centro]);
    $centro = $stmt->fetch(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Error al cargar datos del centro: " . $e->getMessage());
}

// ---------------------------
// 2. Comprobar grupo previo del usuario
// ---------------------------
$grupoPrevio = null;
try {
    $stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE id_user = ? ORDER BY id DESC LIMIT 1");
    $stmt->execute([$userId]);
    $grupoPrevio = $stmt->fetch(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Error al cargar grupo previo: " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear Grupo</title>
<style>
    label { display: block; margin-top: 10px; }
    select, input[type="number"] { width: 200px; }
    #datosPrevios { border:1px solid #ccc; padding:10px; margin-bottom:15px; }
</style>
</head>
<body>
<h2>Crear Grupo</h2>

<!-- Visualización de datos del centro -->
<?php if ($centro): ?>
<div id="datosCentro" style="border:1px solid #ccc; padding:10px; margin-bottom:15px;">
    <h3>Datos del Centro</h3>
    <p><strong>Código Centro:</strong> <?= htmlspecialchars($centro['cod_centro']) ?></p>
    <p><strong>Nombre:</strong> <?= htmlspecialchars($centro['nombre_centro']) ?></p>
    <p><strong>Tipo:</strong> <?= htmlspecialchars($centro['tipo_centro']) ?></p>
    <p><strong>Localidad:</strong> <?= htmlspecialchars($centro['loc']) ?></p>
</div>
<?php endif; ?>

<!-- Visualización grupo previo -->
<?php if ($grupoPrevio): ?>
<div id="datosPrevios">
    <h3>Datos del grupo previamente creado</h3>
    <p>Etapa: <?= htmlspecialchars($grupoPrevio['Etapa']) ?></p>
    <p>Modalidad/Grado: <?= htmlspecialchars($grupoPrevio['Modalidad']) ?></p>
    <p>Curso: <?= htmlspecialchars($grupoPrevio['Curso']) ?></p>
    <p>Grupo: <?= htmlspecialchars($grupoPrevio['Grupo']) ?></p>
    <p>Nº alumnos: <?= htmlspecialchars($grupoPrevio['listado']) ?></p>
</div>
<?php else: ?>
<div id="datosPrevios">
    <h3>Aún no tienes un grupo creado</h3>
    <p>Se van a asignar los datos por primera vez.</p>
</div>
<?php endif; ?>

<form id="formGrupo">
    <label>Etapa:</label>
    <select name="Etapa" id="etapa" required>
        <option value="">Selecciona</option>
        <option value="Infantil">Infantil</option>
        <option value="Primaria">Primaria</option>
        <option value="ESO">ESO</option>
        <option value="Bachillerato">Bachillerato</option>
        <option value="FP">FP</option>
    </select>

    <div id="modalidad-container" style="display:none;">
        <label>Modalidad/Grado:</label>
        <select name="Modalidad" id="modalidad"></select>
    </div>

    <label>Curso:</label>
    <input type="number" name="Curso" id="Curso" min="1" required>

    <label>Grupo:</label>
    <select name="Grupo" id="Grupo" required>
        <option value="A">A</option><option value="B">B</option>
        <option value="C">C</option><option value="D">D</option>
        <option value="E">E</option><option value="F">F</option>
        <option value="G">G</option><option value="H">H</option>
    </select>

    <label>Nº alumnos:</label>
    <select name="listado" id="listado" required></select><br><br>

    <button type="submit">Guardar</button>
</form>
<a href="/ver_group.php">Volver al Menú</a>

<p id="mensaje" style="color:red;"></p>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const listadoSelect = document.getElementById('listado');
    for(let i=1;i<=33;i++){
        const opt = document.createElement('option');
        opt.value = i; opt.textContent = i;
        listadoSelect.appendChild(opt);
    }

    const etapaSelect = document.getElementById('etapa');
    etapaSelect.addEventListener('change', mostrarModalidad);
    mostrarModalidad();

    // Prellenado si existe grupo previo
    const grupoPrevio = <?= json_encode($grupoPrevio) ?>;
    if(grupoPrevio){
        document.getElementById('etapa').value = grupoPrevio.Etapa;
        mostrarModalidad();
        document.getElementById('modalidad').value = grupoPrevio.Modalidad;
        document.getElementById('Curso').value = grupoPrevio.Curso;
        document.getElementById('Grupo').value = grupoPrevio.Grupo;
        document.getElementById('listado').value = grupoPrevio.listado;
    }

    // Submit del form
    document.getElementById('formGrupo').addEventListener('submit', async (e)=>{
        e.preventDefault();
        const formData = new FormData(e.target);
        const resp = await fetch('../../backend/grupos/createGroupHandler.php', {
            method: 'POST',
            body: formData,
            credentials: 'same-origin'
        });

        let data;
        try { data = await resp.json(); } 
        catch(err) {
            alert("Error al procesar la respuesta del servidor.");
            return;
        }

        const msg = document.getElementById('mensaje');
        if(data.success){
            msg.style.color='green';
            msg.textContent = data.message;
            setTimeout(()=>window.location='../menu.php',1500);
        } else {
            msg.style.color='red';
            msg.textContent = data.message;
            alert(data.message);
        }
    });
});

function mostrarModalidad(){
    const etapa = document.getElementById('etapa').value;
    const cont = document.getElementById('modalidad-container');
    const select = document.getElementById('modalidad');
    select.innerHTML='';
    if(['ESO','Bachillerato','FP'].includes(etapa)) {
        cont.style.display='block';
        let opciones=[];
        if(etapa==='ESO') opciones=['DIV','ESO'];
        if(etapa==='Bachillerato') opciones=['BHS','BCT','BGR','BAP','BAE'];
        if(etapa==='FP') opciones=['CFB','CFM','CFS'];
        opciones.forEach(o=>select.add(new Option(o,o)));
    } else cont.style.display='none';
}
</script>
</body>
</html>
