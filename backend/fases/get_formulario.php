<?php
// backend/fases/get_formulario.php
session_start();
header('Content-Type: application/json');
require __DIR__ . '/../../config/db/db.php';

$id_alu = $_SESSION['current_id_alu'] ?? null;
$id_formulario = $_GET['id_formulario'] ?? null;

if (!$id_alu || !$id_formulario) {
    echo json_encode(['success' => false, 'message' => 'Faltan parámetros']);
    exit;
}

// Traer checkboxes del formulario
$stmt = $pdo->prepare("SELECT id_texto, titulo, frase_si, frase_no FROM ti_fase0_textos WHERE id_formulario = ?");
$stmt->execute([$id_formulario]);
$checkboxes = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Traer selección actual del alumno
$stmt2 = $pdo->prepare("SELECT id_texto, seleccionado FROM ti_fase0_alumnos WHERE id_alu = ?");
$stmt2->execute([$id_alu]);
$respuestas = $stmt2->fetchAll(PDO::FETCH_KEY_PAIR); // id_texto => seleccionado

foreach ($checkboxes as &$cb) {
    $cb['seleccionado'] = isset($respuestas[$cb['id_texto']]) ? (bool)$respuestas[$cb['id_texto']] : false;
}

echo json_encode(['success' => true, 'checkboxes' => $checkboxes]);
