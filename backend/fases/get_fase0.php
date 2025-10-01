<?php
if (session_status() === PHP_SESSION_NONE) session_start();
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

$input = json_decode(file_get_contents('php://input'), true);
$id_alu = $input['id_alu'] ?? null;
$codigo  = $input['formulario'] ?? null;

if (!$id_alu || !$codigo) {
    echo json_encode([
        'success' => false,
        'message' => 'Parámetros inválidos',
        'input' => $input
    ]);
    exit;
}

// Obtener id_formulario a partir del código
$stmtForm = $pdo->prepare("SELECT id_formulario FROM fase0_formularios WHERE codigo = :codigo");
$stmtForm->execute([':codigo' => $codigo]);
$id_formulario = $stmtForm->fetchColumn();

if (!$id_formulario) {
    echo json_encode(['success' => false, 'message' => 'Formulario no encontrado']);
    exit;
}

// Obtener preguntas y respuestas existentes
// SQL
$stmt = $pdo->prepare("
  SELECT p.id_pregunta, p.titulo, p.tipo, r.valor
  FROM fase0_preguntas p
  LEFT JOIN fase0_respuestas r
    ON r.id_pregunta = p.id_pregunta AND r.id_alu = :id_alu
  WHERE p.id_formulario = :id_formulario
  ORDER BY p.id_pregunta
");


$stmt->execute([':id_alu'=>$id_alu, ':id_formulario'=>$id_formulario]);
$preguntas = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Comprobar si formulario completado
$totalPreguntas = count($preguntas);
$completados = 0;
foreach($preguntas as $p){
    if($p['tipo']=='numero' && $p['seleccionado'] !== null) $completados++;
    if($p['tipo']=='checkbox' && $p['seleccionado']==1) $completados++;
}
$completado = ($completados == $totalPreguntas);

echo json_encode([
    'success' => true,
    'preguntas' => $preguntas,
    'completado' => $completado
]);
