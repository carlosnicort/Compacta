<?php
if (session_status() === PHP_SESSION_NONE) session_start();

require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

// Variables de sesión
$id_alu = $_SESSION['current_id_alu'] ?? '';
$cod_grupo = $_SESSION['current_group'] ?? '';
$cod_centro = $_SESSION['cod_centro'] ?? '';
$listado = $_SESSION['listado'] ?? 0;

// ---------------------------
// 1. Cargar perfiles desde la BBDD
// ---------------------------
$extras = [];
try {
    $stmt = $pdo->query("SELECT perfil, opcion FROM ti_perfiles ORDER BY perfil, id ASC");
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($rows as $row) {
        $perfil = $row['perfil'];
        $opcion = $row['opcion'];
        if (!isset($extras[$perfil])) $extras[$perfil] = [];
        $extras[$perfil][] = $opcion;
    }
} catch (PDOException $e) {
    die("Error al cargar perfiles: " . $e->getMessage());
}

// ---------------------------
// 2. Comprobar si ya existe registro de este alumno
// ---------------------------
$registroPrevio = null;
try {
    $stmt = $pdo->prepare("SELECT * FROM ti_alu1 WHERE id_alu = ?");
    $stmt->execute([$id_alu]);
    $registroPrevio = $stmt->fetch(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Error al cargar registro previo: " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Crear Tipo</title>
<style>
    label { display: block; margin-top: 10px; }
    select, input[type="text"] { width: 300px; }
</style>
</head>
<body>
<h1>Registro de Tipología</h1>

<div id="mensaje" style="color:red"></div>

<!-- Visualización de datos previos -->
<?php if ($registroPrevio): ?>
    <div id="datosPrevios" style="border:1px solid #ccc; padding:10px; margin-bottom:15px;">
        <h3>Datos actuales del alumno</h3>
        <p>Tipo ACNEAE: <?= $registroPrevio['Tipo1'] ? 'Sí' : 'No' ?></p>
        <p>Informe: <?= $registroPrevio['Informe'] ? 'Sí' : 'No' ?></p>
        <p>Perfil1: <?= htmlspecialchars($registroPrevio['Perfil1']) ?></p>
        <p>ExtraPerfil1: <?= htmlspecialchars($registroPrevio['ExtraPerfil1']) ?></p>
        <p>Perfil2: <?= htmlspecialchars($registroPrevio['Perfil2']) ?></p>
        <p>ExtraPerfil2: <?= htmlspecialchars($registroPrevio['ExtraPerfil2']) ?></p>
        <p>Otras Observaciones: <?= htmlspecialchars($registroPrevio['OtrasObservaciones']) ?></p>
    </div>
<?php else: ?>
    <div id="datosPrevios" style="border:1px solid #ccc; padding:10px; margin-bottom:15px;">
        <h3>Este alumno aún no tiene perfil asignado</h3>
        <p>Se van a asignar los datos del perfil por primera vez.</p>
    </div>
<?php endif; ?>

<form id="formTipo">
    <input type="checkbox" id="Tipo1">
    <label for="Tipo1">Perfil ACNEAE</label><br>

    <label><input type="checkbox" id="Informe" disabled> Informe</label><br><br>

    <label>Perfil1:</label>
    <select id="Perfil1" disabled></select>

    <label>ExtraPerfil1:</label>
    <select id="ExtraPerfil1" style="display:none;"></select>

    <label>Perfil2:</label>
    <select id="Perfil2" disabled></select>

    <label>ExtraPerfil2:</label>
    <select id="ExtraPerfil2" style="display:none;"></select>

    <label>Otras Observaciones:</label>
    <input type="text" id="OtrasObservaciones" maxlength="255"><br><br>

    <button type="submit">Guardar y Siguiente</button>
</form>

<p><a href="../grupo/ver_group.php">Volver al Menú</a></p>

<script>
// ---------------------------
// Variables PHP → JS
// ---------------------------
const idAlu = <?= json_encode($id_alu) ?>;
const codGrupo = <?= json_encode($cod_grupo) ?>;
const listado = <?= (int)$listado ?>;
const codCentro = <?= json_encode($cod_centro) ?>;
const extras = <?= json_encode($extras) ?>;
const registroPrevio = <?= json_encode($registroPrevio) ?>;

document.addEventListener('DOMContentLoaded', () => {
    let index = 1;

    const tipo1 = document.getElementById('Tipo1');
    const informe = document.getElementById('Informe');
    const perfil1 = document.getElementById('Perfil1');
    const extra1 = document.getElementById('ExtraPerfil1');
    const perfil2 = document.getElementById('Perfil2');
    const extra2 = document.getElementById('ExtraPerfil2');
    const mensaje = document.getElementById('mensaje');
    const form = document.getElementById('formTipo');

    // Inicializar selects con perfiles
    perfil1.innerHTML = '<option value="0">Selecciona</option>';
    perfil2.innerHTML = '<option value="0">Selecciona Perfil1 primero</option>';
    Object.keys(extras).forEach(p => {
        perfil1.add(new Option(p,p));
        perfil2.add(new Option(p,p));
    });

    // ---------------------------
    // Funciones toggles
    // ---------------------------
    function togglePerfil1() {
        perfil1.disabled = !tipo1.checked;
        informe.disabled = !tipo1.checked;
        if (!tipo1.checked) {
            perfil1.value = '';
            toggleExtra1();
            togglePerfil2();
        }
    }

    function toggleExtra1() {
        const val1 = perfil1.value;
        extra1.innerHTML = '';
        if (val1 && extras[val1]) {
            extra1.style.display = 'inline';
            extras[val1].forEach(opt => extra1.add(new Option(opt, opt)));
        } else {
            extra1.style.display = 'none';
            extra1.innerHTML = '<option value="0">Selecciona Perfil1 primero</option>';
        }
        togglePerfil2();
    }

    function togglePerfil2() {
        const valExtra1 = extra1.value;
        perfil2.disabled = !valExtra1 || valExtra1 === '0';
        if (!perfil2.disabled) {
            perfil2.value = '';
            toggleExtra2();
        }
    }

    function toggleExtra2() {
        const val2 = perfil2.value;
        extra2.innerHTML = '';
        if (val2 && extras[val2]) {
            extra2.style.display = 'inline';
            extras[val2].forEach(opt => extra2.add(new Option(opt, opt)));
        } else {
            extra2.style.display = 'none';
            extra2.innerHTML = '<option value="0">Selecciona Perfil2 primero</option>';
        }
    }

    // ---------------------------
    // Eventos
    // ---------------------------
    tipo1.addEventListener('click', togglePerfil1);
    perfil1.addEventListener('change', () => { toggleExtra1(); togglePerfil2(); });
    perfil2.addEventListener('change', toggleExtra2);

    // ---------------------------
    // Prellenado si existe registro previo
    // ---------------------------
    if (registroPrevio) {
        tipo1.checked = registroPrevio.Tipo1 == 1;
        informe.checked = registroPrevio.Informe == 1;
        perfil1.value = registroPrevio.Perfil1 || '0';
        toggleExtra1();
        extra1.value = registroPrevio.ExtraPerfil1 || '0';
        perfil2.value = registroPrevio.Perfil2 || '0';
        toggleExtra2();
        extra2.value = registroPrevio.ExtraPerfil2 || '0';
        document.getElementById('OtrasObservaciones').value = registroPrevio.OtrasObservaciones || '';
    }

    // ---------------------------
    // Submit
    // ---------------------------
    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const formData = {
            id_alu: idAlu,
            cod_grupo: codGrupo,
            Tipo1: tipo1.checked ? 1 : 0,
            Informe: informe.checked ? 1 : 0,
            Perfil1: perfil1.value || '0',
            ExtraPerfil1: extra1.value || '0',
            Perfil2: perfil2.value || '0',
            ExtraPerfil2: extra2.value || '0',
            OtrasObservaciones: document.getElementById('OtrasObservaciones').value || '0'
        };

        try {
            const resp = await fetch('../../backend/tipo/createTipoHandler.php', {
                method: 'POST',
                body: JSON.stringify(formData),
                headers: {'Content-Type':'application/json'},
                credentials: 'same-origin'
            });
            const data = await resp.json();

            if (data.success) {
                mensaje.style.color = 'green';
                mensaje.textContent = data.message;
                index = data.nextIndex;
                if (index > listado) {
                    alert("Todos los alumnos han sido registrados.");
                    window.location='../menu.php';
                } else {
                    form.reset();
                    togglePerfil1(); toggleExtra1(); togglePerfil2(); toggleExtra2();
                }
            } else {
                mensaje.style.color = 'red';
                mensaje.textContent = data.message;
                alert(data.message);
            }
        } catch (err) {
            mensaje.style.color = 'red';
            mensaje.textContent = "Error de conexión o JSON inválido";
            console.error(err);
        }
    });

    // Inicialización
    togglePerfil1();
    toggleExtra1();
    togglePerfil2();
    toggleExtra2();
});
</script>
</body>
</html>