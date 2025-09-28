<?php
// backend/fases/get_fase0.php
session_start();
header('Content-Type: application/json');
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

$input = json_decode(file_get_contents('php://input'), true);
$id_alu = $input['id_alu'] ?? null;
$formulario = $input['formulario'] ?? null;

if (!$id_alu || !$formulario) {
    echo json_encode(['success'=>false, 'message'=>'Faltan parámetros.']);
    exit;
}


try {
    // Obtener checkboxes del formulario
    $stmt = $pdo->prepare("
        SELECT 
            t.id_texto AS id_checkbox,
            t.titulo AS titulo,
            t.frase_si,
            t.frase_no,
            IFNULL(r.seleccionado,0) AS seleccionado
        FROM ti_fase0_textos t
        LEFT JOIN ti_fase0_respuestas r 
            ON t.id_texto = r.id_texto
            AND r.id_alu = ?
        WHERE t.id_formulario = ?
        ORDER BY t.id_texto ASC
    ");
    $stmt->execute([$id_alu, $formulario]);
    $checkboxes = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success'=>true, 'checkboxes'=>$checkboxes]);
} catch (Exception $e) {
    echo json_encode(['success'=>false, 'message'=>$e->getMessage()]);
}
