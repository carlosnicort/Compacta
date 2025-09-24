<?php
if (session_status() === PHP_SESSION_NONE) session_start();

require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
require_once __DIR__ . '/../../lib/helpers.php';

requireAuth();

$userId = $_SESSION['user_id'];

try {
    // Obtener todos los grupos del usuario
    $stmt = $pdo->prepare("SELECT * FROM ti_gr1 WHERE id_user = ?");
    $stmt->execute([$userId]);
    $grupos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($grupos as $i => $g) {
        $listado = (int) $g['listado'];
        $alumnos = [];

        for ($n = 1; $n <= $listado; $n++) {
            // Construir id_alu consistente con create_tipo.php
            $id_alu = build_id_alu($g['cod_centro'], $g['cod_grupo'], $n);

            // Comprobar si ya existe tipo para este alumno
            $stmtTipo = $pdo->prepare("SELECT 1 FROM ti_alu1 WHERE id_alu = ?");
            $stmtTipo->execute([$id_alu]);
            $tipo_creado = $stmtTipo->fetchColumn() ? true : false;

            $alumnos[] = [
                'id_alu' => $id_alu,
                'id_user' => $userId,
                'tipo_creado' => $tipo_creado
            ];
        }

        $grupos[$i]['alumnos'] = $alumnos;
    }

    echo json_encode([
        'success' => true,
        'grupos' => $grupos
    ]);

} catch (PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error DB: ' . $e->getMessage()
    ]);
}
