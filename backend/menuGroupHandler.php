<?php
// backend/grupos/MenuGroupHandler.php
session_start();
require_once __DIR__ . '/../config/db/db.php';
require_once __DIR__ . '/../config/auth/auth.php';
requireAuth();

header('Content-Type: application/json');

// Verificar grupo en sesión
if (!isset($_SESSION['ultimo_grupo'])) {
    echo json_encode([
        'success' => false,
        'message' => 'No se ha seleccionado ningún grupo.'
    ]);
    exit();
}

$cod_grupo = $_SESSION['ultimo_grupo'];

// Información del grupo
$stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE cod_grupo = ?");
$stmt->execute([$cod_grupo]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$grupo) {
    echo json_encode(['success' => false, 'message' => 'Grupo no encontrado.']);
    exit();
}

// Obtener alumnos asociados al grupo
$stmtAlu = $pdo->prepare("
    SELECT id_alu
    FROM ti_alu1
    WHERE cod_grupo = ?
    ORDER BY id_alu
");
$stmtAlu->execute([$grupo['cod_grupo']]);
$grupo['alumnos'] = $stmtAlu->fetchAll(PDO::FETCH_ASSOC);

// Información del centro
$stmt2 = $pdo->prepare("SELECT * FROM ttCentros WHERE cod_centro = ?");
$stmt2->execute([$grupo['cod_centro']]);
$centro = $stmt2->fetch(PDO::FETCH_ASSOC);

// Definir formularios y estado (activo)
$formItems = [
    ['label' => 'Perfiles del alumnado', 'url' => 'form_alumnos.php', 'activo' => true],
    ['label' => 'Materias Optativas', 'url' => 'form_horarios.php', 'activo' => true],
    ['label' => 'Fase 2', 'url' => 'form_evaluaciones.php', 'activo' => true],
    // Agregar más pasos según la lógica de progreso
];

echo json_encode([
    'success' => true,
    'grupo' => $grupo,
    'centro' => $centro,
    'formularios' => $formItems
]);
