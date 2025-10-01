<?php
if (session_status() === PHP_SESSION_NONE) session_start();
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

$input = json_decode(file_get_contents('php://input'), true);
$id_alu = $input['id_alu'] ?? null;
$codigo = $input['formulario'] ?? null;
$selecciones = $input['selecciones'] ?? null;

if (!$id_alu || !$codigo || !is_array($selecciones)) {
    echo json_encode(['success'=>false,'message'=>'Parámetros inválidos']);
    exit;
}

// Obtener id_formulario
$stmtForm = $pdo->prepare("SELECT id_formulario FROM fase0_formularios WHERE codigo = :codigo");
$stmtForm->execute([':codigo'=>$codigo]);
$id_formulario = $stmtForm->fetchColumn();

if (!$id_formulario) {
    echo json_encode(['success'=>false,'message'=>'Formulario no encontrado']);
    exit;
}

// Guardar respuestas
foreach($selecciones as $id_pregunta => $valor){
    $valor = ($valor === '' || $valor === null) ? null : $valor;

    // Comprobar si existe
    $stmtCheck = $pdo->prepare("SELECT 1 FROM fase0_respuestas WHERE id_alu = :id_alu AND id_pregunta = :id_pregunta");
    $stmtCheck->execute([':id_alu'=>$id_alu, ':id_pregunta'=>$id_pregunta]);
    $exists = $stmtCheck->fetchColumn();

    if($exists){
        $stmtUpd = $pdo->prepare("UPDATE fase0_respuestas SET valor = :valor WHERE id_alu = :id_alu AND id_pregunta = :id_pregunta");
        $stmtUpd->execute([':valor'=>$valor, ':id_alu'=>$id_alu, ':id_pregunta'=>$id_pregunta]);
    } else {
        $stmtIns = $pdo->prepare("INSERT INTO fase0_respuestas (id_alu, id_pregunta, valor) VALUES (:id_alu, :id_pregunta, :valor)");
        $stmtIns->execute([':id_alu'=>$id_alu, ':id_pregunta'=>$id_pregunta, ':valor'=>$valor]);
    }
}

echo json_encode(['success'=>true,'message'=>'Formulario guardado correctamente']);
