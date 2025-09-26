<?php 
if (session_status() === PHP_SESSION_NONE) session_start();
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();
// Obtener código de centro del usuario
$cod_centro = $_SESSION['cod_centro'] ?? null;

// Inicializar array centro para evitar warnings
$centro = [
    'nombre_centro' => '',
    'tipo_centro'   => '',
    'loc'           => ''
];

if ($cod_centro) {
    $stmt = $pdo->prepare("SELECT nombre_centro, tipo_centro, loc FROM ttcentros WHERE cod_centro = ?");
    $stmt->execute([$cod_centro]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($row) {
        $centro = $row;
    }
}
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
#infoCentro {
    border: 2px solid #0066cc;
    border-radius: 8px;
    padding: 10px 15px;
    margin: 15px 0;
    background-color: #f0f8ff;
    font-size: 14px;
}
#infoCentro p {
    margin: 5px 0;
}
#infoCentro span {
    color: #003366;
    font-weight: bold;
}
    table { border-collapse: collapse; width: 100%; }
    th, td { padding: 8px; border: 1px solid #ccc; text-align: left; }
    .subfila { background-color: #f9f9f9; }
    a.bloqueado { color: gray; pointer-events: none; text-decoration: none; }
</style>
</head>
<body>
<h1>Grupos</h1>

<div id="infoCentro" style="border:1px solid #ccc; padding:10px; margin-bottom:15px;">
    <h3>Información del centro</h3>
    <p><strong>Código de centro:</strong> <span id="infoCodCentro"><?= htmlspecialchars($cod_centro) ?></span></p>
    <p><strong>Nombre:</strong> <span id="infoNombreCentro"><?= htmlspecialchars($centro['nombre_centro']) ?></span></p>
    <p><strong>Tipo:</strong> <span id="infoTipoCentro"><?= htmlspecialchars($centro['tipo_centro']) ?></span></p>
    <p><strong>Localización:</strong> <span id="infoLocCentro"><?= htmlspecialchars($centro['loc']) ?></span></p>
</div>
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
        <th>Acciones</th>
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
    const cuerpo = document.getElementById('cuerpoTabla');
    cuerpo.innerHTML = '';

    const data = await res.json();

    if (!data.success) {
        document.getElementById('mensaje').textContent = data.message;
        return;
    }

    if (!Array.isArray(data.grupos) || data.grupos.length === 0) {
        cuerpo.innerHTML = '<tr><td colspan="7">No hay grupos disponibles</td></tr>';
        return;
    }

		// ID de usuario actual
		const idUser = '<?= $_SESSION['user_id'] ?>';

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

			// Filas de alumnos
			for (let i = 1; i <= g.listado; i++) {
				const alumno = g.alumnos && g.alumnos[i-1] ? g.alumnos[i-1] : { id_user: idUser, tipo_creado: false, tiene_materias: false, fecha_ultima_edicion: null };

				const trAlumno = document.createElement('tr');
				trAlumno.classList.add('subfila');

				// Texto dinámico según estado
				const linkTipo = alumno.tipo_creado ? 'Ver/Editar Perfil' : 'Crear Tipo';

				// Activar link de materias solo si el tipo ya está creado
				const linkMaterias = alumno.tipo_creado 
					? (alumno.tiene_materias ? 'Editar Materias' : 'Asignar Materias') 
					: 'No disponible';
				const linkClass = alumno.tipo_creado ? 'set-alumno' : 'bloqueado';

				const fechaEdit = alumno.fecha_ultima_edicion ? alumno.fecha_ultima_edicion : '-';

				trAlumno.innerHTML = `
					<td>${alumno.id_alu}</td>
					<td>${alumno.id_user || ''}</td>
					<td>
						<a href="#" class="set-alumno" data-index="${i}" data-codgrupo="${g.cod_grupo}" data-action="tipo">
							${linkTipo}
						</a>
					</td>
					<td>
						<a href="#" class="${linkClass}" data-index="${i}" data-codgrupo="${g.cod_grupo}" data-idalu="${alumno.id_alu}" data-action="materias">
							${linkMaterias}
						</a>
					</td>
					<td colspan="3">Última edición: ${fechaEdit}</td>
				`;
				cuerpo.appendChild(trAlumno);
			}

		}


    // ----------------------------
    // Delegación de eventos: click en cualquier .set-alumno
    // ----------------------------
    document.getElementById('cuerpoTabla').addEventListener('click', async e => {
        const el = e.target.closest('.set-alumno');
        if (!el) return;

        e.preventDefault();
        const index = el.dataset.index;
        const cod_grupo = el.dataset.codgrupo;
        const action = el.dataset.action;
        const id_alu = el.dataset.idalu;

        try {	
            const resp = await fetch('../../backend/session/set_current.php', {
                method: 'POST',
                body: JSON.stringify({ index, cod_grupo, id_alu }),
                headers: { 'Content-Type': 'application/json' },
                credentials: 'same-origin'
            });
            const data = await resp.json();
            if (data.success) {
                // Redirige según acción
                if (action === 'tipo') {
                    window.location.href = '../../frontend/tipo/create_tipo.php';
                } else if (action === 'materias') {
                    window.location.href = '../materias/asignar_mat.php';
                }
            } else {
                alert("Error al fijar el alumno: " + data.message);
            }
        } catch (err) {
            alert("Error de conexión");
            console.error(err);
        }
    });
}

// Carga inicial
cargarGrupos();
</script>

</body>
</html>
