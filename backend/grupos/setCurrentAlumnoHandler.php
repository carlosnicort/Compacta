<?php
session_start();
require_once __DIR__.'/../../config/auth/auth.php';
require_once __DIR__.'/../../lib/helpers.php';
requireAuth();

// --------------------------------------------------
// 1. Recoger datos enviados por fetch (JSON)
// --------------------------------------------------
header('Content-Type: application/json');
$data = json_decode(file_get_contents("php://input"), true);

$index     = $data['index'] ?? null;          // índice del alumno, obligatorio
$cod_grupo = $data['cod_grupo'] ?? null;      // grupo
$id_user   = $data['id_user'] ?? ($_SESSION['user_id'] ?? null);
$action    = $data['action'] ?? 'tipo';       // 'tipo' o 'materias'

// --------------------------------------------------
// 2. Validación mínima
// --------------------------------------------------
$cod_centro = $_SESSION['cod_centro'] ?? null;

if (!$index || !$cod_grupo || !$id_user || !$cod_centro) {
    echo json_encode([
        'success' => false,
        'message' => 'Faltan datos para construir id_alu correctamente'
    ]);
    exit;
}

// --------------------------------------------------
// 3. Construir id_alu de forma consistente
// --------------------------------------------------
$id_alu = build_id_alu($cod_centro, $cod_grupo, (int)$index);

// --------------------------------------------------
// 4. Guardar en sesión
// --------------------------------------------------
$_SESSION['current_id_alu'] = $id_alu;
$_SESSION['current_group']  = $cod_grupo;
$_SESSION['current_index']  = (int)$index; // útil para create_tipo.php
$_SESSION['current_user']   = $id_user;

// --------------------------------------------------
// 5. Determinar redirección según acción
// --------------------------------------------------
$nextUrl = ($action === 'materias')
    ? '../../frontend/materias/asignar_materias.php'
    : '../../frontend/tipo/create_tipo.php';

// --------------------------------------------------
// 6. Respuesta JSON
// --------------------------------------------------
echo json_encode([
    'success'  => true,
    'next'     => $nextUrl,
    'id_alu'   => $id_alu,
    'cod_grupo'=> $cod_grupo,
    'index'    => (int)$index
]);
exit;
