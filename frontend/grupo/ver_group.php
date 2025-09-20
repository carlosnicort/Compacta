<?php
session_start();
require_once __DIR__ . '/../../../config/db/auth.php';
requireAuth();
?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Ver grupos</title>
</head>
<body>
<h1>Grupos</h1>

<div id="mensaje" style="color:red"></div>
<table border="1" id="tablaGrupos">
<tr>
    <th>Código Grupo</th>
    <th>Etapa</th>
    <th>Modalidad</th>
    <th>Curso</th>
    <th>Grupo</th>
    <th>Acciones</th>
</tr>
<tbody id="cuerpoTabla">
</tbody>
</table>

<p>
<a href="create_group.php">Crear nuevo grupo</a> | 
<a href="logout.php">Cerrar sesión</a> |
<a href="menu.php">Volver al Menú</a>
</p>

<script>
async function cargarGrupos() {
    const res = await fetch('../backend/get_grupos.php');
    const data = await res.json();
    const cuerpo = document.getElementById('cuerpoTabla');
    cuerpo.innerHTML = '';

    if(!data.success) {
        document.getElementById('mensaje').textContent = data.message;
        return;
    }

    if(data.grupos.length === 0) {
        cuerpo.innerHTML = '<tr><td colspan="6">No hay grupos disponibles</td></tr>';
        return;
    }

    data.grupos.forEach(g => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${g.cod_grupo}</td>
            <td>${g.Etapa}</td>
            <td>${g.Modalidad || ''}</td>
            <td>${g.Curso}</td>
            <td>${g.Grupo}</td>
            <td><a href="edit_group.php?id=${g.id}">Editar</a></td>
        `;
        cuerpo.appendChild(tr);
    });
}

cargarGrupos();
</script>
</body>
</html>
