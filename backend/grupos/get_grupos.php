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

try {
    // Traer todos los grupos del usuario
    $stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE id_user = ?");
    $stmt->execute([$userId]);
    $grupos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Para cada grupo, traer los alumnos de ti_alu1
    foreach ($grupos as &$g) {
        $stmtAlu = $pdo->prepare("SELECT id_alu FROM ti_alu1 WHERE cod_grupo = ? ORDER BY id_alu");
        $stmtAlu->execute([$g['cod_grupo']]);
        $alumnosRaw = $stmtAlu->fetchAll(PDO::FETCH_ASSOC);

       $alumnos = $stmtAlu->fetchAll(PDO::FETCH_ASSOC);
foreach ($alumnos as &$a) {
    // Comprobar si ya existe tipo para este alumno
    $stmtTipo = $pdo->prepare("SELECT 1 FROM ti_alu1 WHERE id_alu=?");
    $stmtTipo->execute([$a['id_alu']]);
    $a['tipo_creado'] = $stmtTipo->fetchColumn() ? true : false;
}
$g['alumnos'] = $alumnos;

        $g['alumnos'] = $alumnos;
    }

    echo json_encode(['success' => true, 'grupos' => $grupos]);

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Error DB: ' . $e->getMessage()]);
}
