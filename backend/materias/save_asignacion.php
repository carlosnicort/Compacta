<?php
if (session_status() === PHP_SESSION_NONE) session_start();
header('Content-Type: application/json');

require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
        exit;
    }

    $cod_grupo = $_POST['cod_grupo'] ?? null;
    $id_user   = $_POST['id_user'] ?? null;
    $materias  = $_POST['materias'] ?? [];

    if (!$cod_grupo || !$id_user) {
        echo json_encode(['success' => false, 'message' => 'Faltan parámetros obligatorios']);
        exit;
    }

    // 🔹 Iniciar transacción para asegurar consistencia
    $pdo->beginTransaction();

    // 1. Eliminar asignaciones previas del alumno en este grupo
    $stmt = $pdo->prepare("DELETE FROM ti_asignaciones WHERE id_user = ? AND cod_grupo = ?");
    $stmt->execute([$id_user, $cod_grupo]);

    // 2. Insertar nuevas asignaciones
    if (!empty($materias) && is_array($materias)) {
        $stmt2 = $pdo->prepare("INSERT INTO ti_asignaciones (id_user, cod_grupo, cod_materia) VALUES (?, ?, ?)");
        foreach ($materias as $cod_materia) {
            $stmt2->execute([$id_user, $cod_grupo, $cod_materia]);
        }
    }

    // 🔹 Confirmar cambios
    $pdo->commit();

    echo json_encode([
        'success' => true,
        'message' => 'Asignación de materias guardada correctamente'
    ]);

} catch (Exception $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    echo json_encode([
        'success' => false,
        'message' => 'Error al guardar: ' . $e->getMessage()
    ]);
}
