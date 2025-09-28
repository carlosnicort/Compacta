<?php
session_start();
header('Content-Type: application/json');
require_once __DIR__.'/../../config/db/db.php';

$id_alu = $_GET['id_alu'] ?? null;
$form_name = $_GET['form'] ?? null;

if (!$id_alu || !$form_name) {
    echo json_encode(['success'=>false,'message'=>'Faltan parámetros']);
    exit;
}

// Obtener id_form según nombre
$stmt = $pdo->prepare("SELECT id_form, descripcion FROM ti_fase0_forms WHERE nombre_form = ?");
$stmt->execute([$form_name]);
$form = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$form) {
    echo json_encode(['success'=>false,'message'=>'Formulario no encontrado']);
    exit;
}

// Obtener checkboxes y estado del alumno
$stmt = $pdo->prepare("
    SELECT c.id_checkbox, c.titulo, c.frase_si, c.frase_no,
           IFNULL(r.seleccionado,0) AS seleccionado
    FROM ti_fase0_checkboxes c
    LEFT JOIN ti_fase0_respuestas r
        ON c.id_checkbox = r.id_checkbox AND r.id_alu = ?
    WHERE c.id_form = ?
");
$stmt->execute([$id_alu, $form['id_form']]);
$checkboxes = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode([
    'success'=>true,
    'form'=>[
        'id_form'=>$form['id_form'],
        'nombre'=>$form_name,
        'descripcion'=>$form['descripcion'],
        'checkboxes'=>$checkboxes
    ]
]);
