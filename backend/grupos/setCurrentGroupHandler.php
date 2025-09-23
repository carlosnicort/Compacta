<?php
session_start();
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

header('Content-Type: application/json');

if (!isset($_GET['cod_grupo'])) {
    echo json_encode([
        'success' => false,
        'message' => 'Grupo no especificado'
    ]);
    exit;
}

$cod_grupo = $_GET['cod_grupo'];
$cod_centro = $_SESSION['cod_centro'] ?? '';

$stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE cod_grupo = ? AND cod_centro = ?");
$stmt->execute([$cod_grupo, $cod_centro]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    echo json_encode([
        'success' => false,
        'message' => 'Grupo no encontrado'
    ]);
    exit;
}

// Guardar grupo e índice en sesión
$_SESSION['current_group'] = $cod_grupo;
$_SESSION['current_index'] = 1;

// Generar id_alu inicial (primer alumno del grupo)
$Etapa = $grupo['Etapa'];
$Curso = $grupo['Curso'];
$GrupoLetra = $grupo['Grupo'];
$index = $_SESSION['current_index'];

$id_alu = $cod_centro . $Etapa . $Curso . $GrupoLetra . $index;
$_SESSION['current_id_alu'] = $id_alu;

echo json_encode([
    'success' => true,
    'next' => '../../frontend/tipo/create_tipo.php'
]);
exit;
