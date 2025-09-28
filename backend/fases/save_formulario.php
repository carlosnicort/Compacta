<?php
// backend/fases/save_formulario.php
session_start();
header('Content-Type: application/json');
require __DIR__ . '/../../config/db/db.php';

$input = json_decode(file_get_contents("php://input"), true);
$id_alu = $_SESSION['current_id_alu'] ?? null;

if (!$id_alu || !$input || !isset($input['id_formulario']) || !isset($input['selecciones'])) {
    echo json_encode(['success' => false, 'message' => 'Faltan parámetros']);
    exit;
}

$id_formulario = $input['id_formulario'];
$selecciones = $input['selecciones']; // array[id_texto => 1|0]

// Guardar cada selección
foreach ($selecciones as $id_texto => $valor) {
    // Ver si ya existe
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM ti_fase0_alumnos WHERE id_alu = ? AND id_texto = ?");
    $stmt->execute([$id_alu, $id_texto]);
    $exists = $stmt->fetchColumn();

    if ($exists) {
        $stmt = $pdo->prepare("UPDATE ti_fase0_alumnos SET seleccionado = ?, fecha = NOW() WHERE id_alu = ? AND id_texto = ?");
        $stmt->execute([$valor, $id_alu, $id_texto]);
    } else {
        $stmt = $pdo->prepare("INSERT INTO ti_fase0_alumnos (id_alu, id_texto, seleccionado) VALUES (?, ?, ?)");
        $stmt->execute([$id_alu, $id_texto, $valor]);
    }
}

echo json_encode(['success' => true, 'message' => 'Formulario guardado correctamente']);
