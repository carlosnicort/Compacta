<?php
require_once __DIR__ . '/../backend/createTipoHandler.php';
if (!empty($completed)) {
    echo "<p>Todos los alumnos han sido registrados correctamente.</p>";
    echo "<p><a href='menu.php'>Volver al Menú</a></p>";
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear Tipología - Alumno <?= $index ?></title>
</head>
<body>
<h2>Crear Tipología - Alumno <?= $index ?> (ID: <?= htmlspecialchars($id_alu) ?>)</h2>

<h3>Centro y Grupo</h3>
<p><strong>Código Centro:</strong> <?= htmlspecialchars($cod_centro) ?></p>
<p><strong>Nombre Centro:</strong> <?= htmlspecialchars($centro['nombre_centro'] ?? '') ?></p>
<p><strong>Tipo Centro:</strong> <?= htmlspecialchars($centro['tipo_centro'] ?? '') ?></p>
<p><strong>Localidad:</strong> <?= htmlspecialchars($centro['loc'] ?? '') ?></p>
<p><strong>Cod Grupo:</strong> <?= htmlspecialchars($cod_grupo) ?></p>
<p><strong>Alumnos:</strong> <?= htmlspecialchars($listado) ?></p>

<?php if($msg): ?><p style="color:red;"><?= htmlspecialchars($msg) ?></p><?php endif; ?>

<form method="POST">
    <label><input type="checkbox" name="Tipo1" id="Tipo1" onclick="togglePerfil1()"> Activar Tipología</label><br>
    <label><input type="checkbox" name="Informe"> Informe</label><br><br>

    <label>Perfil1:</label><br>
    <select name="Perfil1" id="Perfil1" onchange="toggleExtra1(); togglePerfil2();" disabled>
        <option value="">Selecciona</option>
        <?php foreach (array_keys($extras) as $perfil): ?>
            <option value="<?= htmlspecialchars($perfil) ?>"><?= htmlspecialchars($perfil) ?></option>
        <?php endforeach; ?>
    </select><br><br>

    <label>ExtraPerfil1:</label><br>
    <select name="ExtraPerfil1" id="ExtraPerfil1" style="display:none;">
        <option value="">Selecciona Perfil1 primero</option>
    </select><br><br>

    <label>Perfil2:</label><br>
    <select name="Perfil2" id="Perfil2" onchange="toggleExtra2();" disabled>
        <option value="">Selecciona Perfil1 primero</option>
        <?php foreach (array_keys($extras) as $perfil): ?>
            <option value="<?= htmlspecialchars($perfil) ?>"><?= htmlspecialchars($perfil) ?></option>
        <?php endforeach; ?>
    </select><br><br>

    <label>ExtraPerfil2:</label><br>
    <select name="ExtraPerfil2" id="ExtraPerfil2" style="display:none;">
        <option value="">Selecciona Perfil2 primero</option>
    </select><br><br>

    <label>Otras Observaciones:</label><br>
    <input type="text" name="OtrasObservaciones" maxlength="255"><br><br>

    <button type="submit">Guardar y Siguiente</button>
</form>

<p><a href="menu.php">Volver al Menú</a></p>

<script>
const extras = <?= json_encode($extras) ?>;

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
        extra1.innerHTML = '';
        extras[perfil1].forEach(opt => extra1.add(new Option(opt,opt)));
    } else {
        extra1.style.display='none';
        extra1.innerHTML = '<option value="">Selecciona Perfil1 primero</option>';
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
        extra2.innerHTML = '';
        extras[perfil2].forEach(opt => extra2.add(new Option(opt,opt)));
    } else {
        extra2.style.display='none';
        extra2.innerHTML = '<option value="">Selecciona Perfil2 primero</option>';
    }
}

document.addEventListener('DOMContentLoaded', () => {
    togglePerfil1();
    toggleExtra1();
    togglePerfil2();
    toggleExtra2();
});
</script>

</body>
</html>
