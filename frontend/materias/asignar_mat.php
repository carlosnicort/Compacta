<?php
if (session_status() === PHP_SESSION_NONE) session_start();
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

// Leer sesión
$cod_grupo = $_SESSION['current_group'] ?? null;
$index     = $_SESSION['current_index'] ?? null;
$id_alu    = $_SESSION['current_id_alu'] ?? null;
$id_user   = $_SESSION['user_id'] ?? null;

if (!$cod_grupo || !$id_alu) {
    die("No se ha seleccionado ningún alumno válido.");
}

// Determinar cod_nivel a partir de cod_grupo (ej: INF1A → INF1)
$cod_nivel = substr($cod_grupo, 0, -1);
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
<title>Asignar materias al alumno</title>
<style>
#infoAlumno {
    border: 2px solid #0066cc;
    border-radius: 8px;
    padding: 10px 15px;
    margin: 15px 0;
    background-color: #f0f8ff;
    font-size: 14px;
}
#infoAlumno p {
    margin: 5px 0;
}
#infoAlumno span {
    color: #003366;
    font-weight: bold;
}

    body { font-family: Arial, sans-serif; }
    form { max-width: 700px; margin: 20px auto; padding: 20px; border: 1px solid #ccc; }
    h1 { text-align: center; }
    h2 { margin-top: 20px; }
    .bloque { border: 1px solid #ddd; padding: 10px; margin-bottom: 15px; }
    .materia { margin: 5px 0; }
    .comun { color: #555; padding-left: 15px; }
    button { margin-top: 20px; padding: 8px 16px; }
    #mensaje { color: red; text-align: center; }
</style>
</head>
<body>
<!-- Bloque de información del alumno -->
<div id="infoAlumno">
    <p><strong>Código de grupo:</strong> <span id="infoCodGrupo"><?= htmlspecialchars($cod_grupo) ?></span></p>
    <p><strong>ID Alumno:</strong> <span id="infoIdAlu"><?= htmlspecialchars($id_alu) ?></span></p>
</div>
<h1>Asignar materias al alumno</h1>
<div id="mensaje"></div>

<form id="formMaterias">
    <input type="hidden" name="cod_grupo" value="<?= htmlspecialchars($cod_grupo) ?>">
    <input type="hidden" name="cod_nivel" value="<?= htmlspecialchars($cod_nivel) ?>">
    <input type="hidden" name="index" value="<?= htmlspecialchars($index) ?>">
    <input type="hidden" name="id_alu" value="<?= htmlspecialchars($id_alu) ?>">
    <input type="hidden" name="id_user" value="<?= htmlspecialchars($id_user) ?>">

    <div id="comunesMaterias"></div>
    <div id="optativasMaterias"></div>

    <button type="submit">Guardar asignación</button>
</form>

<p style="text-align:center;">
    <a href="../grupo/ver_group.php">Volver al menú</a>
</p>

<script>
// Cargar materias
async function cargarMaterias() {
    try {
        const res = await fetch('../../backend/materias/get_opciones.php', {
            method: 'POST',
            body: JSON.stringify({
                cod_nivel: '<?= $cod_nivel ?>',
                id_alu: '<?= $id_alu ?>'
            }),
            headers: { 'Content-Type': 'application/json' },
            credentials: 'same-origin'
        });
        const data = await res.json();
        if (!data.success) {
            document.getElementById('mensaje').textContent = data.message;
            return;
        }

        // Comunes
        const comunesDiv = document.getElementById('comunesMaterias');
        comunesDiv.innerHTML = '<h2>Asignaturas comunes</h2>';
        if (data.comunes.length > 0) {
            data.comunes.forEach(m => {
                comunesDiv.innerHTML += `<p class="comun">✔ ${m.nombre}</p>`;
            });
        } else {
            comunesDiv.innerHTML += '<p class="comun">No hay asignaturas comunes para este nivel.</p>';
        }

        // Optativas agrupadas por bloque
        const optativasDiv = document.getElementById('optativasMaterias');
        optativasDiv.innerHTML = '<h2>Asignaturas optativas</h2>';

        if (data.optativas.length > 0) {
            // Agrupar por bloque
            const bloques = {};
            data.optativas.forEach(m => {
                if (!bloques[m.bloque]) bloques[m.bloque] = [];
                bloques[m.bloque].push(m);
            });

            for (const [bloque, materias] of Object.entries(bloques)) {
                const divBloque = document.createElement('div');
                divBloque.classList.add('bloque');

                // título del bloque con reglas
                const min = materias[0].seleccion_min || 0;
                const max = materias[0].seleccion_max || materias.length;
                divBloque.innerHTML = `<h3>${bloque} (elige entre ${min} y ${max})</h3>`;

                materias.forEach(m => {
                    const div = document.createElement('div');
                    div.classList.add('materia');
                    div.innerHTML = `
                        <label>
                            <input type="checkbox" 
                                name="materias[]" 
                                value="${m.cod_materia}" 
                                data-bloque="${bloque}"
                                data-min="${min}" 
                                data-max="${max}"
                                ${m.asignada ? 'checked' : ''}>
                            ${m.nombre}
                        </label>
                    `;
                    divBloque.appendChild(div);
                });

                optativasDiv.appendChild(divBloque);
            }
        } else {
            optativasDiv.innerHTML += '<p>No hay asignaturas optativas disponibles para este nivel.</p>';
        }
    } catch (err) {
        console.error(err);
        document.getElementById('mensaje').textContent = 'Error al cargar materias.';
    }
}

// Validar selección de bloques (reemplaza la función anterior)
function validarBloques() {
    // Construimos un objeto con info por bloque: min, max, count (seleccionadas) y opciones (total)
    const bloques = {};
    document.querySelectorAll('input[type="checkbox"][data-bloque]').forEach(chk => {
        const bloque = chk.dataset.bloque;
        const min = +chk.dataset.min || 0;
        const max = +chk.dataset.max || 0;
        if (!bloques[bloque]) bloques[bloque] = { min: min, max: max, count: 0, options: 0 };
        bloques[bloque].options += 1;
        if (chk.checked) bloques[bloque].count += 1;
    });

    // Validación individual por bloque (min/max)
    for (const [bloque, info] of Object.entries(bloques)) {
        const { min, max, count } = info;
        if (count < min || count > max) {
            alert(`El bloque "${bloque}" requiere entre ${min} y ${max} selecciones. Actualmente: ${count}`);
            return false;
        }
    }

    // Obtener todos los checkboxes de B_BACH3 y B_BACH4
const bloquesBach3 = document.querySelectorAll('input[data-bloque="B_BACH3"]');
const bloquesBach4 = document.querySelectorAll('input[data-bloque="B_BACH4"]');

// Solo aplicar regla si hay opciones en al menos uno de los bloques
if (bloquesBach3.length > 0 || bloquesBach4.length > 0) {
    const seleccionB3 = Array.from(bloquesBach3).filter(c => c.checked).length;
    const seleccionB4 = Array.from(bloquesBach4).filter(c => c.checked).length;

    // Regla: no ambos vacíos, no ambos llenos, min/max según bloque
    if ((seleccionB3 === 0 && seleccionB4 === 0) ||
        (seleccionB3 > 0 && seleccionB4 > 0) ||
        (seleccionB3 > 0 && seleccionB3 !== 2) ||
        (seleccionB4 > 0 && seleccionB4 !== 1)) {
        alert('Debes seleccionar correctamente los bloques B_BACH3 y B_BACH4 según las reglas.');
        return false;
    }
}


    // Todo ok
    return true;
}

// Guardar asignación
document.getElementById('formMaterias').addEventListener('submit', async e => {
    e.preventDefault();
    if (!validarBloques()) return;

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
            window.location.href = '../grupo/ver_group.php';
        } else {
            alert("Error: " + data.message);
        }
    } catch (err) {
        console.error(err);
        alert("Error de conexión");
    }
});

// Carga inicial
cargarMaterias();
</script>

</body>
</html>
