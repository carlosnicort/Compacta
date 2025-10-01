<?php
// backend/fases/get_fase0_status.php
session_start();
header('Content-Type: application/json');
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

$ids = $_GET['ids'] ?? null;
if (!$ids) {
    echo json_encode(['success'=>false,'message'=>'Faltan parámetros']);
    exit;
}

$idsArray = array_map('intval', explode(',', $ids));
$status = [];

try {
    $formularios = ['FAMILIA','MEDIDAS PREVIAS','INFORMACIÓN RELEVANTE','R1 PEDAGOGÍA TERAPÉUTICA','R2 APOYO ORDINARIO','R3 APOYO LINGÜÍSTICO','R4 OTROS RECURSOS'];

    foreach ($idsArray as $id_alu) {
        $todosCompletos = true;

        foreach($formularios as $form) {
            $stmt = $pdo->prepare("
                SELECT COUNT(*) AS total, 
                       SUM(CASE WHEN seleccionado=1 OR valor_num IS NOT NULL THEN 1 ELSE 0 END) AS completados
                FROM ti_fase0_textos t
                LEFT JOIN ti_fase0_respuestas r ON t.id_texto=r.id_texto AND r.id_alu=?
                WHERE t.id_formulario=?
            ");
            $stmt->execute([$id_alu, $form]);
            $res = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($res['total'] > 0 && $res['completados'] < $res['total']) {
                $todosCompletos = false;
                break;
            }
        }

        $status[$id_alu] = $todosCompletos;
    }

    echo json_encode(['success'=>true,'status'=>$status]);
} catch(Exception $e) {
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}

