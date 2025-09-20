<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

// Solo GET permitido
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit();
}

$userId = $_SESSION['user_id'];
$rol    = $_SESSION['rol'];

try {
    $stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE id_user = ?");
    $stmt->execute([$userId]);
    $grupos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Para cada grupo, obtenemos los alumnos existentes en la tabla ti_alu1
    foreach ($grupos as &$g) {
        $stmt2 = $pdo->prepare("SELECT id_alu, id_user FROM ti_alu1,ti_gr1 WHERE ti_gr1.cod_grupo = ? ORDER BY id_alu");
        $stmt2->execute([$g['cod_grupo']]);
        $g['alumnos'] = $stmt2->fetchAll(PDO::FETCH_ASSOC);
    }

    echo json_encode(['success' => true, 'grupos' => $grupos]);

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Error DB: ' . $e->getMessage()]);
}
