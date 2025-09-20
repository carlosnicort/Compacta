<?php
session_start();
require_once __DIR__ . '/../../../config/auth/auth.php'

$id = intval($_GET['id'] ?? 0);
if ($id <= 0) die("Grupo no especificado.");
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Grupo</title>
</head>
<body>
<h2>Editar Grupo</h2>

<div id="mensaje" style="color:red;"></div>

<form id="formGrupo">
    <input type="hidden" name="id" value="<?= $id ?>">

    <label>Etapa:</label>
    <input type="text" name="Etapa" id="Etapa"><br><br>

    <label>Modalidad:</label>
    <input type="text" name="Modalidad" id="Modalidad"><br><br>

    <label>Curso:</label>
    <input type="number" name="Curso" id="Curso"><br><br>

    <label>Grupo:</label>
    <input type="text" name="Grupo" id="Grupo"><br><br>

    <label>Nº alumnos:</label>
    <input type="number" name="listado" id="listado"><br><br>

    <button type="submit">Guardar cambios</button>
    <button type="button" onclick="window.location='ver_group.php'">Volver sin guardar</button>
</form>

<p><a href="menu.php">Volver al Menú</a></p>

<script>
// Cargar datos del grupo
async function cargarGrupo() {
    const res = await fetch('../backend/edit_group.php?id=<?= $id ?>');
    const data = await res.json();
    if (data.success) {
        const g = data.grupo;
        document.getElementById('Etapa').value = g.Etapa || '';
        document.getElementById('Modalidad').value = g.Modalidad || '';
        document.getElementById('Curso').value = g.Curso || '';
        document.getElementById('Grupo').value = g.Grupo || '';
        document.getElementById('listado').value = g.listado || '';
    } else {
        document.getElementById('mensaje').textContent = data.message;
    }
}

// Guardar cambios
document.getElementById('formGrupo').addEventListener('submit', async e => {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);

    const res = await fetch('../backend/edit_group.php?id=<?= $id ?>', {
        method: 'POST',
        body: formData
    });

    const data = await res.json();
    const msgDiv = document.getElementById('mensaje');
    if (data.success) {
        msgDiv.style.color = 'green';
        msgDiv.textContent = data.message;
    } else {
        msgDiv.style.color = 'red';
        msgDiv.textContent = data.message;
    }
});

// Inicializar
cargarGrupo();
</script>
</body>
</html>
