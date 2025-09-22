<?php 
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

$rol = $_SESSION['rol'];
$stmt = $pdo->prepare("SELECT COUNT(*) FROM ti_gr1 WHERE id_user = ?");
$stmt->execute([$_SESSION['user_id']]);
$numGrupos = (int) $stmt->fetchColumn();

$maxGrupos = ($rol === 'Director') ? 5 : 1;
$puedeCrear = $numGrupos < $maxGrupos;
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Ver grupos</title>
<style>
    table { border-collapse: collapse; width: 100%; }
    th, td { padding: 8px; border: 1px solid #ccc; text-align: left; }
    .subfila { background-color: #f9f9f9; }
    a.bloqueado { color: gray; pointer-events: none; text-decoration: none; }
</style>
</head>
<body>
<h1>Grupos</h1>

<div id="mensaje" style="color:red"></div>

<table id="tablaGrupos">
    <thead>
    <tr>
        <th>Código Grupo</th>
        <th>Etapa</th>
        <th>Modalidad</th>
        <th>Curso</th>
        <th>Grupo</th>
        <th>Listado</th>
        <th>Alumno / Acciones</th>
    </tr>
    </thead>
    <tbody id="cuerpoTabla"></tbody>
</table>

<p>
<?php if($puedeCrear): ?>
    <a href="create_group.php">Crear nuevo grupo</a>
<?php else: ?>
    <span style="color:gray;" title="Has alcanzado el máximo de grupos">Crear nuevo grupo</span>
<?php endif; ?> |
<a href="../menu.php">Volver al Menú</a>
</p>

<script>
async function cargarGrupos() {
    const res = await fetch('../../backend/grupos/get_grupos.php', {
        method: 'GET',
        credentials: 'same-origin'
    });
    const data = await res.json();
    const cuerpo = document.getElementById('cuerpoTabla');
    cuerpo.innerHTML = '';

    if (!data.success) {
        document.getElementById('mensaje').textContent = data.message;
        return;
    }

    if (!Array.isArray(data.grupos) || data.grupos.length === 0) {
        cuerpo.innerHTML = '<tr><td colspan="7">No hay grupos disponibles</td></tr>';
        return;
    }

    for (const g of data.grupos) {
        // Fila del grupo
        const trGrupo = document.createElement('tr');
        trGrupo.innerHTML = `
            <td>${g.cod_grupo}</td>
            <td>${g.Etapa}</td>
            <td>${g.Modalidad || ''}</td>
            <td>${g.Curso}</td>
            <td>${g.Grupo}</td>
            <td>${g.listado}</td>
            <td>
                <a href="edit_group.php?id=${g.id}">Editar Grupo</a>
            </td>
        `;
        cuerpo.appendChild(trGrupo);

        // Filas de alumnos según el array g.alumnos
        if (Array.isArray(g.alumnos) && g.alumnos.length > 0) {
            for (const alumno of g.alumnos) {
                // Número de alumno: último dígito del id_alu
                const matches = alumno.id_alu.match(/_(\d+)$/);
                const numAlumno = matches ? matches[1] : 1;

                const trAlumno = document.createElement('tr');
                trAlumno.classList.add('subfila');
                trAlumno.innerHTML = `
                    <td colspan="5">&nbsp;&nbsp;&nbsp;Alumno ${numAlumno}</td>
                    <td>ID User: ${alumno.id_user}</td>
                    <td>
                        <a href="#" onclick="setCurrentAlumno('${alumno.id_alu}','${g.cod_grupo}')">
                            Crear Tipo
                        </a>
                    </td>
                `;
                cuerpo.appendChild(trAlumno);
            }
        }
    }
}

// Guardar en sesión y redirigir
async function setCurrentAlumno(idAlu, codGrupo) {
    const resp = await fetch('../../backend/grupos/set_current.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id_alu: idAlu, cod_grupo: codGrupo }),
        credentials: 'same-origin'
    });

    const data = await resp.json();
    if (data.success) {
        window.location.href = "../../frontend/tipo/create_tipo.php";
    } else {
        alert("Error al fijar el alumno: " + data.message);
    }
}

// Ejecutar la carga al abrir la página
cargarGrupos();
</script>




</body>
</html>
