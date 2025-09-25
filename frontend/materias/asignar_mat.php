<?php 
if (session_status() === PHP_SESSION_NONE) session_start();
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

// Obtenemos la sesión actual (grupo, alumno y usuario)
if (!isset($_SESSION['current'])) {
    die("No se ha seleccionado ningún alumno.");
}

$datos = $_SESSION['current'];
$cod_grupo = $datos['cod_grupo'] ?? null;
$index = $datos['index'] ?? null;
$id_user = $_SESSION['user_id'] ?? null;
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Asignar materias</title>
<style>
    body { font-family: Arial, sans-serif; }
    form { max-width: 600px; margin: 20px auto; padding: 20px; border: 1px solid #ccc; }
    h1 { text-align: center; }
    label { display: block; margin-top: 10px; }
    .materia { margin: 5px 0; }
    button { margin-top: 20px; padding: 8px 16px; }
</style>
</head>
<body>

<h1>Asignar materias al alumno</h1>

<div id="mensaje" style="color:red;text-align:center"></div>

<form id="formMaterias">
    <input type="hidden" name="cod_grupo" value="<?= htmlspecialchars($cod_grupo) ?>">
    <input type="hidden" name="index" value="<?= htmlspecialchars($index) ?>">
    <input type="hidden" name="id_user" value="<?= htmlspecialchars($id_user) ?>">

    <div id="opcionesMaterias">
        <!-- Aquí se cargarán las materias optativas según grupo -->
    </div>

    <button type="submit">Guardar asignación</button>
</form>

<p style="text-align:center;">
    <a href="../grupos/ver_group.php">Volver a grupos</a>
</p>

<script>
async function cargarMaterias() {
    try {
        const res = await fetch('../../backend/materias/get_opciones.php', {
            method: 'POST',
            body: JSON.stringify({
                cod_grupo: '<?= $cod_grupo ?>',
                index: '<?= $index ?>',
                id_user: '<?= $id_user ?>'
            }),
            headers: { 'Content-Type': 'application/json' },
            credentials: 'same-origin'
        });
        const data = await res.json();
        const cont = document.getElementById('opcionesMaterias');

        if (!data.success) {
            document.getElementById('mensaje').textContent = data.message;
            return;
        }

        cont.innerHTML = '';
        if (Array.isArray(data.materias) && data.materias.length > 0) {
            data.materias.forEach(m => {
                const div = document.createElement('div');
                div.classList.add('materia');
                div.innerHTML = `
                    <label>
                        <input type="checkbox" name="materias[]" value="${m.cod_materia}" ${m.asignada ? 'checked' : ''}>
                        ${m.nombre}
                    </label>
                `;
                cont.appendChild(div);
            });
        } else {
            cont.innerHTML = '<p>No hay materias optativas disponibles para este grupo.</p>';
        }
    } catch (err) {
        console.error(err);
        document.getElementById('mensaje').textContent = 'Error al cargar materias.';
    }
}

document.getElementById('formMaterias').addEventListener('submit', async e => {
    e.preventDefault();
    const formData = new FormData(e.target);
    try {
        const res = await fetch('../../backend/materias/save_asignacion.php', {
            method: 'POST',
            body: formData,
            credentials: 'same-origin'
        });
        const data = await res.json();
        if (data.success) {
            alert("Materias asignadas correctamente");
            window.location.href = '../grupos/ver_group.php';
        } else {
            alert("Error: " + data.message);
        }
    } catch (err) {
        console.error(err);
        alert("Error de conexión");
    }
});

// carga inicial
cargarMaterias();
</script>

</body>
</html>
