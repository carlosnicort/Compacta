<?php
session_start();
header('Content-Type: application/json');
require_once __DIR__.'/../../config/db/db.php';

$data = json_decode(file_get_contents('php://input'), true);

// Se puede enviar:
// tipo: 'form' o 'checkbox'
// Para form: ['id_form','descripcion']
// Para checkbox: ['id_checkbox','titulo','frase_si','frase_no']

$tipo = $data['tipo'] ?? null;

try {
    if($tipo === 'form'){
        $stmt = $pdo->prepare("UPDATE ti_fase0_forms SET descripcion=? WHERE id_form=?");
        $stmt->execute([$data['descripcion'],$data['id_form']]);
    } elseif($tipo === 'checkbox'){
        $stmt = $pdo->prepare("UPDATE ti_fase0_checkboxes SET titulo=?, frase_si=?, frase_no=? WHERE id_checkbox=?");
        $stmt->execute([$data['titulo'],$data['frase_si'],$data['frase_no'],$data['id_checkbox']]);
    } else {
        throw new Exception('Tipo no válido');
    }
    echo json_encode(['success'=>true,'message'=>'Actualizado correctamente']);
} catch(Exception $e){
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
