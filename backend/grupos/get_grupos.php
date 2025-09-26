<?php
if (session_status() === PHP_SESSION_NONE) session_start();

require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
require_once __DIR__ . '/../../lib/helpers.php';

requireAuth();

$userId = $_SESSION['user_id'];
$rol = $_SESSION['rol'];
$cod_centro = $_SESSION['cod_centro'];

// Función auxiliar opcional para obtener la fecha de última edición de un alumno
function get_fecha_ultima_edicion($pdo, $id_alu) {
    $stmt = $pdo->prepare("SELECT fecha FROM ti_alu1 WHERE id_alu = ?");
    $stmt->execute([$id_alu]);
    $fecha = $stmt->fetchColumn();
    return $fecha ?: null;
}

try {
    // 1. Obtener grupos según rol
    if ($rol === 'Director') {
        $stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE cod_centro = ? ORDER BY cod_grupo");
        $stmt->execute([$cod_centro]);
    } else { // Tutor
        $stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE id_user = ? ORDER BY cod_grupo");
        $stmt->execute([$userId]);
    }

    $grupos = $stmt->fetchAll(PDO::FETCH_ASSOC);

 // 2. Construir lista de alumnos por grupo
foreach ($grupos as $i => $g) {
    $listado = (int) $g['listado'];
    $alumnos = [];

    for ($n = 1; $n <= $listado; $n++) {
        $id_alu = build_id_alu($g['cod_centro'], $g['cod_grupo'], $n);

        // Comprobar si ya existe tipo para este alumno
        $stmtTipo = $pdo->prepare("SELECT 1 FROM ti_alu1 WHERE id_alu = ?");
        $stmtTipo->execute([$id_alu]);
        $tipo_creado = $stmtTipo->fetchColumn() ? true : false;

        // Obtener fecha última edición
        $fecha_ultima_edicion = get_fecha_ultima_edicion($pdo, $id_alu);

        // Comprobar si tiene materias asignadas
		$stmtMat = $pdo->prepare("SELECT 1 FROM ti_asignaciones WHERE id_alu = ?");
		$stmtMat->execute([$id_alu]);
		$tiene_materias = $stmtMat->fetchColumn() ? true : false;

		// Comprobar si fase 0 completada
		$stmtFase0 = $pdo->prepare("SELECT 1 FROM ti_fase0 WHERE id_alu = ?");
		$stmtFase0->execute([$id_alu]);
		$fase0_completada = $stmtFase0->fetchColumn() ? true : false;

		// Comprobar si fase DUA completada
		$stmtFaseDUA = $pdo->prepare("SELECT 1 FROM ti_fase_dua WHERE id_alu = ?");
		$stmtFaseDUA->execute([$id_alu]);
		$faseDUA_completada = $stmtFaseDUA->fetchColumn() ? true : false;

		$alumnos[] = [
			'id_alu' => $id_alu,
			'id_user' => $g['id_user'],
			'tipo_creado' => $tipo_creado,
			'tiene_materias' => $tiene_materias,
			'fase0_completada' => $fase0_completada,
			'faseDUA_completada' => $faseDUA_completada,
			'fecha_ultima_edicion' => $fecha_ultima_edicion
		];
    }

    $grupos[$i]['alumnos'] = $alumnos;
}

    echo json_encode([
        'success' => true,
        'grupos' => $grupos
    ]);

} catch (PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error DB: ' . $e->getMessage()
    ]);
}
