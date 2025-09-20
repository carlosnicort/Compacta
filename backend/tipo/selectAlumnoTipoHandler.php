<?php
// backend/tipo/SelectAlumnoTipoHandler.php
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

header('Content-Type: application/json');

$cod_centro = $_GET['cod_centro'] ?? '';
$cod_grupo  = $_GET['cod_grupo'] ?? '';

if (!$cod_centro || !$cod_grupo) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'message' => 'Centro o grupo no especificado.'
    ]);
    exit();
}

// Buscar alumnos del grupo
$stmt = $pdo->prepare("SELECT id_alu, nombre, apellidos 
                       FROM TI_Alu1 
                       WHERE cod_centro = ? AND cod_grupo = ? 
                       ORDER BY id_alu ASC");
$stmt->execute([$cod_centro, $cod_grupo]);
$alumnos = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!$alumnos) {
    http_response_code(404);
    echo json_encode([
        'success' => false,
        'message' => 'No se encontraron alumnos para este grupo.'
    ]);
    exit();
}

echo json_encode([
    'success' => true,
    'alumnos' => $alumnos
]);
