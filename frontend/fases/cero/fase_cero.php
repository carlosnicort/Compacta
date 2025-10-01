<?php
if (session_status() === PHP_SESSION_NONE) session_start();
require_once __DIR__ . '/../../../config/db/db.php';
require_once __DIR__ . '/../../../config/auth/auth.php';
requireAuth();

$id_alu = $_SESSION['current_id_alu'] ?? null;
$cod_grupo = $_SESSION['current_group'] ?? null;
$cod_centro = $_SESSION['cod_centro'] ?? null;

if (!$id_alu) {
    echo json_encode(['success' => false, 'message' => 'No se ha seleccionado ningún alumno.']);
    exit;
}
$nombre_centro = null;
if ($cod_centro) {
    $stmtCentro = $pdo->prepare("SELECT nombre_centro FROM ttcentros WHERE cod_centro = ?");
    $stmtCentro->execute([$cod_centro]);
    $nombre_centro = $stmtCentro->fetchColumn();
}

// Info alumno
$stmt = $pdo->prepare("
    SELECT a.id_alu, a.id_user, t.Perfil1 AS perfil 
    FROM ti_alu1 a 
    LEFT JOIN ti_tipologia t ON a.id_alu = t.id_alu 
    WHERE a.id_alu = ?
");
$stmt->execute([$id_alu]);
$alumno = $stmt->fetch(PDO::FETCH_ASSOC);

// Formularios
$formularios = [
    'F'=>'Formulario FAMILIA',
    'MP'=>'Formulario MEDIDAS PREVIAS',
    'IR'=>'Formulario INFORMACIÓN RELEVANTE',
    'R1PT'=>'Formulario R1 PEDAGOGÍA TERAPÉUTICA',
    'R2AO'=>'Formulario R2 APOYO ORDINARIO',
    'R3AL'=>'Formulario R3 APOYO LINGÜÍSTICO',
    'R4OR'=>'Formulario R4 OTROS RECURSOS'
];
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Fase 0</title>
<style>
body{font-family:Arial,sans-serif;padding:20px;}
#infoAlumno,#formularios,#contenidoFormulario{margin-bottom:20px;padding:10px;border:1px solid #ccc;border-radius:6px;background:#f9f9f9;}
#formularios button{margin-right:5px;margin-bottom:5px;padding:5px 10px;cursor:pointer;}
#contenidoFormulario{min-height:200px;}
input[disabled]{background:#eee;}
button.completado {
    background-color: #cce5ff; /* azul claro */
    border-color: #0066cc;
}

</style>
</head>
<body>

<h2>Fase 0</h2>

<div id="infoAlumno">
    <h3>Información del Alumno</h3>
    <p><strong>Nombre Centro:</strong> <?= htmlspecialchars($nombre_centro) ?></p>
    <p><strong>Código Grupo:</strong> <?= htmlspecialchars($cod_grupo) ?></p>
    <p><strong>ID Alumno:</strong> <?= htmlspecialchars($alumno['id_alu']) ?></p>
</div>

<div id="formularios">
    <h3>Selecciona Formulario</h3>
    <?php foreach($formularios as $codigo=>$label): ?>
        <button data-codigo="<?= htmlspecialchars($codigo) ?>"><?= htmlspecialchars($label) ?></button>
    <?php endforeach; ?>
</div>

<div id="contenidoFormulario"><p>Selecciona un formulario para editar los campos del alumno.</p></div>
<?php
if (!isset($id_alu)) {
    $id_alu = $_SESSION['id_alu'] ?? null; // o el valor que corresponda
}
?>

<script>
async function cargarFormulario(codigo, btn) {
    try {
        const res = await fetch('../../../backend/fases/get_fase0.php', {
            method: 'POST',
            headers: {'Content-Type':'application/json;charset=utf-8'},
            body: JSON.stringify({id_alu, formulario: codigo})
        });

        console.log("DEBUG status:", res.status, res.statusText);
        const rawText = await res.text();
        console.log("DEBUG respuesta RAW:", rawText);

        let data;
        try {
            data = JSON.parse(rawText);
        } catch (parseErr) {
            console.error("DEBUG: No se pudo parsear JSON", parseErr);
            contenido.innerHTML = `<p style="color:red">Respuesta inválida del servidor</p>`;
            return;
        }

        if(!data.success) {
            contenido.innerHTML = `<p style="color:red">${data.message}</p>`;
            return;
        }

        const preguntas = data.preguntas;
        let html = `<h4>${codigo}</h4><form id="formFase0">`;

        preguntas.forEach(p => {
            const val = (p.valor !== undefined && p.valor !== null) ? p.valor : '';

            if(p.tipo==='numero'){
                html += `<div>
                            <label>${p.titulo}: 
                                <input type="number" name="p_${p.id_pregunta}" value="${val}" min="0" style="width:60px;">
                            </label>
                         </div>`;
            } else if(p.tipo==='checkbox'){
                const checked = Number(p.valor) === 1 ? 'checked' : '';
                html += `<div>
                            <label>
                                <input type="checkbox" name="p_${p.id_pregunta}" value="1" ${checked}> ${p.titulo}
                            </label>
                         </div>`;
            }
        });

        html += `<button type="submit">Guardar</button></form>`;
        contenido.innerHTML = html;

        // Guardado
        const form = document.getElementById('formFase0');
        form.addEventListener('submit', async e => {
            e.preventDefault();
            const formData = new FormData(form);
            const selecciones = {};

            formData.forEach((value, name) => {
                const id = name.replace('p_','');
                const input = form.querySelector(`[name="${name}"]`);
                if(input.type==='number') selecciones[id] = value !== '' ? parseFloat(value) : null;
                else selecciones[id] = input.checked ? 1 : 0;
            });

            preguntas.forEach(p => {
                const id = p.id_pregunta.toString();
                if(!(id in selecciones)){
                    selecciones[id] = p.tipo==='checkbox' ? 0 : null;
                }
            });

            const saveRes = await fetch('../../../backend/fases/save_fase0.php', {
                method:'POST',
                headers:{'Content-Type':'application/json;charset=utf-8'},
                body: JSON.stringify({id_alu, formulario: codigo, selecciones})
            });
            const saveRaw = await saveRes.text();
            console.log("DEBUG save RAW:", saveRaw);

            let saveData;
            try { saveData = JSON.parse(saveRaw); }
            catch(e){ alert("Respuesta inválida del servidor al guardar"); return; }

            alert(saveData.message);
            actualizarBoton(btn);
        });

    } catch (err) {
        contenido.innerHTML = `<p style="color:red">Error al cargar formulario</p>`;
        console.error("ERROR en cargarFormulario:", err);
    }
}

</script>





</body>
</html>
