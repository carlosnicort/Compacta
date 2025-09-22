<?php
// backend/grupos/set_current.php
session_start();

header('Content-Type: application/json');

$input = json_decode(file_get_contents("php://input"), true);

if (!$input || !isset($input['id_alu']) || !isset($input['cod_grupo'])) {
    echo json_encode([
        'success' => false,
        'message' => 'Faltan parámetros id_alu o cod_grupo'
    ]);
    exit;
}

$_SESSION['current_id_alu'] = $input['id_alu'];
$_SESSION['current_group']  = $input['cod_grupo'];

echo json_encode([
    'success' => true,
    'message' => 'Alumno fijado en sesión correctamente',
    'id_alu' => $input['id_alu'],
    'cod_grupo' => $input['cod_grupo']
]);
