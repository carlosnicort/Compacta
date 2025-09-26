<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alumnos del Grupo</title>
</head>
<body>
<h2 id="titulo">Alumnos del Grupo</h2>
<div id="mensaje"></div>
<table border="1" cellpadding="5" id="tabla" style="display:none">
    <thead>
        <tr>
            <th>ID Alumno</th>
            <th>Tipo1</th>
            <th>Informe</th>
            <th>Perfil1</th>
            <th>ExtraPerfil1</th>
            <th>Perfil2</th>
            <th>ExtraPerfil2</th>
            <th>Otras Observaciones</th>
        </tr>
    </thead>
    <tbody id="cuerpoTabla"></tbody>
</table>
<a href="../grupo/ver_group.php">Volver al menú</a>

<script>
const cod_grupo = '<?= $_GET['grupo'] ?? $_SESSION['current_group'] ?? '' ?>';
if(!cod_grupo){
    document.getElementById('mensaje').textContent = "No se especificó un grupo";
} else {
    fetch(`../../backend/tipo/verTipoHandler.php?grupo=${encodeURIComponent(cod_grupo)}`, {
        credentials: 'same-origin'
    })
    .then(resp => resp.json())
    .then(data => {
        if(data.status !== 'ok'){
            document.getElementById('mensaje').textContent = data.message || 'Error desconocido';
            return;
        }
        document.getElementById('titulo').textContent = `Alumnos del Grupo ${data.grupo.cod_grupo}`;
        const tbody = document.getElementById('cuerpoTabla');
        data.alumnos.forEach(a => {
            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${a.id_alu}</td>
                <td>${a.Tipo1 ? 'Sí' : 'No'}</td>
                <td>${a.Informe ? 'Sí' : 'No'}</td>
                <td>${a.Perfil1}</td>
                <td>${a.ExtraPerfil1}</td>
                <td>${a.Perfil2}</td>
                <td>${a.ExtraPerfil2}</td>
                <td>${a.OtrasObservaciones}</td>
            `;
            tbody.appendChild(tr);
        });
        document.getElementById('tabla').style.display = 'table';
    })
    .catch(err => document.getElementById('mensaje').textContent = 'Error al conectar con el backend');
}
</script>
</body>
</html>
