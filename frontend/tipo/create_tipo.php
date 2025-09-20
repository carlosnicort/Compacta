<?php
// create_tipo.php
session_start();
$cod_centro = $_SESSION['cod_centro'] ?? '';
$cod_grupo  = $_SESSION['current_group'] ?? '';
$listado    = $_SESSION['listado'] ?? 1; // Número de alumnos del grupo

// Extras disponibles
$extras = [
    "TDAH"     => ["Leve", "Moderado", "Severo"],
    "Dislexia" => ["Lectora", "Escritura", "Comprensión"],
    "Autismo"  => ["Nivel 1", "Nivel 2", "Nivel 3"]
];
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear Tipología</title>
</head>
<body>
<h2>Crear Tipología - Alumno <span id="index">1</span> (ID: <span id="idAlu"></span>)</h2>

<h3>Centro y Grupo</h3>
<p><strong>Código Centro:</strong> <?= htmlspecialchars($cod_centro) ?></p>
<p><strong>Cod Grupo:</strong> <?= htmlspecialchars($cod_grupo) ?></p>
<p><strong>Alumnos:</strong> <?= htmlspecialchars($listado) ?></p>

<p id="mensaje" style="color:red;"></p>

<form id="formTipo">
    <label><input type="checkbox" id="Tipo1"> Activar Tipología</label><br>
    <label><input type="checkbox" id="Informe"> Informe</label><br><br>

    <label>Perfil1:</label><br>
    <select id="Perfil1" disabled>
        <option value="">Selecciona</option>
        <?php foreach(array_keys($extras) as $perfil): ?>
            <option value="<?= htmlspecialchars($perfil) ?>"><?= htmlspecialchars($perfil) ?></option>
        <?php endforeach; ?>
    </select><br><br>

    <label>ExtraPerfil1:</label><br>
    <select id="ExtraPerfil1" style="display:none;">
        <option value="">Selecciona Perfil1 primero</option>
    </select><br><br>

    <label>Perfil2:</label><br>
    <select id="Perfil2" disabled>
        <option value="">Selecciona Perfil1 primero</option>
        <?php foreach(array_keys($extras) as $perfil): ?>
            <option value="<?= htmlspecialchars($perfil) ?>"><?= htmlspecialchars($perfil) ?></option>
        <?php endforeach; ?>
    </select><br><br>

    <label>ExtraPerfil2:</label><br>
    <select id="ExtraPerfil2" style="display:none;">
        <option value="">Selecciona Perfil2 primero</option>
    </select><br><br>

    <label>Otras Observaciones:</label><br>
    <input type="text" id="OtrasObservaciones" maxlength="255"><br><br>

    <button type="submit">Guardar y Siguiente</button>
</form>

<p><a href="../menu.php">Volver al Menú</a></p>

<script>
const extras = <?= json_encode($extras) ?>;
let index = 1;
const listado = <?= (int)$listado ?>;
const codCentro = '<?= $cod_centro ?>';
const codGrupo = '<?= $cod_grupo ?>';

function actualizarIdAlu() {
    document.getElementById('index').textContent = index;
    document.getElementById('idAlu').textContent = codCentro + codGrupo + index;
}

actualizarIdAlu();

// Funciones de habilitación de select
function togglePerfil1() {
    const tipo1 = document.getElementById('Tipo1').checked;
    const perfil1 = document.getElementById('Perfil1');
    perfil1.disabled = !tipo1;
    if (!tipo1) { perfil1.value=''; toggleExtra1(); togglePerfil2(); }
}

function toggleExtra1() {
    const perfil1 = document.getElementById('Perfil1').value;
    const extra1 = document.getElementById('ExtraPerfil1');
    if (perfil1 && extras[perfil1]) {
        extra1.style.display='inline';
        extra1.innerHTML='';
        extras[perfil1].forEach(opt => extra1.add(new Option(opt,opt)));
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
    if (perfil2 && extras[perfil2]) {
        extra2.style.display='inline';
        extra2.innerHTML='';
        extras[perfil2].forEach(opt => extra2.add(new Option(opt,opt)));
    } else {
        extra2.style.display='none';
        extra2.innerHTML='<option value="">Selecciona Perfil2 primero</option>';
    }
}

document.getElementById('Tipo1').addEventListener('click', togglePerfil1);
document.getElementById('Perfil1').addEventListener('change', () => { toggleExtra1(); togglePerfil2(); });
document.getElementById('Perfil2').addEventListener('change', toggleExtra2);

document.getElementById('formTipo').addEventListener('submit', async (e) => {
    e.preventDefault();

    const formData = {
        Tipo1: document.getElementById('Tipo1').checked,
        Informe: document.getElementById('Informe').checked,
        Perfil1: document.getElementById('Perfil1').value,
        ExtraPerfil1: document.getElementById('ExtraPerfil1').value,
        Perfil2: document.getElementById('Perfil2').value,
        ExtraPerfil2: document.getElementById('ExtraPerfil2').value,
        OtrasObservaciones: document.getElementById('OtrasObservaciones').value
    };

    const resp = await fetch('../../backend/tipo/createTipoHandler.php', {
        method: 'POST',
        body: JSON.stringify(formData),
        headers: {'Content-Type':'application/json'},
        credentials: 'same-origin'
    });

    const data = await resp.json();
    const msg = document.getElementById('mensaje');

    if(data.success){
        msg.style.color='green';
        msg.textContent = data.message;
        index = data.nextIndex;
        if(index > listado){
            alert("Todos los alumnos han sido registrados.");
            window.location='../menu.php';
        } else {
            actualizarIdAlu();
            document.getElementById('formTipo').reset();
            togglePerfil1(); toggleExtra1(); togglePerfil2(); toggleExtra2();
        }
    } else {
        msg.style.color='red';
        msg.textContent = data.message;
        alert(data.message);
    }
});

</script>
</body>
</html>
