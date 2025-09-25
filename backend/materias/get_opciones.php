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

    $cod_grupo = $input['cod_grupo'] ?? null;
    $id_user   = $input['id_user'] ?? null;
    $index     = $input['index'] ?? null;

    if (!$cod_grupo || !$id_user) {
        echo json_encode(['success' => false, 'message' => 'Faltan parámetros obligatorios']);
        exit;
    }

    // 1. Obtener materias optativas asociadas al grupo
    $stmt = $pdo->prepare("
        SELECT m.cod_materia, m.nombre
        FROM ti_materias m
        INNER JOIN ti_grupo_materias gm ON gm.cod_materia = m.cod_materia
        WHERE gm.cod_grupo = ? AND gm.tipo = 'optativa'
    ");
    $stmt->execute([$cod_grupo]);
    $materias = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 2. Obtener materias ya asignadas al alumno
    $stmt2 = $pdo->prepare("
        SELECT cod_materia
        FROM ti_asignaciones
        WHERE id_user = ? AND cod_grupo = ?
    ");
    $stmt2->execute([$id_user, $cod_grupo]);
    $asignadas = $stmt2->fetchAll(PDO::FETCH_COLUMN);

    // 3. Construir respuesta
    foreach ($materias as &$m) {
        $m['asignada'] = in_array($m['cod_materia'], $asignadas);
    }

    echo json_encode([
        'success' => true,
        'materias' => $materias
    ]);

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error: ' . $e->getMessage()
    ]);
}
