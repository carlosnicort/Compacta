<?php
// backend/grupos/set_current.php
session_start();
header('Content-Type: application/json');

require_once __DIR__.'/../../lib/helpers.php'; // Helper para build_id_alu

// Recoger JSON
$input = json_decode(file_get_contents("php://input"), true);

// Validación mínima
if (!$input || !isset($input['index']) || !isset($input['cod_grupo'])) {
    echo json_encode([
        'success' => false,
        'message' => 'Faltan parámetros index o cod_grupo'
    ]);
    exit;
}

$cod_centro = $_SESSION['cod_centro'] ?? null;
$cod_grupo  = $input['cod_grupo'];
$index      = (int) $input['index'];

// Validar datos base
if (!$cod_centro || !$cod_grupo || $index <= 0) {
    echo json_encode([
        'success' => false,
        'message' => 'Faltan datos para construir id_alu correctamente'
    ]);
    exit;
}

// Usar id_alu del input si viene explícito, si no, construirlo
$id_alu = $input['id_alu'] ?? build_id_alu($cod_centro, $cod_grupo, $index);

// Guardar en sesión
$_SESSION['current_id_alu'] = $id_alu;
$_SESSION['current_group']  = $cod_grupo;
$_SESSION['current_index']  = $index;

// Respuesta JSON
echo json_encode([
    'success'   => true,
    'message'   => 'Alumno fijado en sesión correctamente',
    'id_alu'    => $id_alu,
    'cod_grupo' => $cod_grupo,
    'index'     => $index
]);
exit;
