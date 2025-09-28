<?php
session_start();
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

// Información básica del alumno
$stmt = $pdo->prepare("
    SELECT a.id_alu, a.id_user, t.Perfil1 AS perfil
    FROM ti_alu1 a
    LEFT JOIN ti_tipologia t ON a.id_alu = t.id_alu
    WHERE a.id_alu = ?
");
$stmt->execute([$id_alu]);
$alumno = $stmt->fetch(PDO::FETCH_ASSOC);

// Formularios disponibles
$formularios = [
    'F'     => 'Formulario F',
    'MP'    => 'Formulario MP',
    'OI'    => 'Formulario OI',
    'R1PT'  => 'Formulario R1PT',
    'R2AO'  => 'Formulario R2AO',
    'R3AL'  => 'Formulario R3AL',
    'R4OA'  => 'Formulario R4OA'
];
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Fase 0 - Alumno <?= htmlspecialchars($id_alu) ?></title>
<style>
body { font-family: Arial, sans-serif; padding: 20px; }
#infoAlumno, #formularios, #contenidoFormulario { margin-bottom: 20px; padding: 10px; border: 1px solid #ccc; border-radius: 6px; background: #f9f9f9; }
#formularios button { margin-right: 5px; margin-bottom: 5px; padding: 5px 10px; cursor: pointer; }
#contenidoFormulario { min-height: 200px; }
</style>
</head>
<body>

<h2>Fase 0 - Alumno <?= htmlspecialchars($id_alu) ?></h2>

<div id="infoAlumno">
    <h3>Información del Alumno</h3>
    <p><strong>Código Centro:</strong> <?= htmlspecialchars($cod_centro) ?></p>
    <p><strong>Código Grupo:</strong> <?= htmlspecialchars($cod_grupo) ?></p>
    <p><strong>ID Alumno:</strong> <?= htmlspecialchars($alumno['id_alu']) ?></p>
</div>

<div id="formularios">
    <h3>Selecciona Formulario</h3>
    <?php foreach ($formularios as $key => $label): ?>
        <button data-form="<?= $key ?>"><?= htmlspecialchars($label) ?></button>
    <?php endforeach; ?>
</div>

<div id="contenidoFormulario">
    <p>Selecciona un formulario para editar los checkboxes del alumno.</p>
</div>

<script>
const contenido = document.getElementById('contenidoFormulario');

document.querySelectorAll('#formularios button').forEach(btn => {
    btn.addEventListener('click', async () => {
        const formulario = btn.dataset.form;

        // Obtener checkboxes del backend
		const res = await fetch('/Compacta2/backend/fases/get_fase0.php', {
			method: 'POST',
			headers: {'Content-Type':'application/json'},
			body: JSON.stringify({ formulario, id_alu: '<?= $id_alu ?>' })
		});

        const data = await res.json();

        if (!data.success) {
            contenido.innerHTML = `<p style="color:red">${data.message}</p>`;
            return;
        }

        const checkboxes = data.checkboxes;
        let html = `<h4>${formulario}</h4><form id="formFase0">`;

        checkboxes.forEach(cb => {
            const checked = cb.seleccionado ? 'checked' : '';
            html += `
                <div>
                    <label>
                        <input type="checkbox" name="cb_${cb.id_checkbox}" value="1" ${checked}>
                        ${cb.titulo}
                    </label>
                </div>
            `;
        });

        html += `<button type="submit">Guardar</button></form>`;
        contenido.innerHTML = html;

        // Guardar selección
        document.getElementById('formFase0').addEventListener('submit', async e => {
            e.preventDefault();
            const formData = new FormData(e.target);
            const selecciones = {};

            for (let [name, value] of formData.entries()) {
                const id = name.replace('cb_', '');
                selecciones[id] = 1;
            }

            checkboxes.forEach(cb => {
                if (!(cb.id_checkbox in selecciones)) selecciones[cb.id_checkbox] = 0;
            });

            const saveRes = await fetch('/Compacta2/backend/fases/save_fase0.php', {
                method: 'POST',
                headers: {'Content-Type':'application/json'},
				body: JSON.stringify({formulario, id_alu: '<?= $id_alu ?>', selecciones})
            });

            const saveData = await saveRes.json();
            alert(saveData.message);
        });
    });
});
</script>

</body>
</html>
