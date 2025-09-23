<?php
session_start();
require_once __DIR__.'/../../config/auth/auth.php';
requireAuth();

// --------------------------------------------------
// 1. Recoger datos enviados por fetch (JSON)
// --------------------------------------------------
header('Content-Type: application/json');
$data = json_decode(file_get_contents("php://input"), true);

$id_alu    = $data['id_alu']    ?? null;
$cod_grupo = $data['cod_grupo'] ?? null;
$id_user   = $data['id_user']   ?? ($_SESSION['user_id'] ?? null);
$action    = $data['action']    ?? 'tipo'; // valores esperados: 'tipo' o 'materias'

// --------------------------------------------------
// 2. Validación mínima
// --------------------------------------------------
if (!$id_alu || !$cod_grupo || !$id_user) {
    echo json_encode([
        'success' => false,
        'message' => 'Faltan datos requeridos'
    ]);
    exit;
}

// --------------------------------------------------
// 3. Guardar en sesión
// --------------------------------------------------
$_SESSION['current_id_alu'] = $id_alu;
$_SESSION['current_group']  = $cod_grupo;
$_SESSION['current_user']   = $id_user;

// --------------------------------------------------
// 4. Determinar redirección según acción
// --------------------------------------------------
$nextUrl = ($action === 'materias')
    ? '../../frontend/materias/asignar_materias.php'
    : '../../frontend/tipo/create_tipo.php';

// --------------------------------------------------
// 5. Respuesta JSON
// --------------------------------------------------
echo json_encode([
    'success' => true,
    'next'    => $nextUrl
]);
exit;
