<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . '/../../config/auth/auth.php';
require_once __DIR__ . '/../../config/db/db.php';
requireAuth();

$userId = $_SESSION['user_id'];
$rol = $_SESSION['rol'];

// Obtener id del grupo desde GET
$grupo_id = $_GET['id'] ?? null;
if (!$grupo_id) {
    die("Grupo no especificado");
}

// Verificar permisos
$stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE id = ?");
$stmt->execute([$grupo_id]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    die("Grupo no encontrado");
}

// Reglas de permisos
if ($rol === 'Tutor' && $grupo['id_user'] != $userId) {
    die("No tienes permiso para editar este grupo");
}

// Obtener datos del centro asociado
$stmtCentro = $pdo->prepare("SELECT cod_centro, nombre_centro, tipo_centro, loc FROM ttcentros WHERE cod_centro = ?");
$stmtCentro->execute([$grupo['cod_centro']]);
$centro = $stmtCentro->fetch(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Grupo</title>
<style>
    .visualizacion { background-color: #eef; padding: 10px; margin-bottom: 15px; border: 1px solid #ccc; }
</style>
</head>
<body>
<h2>Editar Grupo</h2>

<div id="mensaje" style="color:red;"></div>

<!-- Visualización previa -->
<div class="visualizacion">
    <?php if ($grupo): ?>
        <strong>Datos actuales del grupo:</strong><br>
        Código Grupo: <?= htmlspecialchars($grupo['cod_grupo']) ?><br>
        Etapa: <?= htmlspecialchars($grupo['Etapa'] ?? '-') ?><br>
        Modalidad: <?= htmlspecialchars($grupo['Modalidad'] ?? '-') ?><br>
        Curso: <?= htmlspecialchars($grupo['Curso'] ?? '-') ?><br>
        Grupo: <?= htmlspecialchars($grupo['Grupo'] ?? '-') ?><br>
        Nº alumnos: <?= htmlspecialchars($grupo['listado'] ?? '0') ?><br>
        Código Centro: <?= htmlspecialchars($centro['cod_centro'] ?? '-') ?><br>
        Nombre Centro: <?= htmlspecialchars($centro['nombre_centro'] ?? '-') ?><br>
        Tipo Centro: <?= htmlspecialchars($centro['tipo_centro'] ?? '-') ?><br>
        Localidad: <?= htmlspecialchars($centro['loc'] ?? '-') ?><br>
    <?php else: ?>
        <span style="color:blue;">Este grupo se va a asignar por primera vez.</span>
    <?php endif; ?>
</div>

<form id="formGrupo">
    <input type="hidden" name="id" value="<?= htmlspecialchars($grupo_id) ?>">

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

<p><a href="/ver_group.php">Volver al Menú</a></p>

<script>
// Cargar datos del grupo
async function cargarGrupo() {
    const res = await fetch(`../../backend/grupos/edit_group_handler.php?id=<?= $grupo_id ?>`);
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

    const res = await fetch('../../backend/grupos/edit_group.php?id=<?= $grupo_id ?>', {
        method: 'POST',
        body: formData,
        credentials: 'same-origin'
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
