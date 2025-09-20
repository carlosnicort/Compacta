<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . '/../../config/auth/auth.php';

require_once __DIR__ . '/../../config/db/db.php';
requireAuth();


$userId = $_SESSION['user_id'];
$rol = $_SESSION['rol'];

// Contar cuántos grupos ya ha creado el usuario
$stmt = $pdo->prepare("SELECT COUNT(*) FROM ti_gr1 WHERE id_user = ?");
$stmt->execute([$userId]);
$numGrupos = (int) $stmt->fetchColumn();

// Limites por rol
$maxGrupos = ($rol === 'Director') ? 5 : 1;

if ($numGrupos >= $maxGrupos) {
    // Devuelve JSON con error
    header('Content-Type: application/json');
    echo json_encode([
        'success' => false,
        'message' => 'Has alcanzado el número máximo de grupos que puedes crear'
    ]);
    exit;
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

<p><strong>Código Centro:</strong> <span id="codCentro"></span></p>
<p><strong>Nombre Centro:</strong> <span id="nombreCentro"></span></p>
<p><strong>Tipo Centro:</strong> <span id="tipoCentro"></span></p>
<p><strong>Localidad:</strong> <span id="locCentro"></span></p>

<form id="formGrupo">
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
    <input type="number" name="Curso" id="Curso" min="1" required><br><br>

    <label>Grupo:</label><br>
    <select name="Grupo" id="Grupo" required>
        <option value="A">A</option><option value="B">B</option>
        <option value="C">C</option><option value="D">D</option>
        <option value="E">E</option><option value="F">F</option>
        <option value="G">G</option><option value="H">H</option>
    </select><br><br>

    <label>Nº alumnos:</label><br>
    <select name="listado" id="listado" required>
        <!-- Se generará dinámicamente con JS -->
    </select><br><br>

    <button type="submit">Guardar</button>
</form>
<a href="../menu.php">Volver al Menú</a>

<p id="mensaje" style="color:red;"></p>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const listadoSelect = document.getElementById('listado');
    for(let i=1;i<=33;i++){
        const opt = document.createElement('option');
        opt.value = i; opt.textContent = i;
        listadoSelect.appendChild(opt);
    }

    // Modalidad
    const etapaSelect = document.getElementById('etapa');
    etapaSelect.addEventListener('change', mostrarModalidad);
    mostrarModalidad();

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
        try {
            data = await resp.json();
        } catch(err) {
            alert("Error al procesar la respuesta del servidor.");
            return;
        }

        const msg = document.getElementById('mensaje');
        if(data.success){
            msg.style.color='green';
            msg.textContent = data.message;
            setTimeout(()=>window.location='../menu.php',1500);
        } else {
            // Aquí mostramos el mensaje inline sin cambiar de página
            msg.style.color='red';
            msg.textContent = data.message;

            // Opcional: también un pop-up
            alert(data.message);
        }
    });
});

// Función mostrarModalidad como antes...
function mostrarModalidad() {
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
