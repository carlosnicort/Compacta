<?php
if (session_status() === PHP_SESSION_NONE) session_start();
header('Content-Type: application/json');

require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

try {
    // Leer datos enviados por POST (JSON)
    $input = json_decode(file_get_contents("php://input"), true);
    if (!$input) {
        echo json_encode(['success' => false, 'message' => 'Datos no recibidos']);
        exit;
    }

    $cod_nivel = $input['cod_nivel'] ?? null; // ejemplo: INF1, PRI6, ESO4
    $id_alu    = $input['id_alu'] ?? null;

    if (!$cod_nivel || !$id_alu) {
        echo json_encode([
            'success' => false,
            'message' => 'Faltan parámetros obligatorios: cod_nivel o id_alu'
        ]);
        exit;
    }

    // 1. Obtener materias del nivel (comunes y optativas)
    $stmt = $pdo->prepare("
        SELECT cod_materia, nombre, tipo, bloque, seleccion_min, seleccion_max, obligatoria, descripcion
        FROM ti_materias
        WHERE FIND_IN_SET(?, niveles)
        ORDER BY bloque, orden
    ");
    $stmt->execute([$cod_nivel]);
    $materias = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 2. Obtener materias ya asignadas al alumno
    $stmt2 = $pdo->prepare("
        SELECT cod_materia
        FROM ti_asignaciones
        WHERE id_alu = ?
    ");
    $stmt2->execute([$id_alu]);
    $asignadas = $stmt2->fetchAll(PDO::FETCH_COLUMN);

    // 3. Marcar asignadas
    foreach ($materias as &$m) {
        $m['asignada'] = in_array($m['cod_materia'], $asignadas);
    }

    // 4. Separar comunes y optativas para el frontend
    $comunes   = array_values(array_filter($materias, fn($m) => $m['tipo'] === 'comun'));
    $optativas = array_values(array_filter($materias, fn($m) => $m['tipo'] === 'optativa'));

    echo json_encode([
        'success'   => true,
        'comunes'   => $comunes,
        'optativas' => $optativas
    ]);

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error: ' . $e->getMessage()
    ]);
}
