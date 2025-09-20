<?php
require_once __DIR__ . '/../config/db/db.php';
require_once __DIR__ . '/../config/auth/auth.php';
requireAuth();

$rol = $_SESSION['rol'] ?? '';
$user_id = $_SESSION['user_id'] ?? '';
$cod_centro = $_SESSION['cod_centro'] ?? '';

$result = [
    'status' => 'ok',
    'redirect' => null,
    'grupos' => []
];

// Si es Tutor, tiene solo 1 grupo y vamos directos a alumnos
if ($rol === 'Tutor') {
    $stmt = $pdo->prepare("SELECT cod_grupo FROM TI_Gr1 WHERE id_user = ?");
    $stmt->execute([$user_id]);
    $grupo = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($grupo) {
        $result['redirect'] = "select_alumno_tipo.php?cod_centro={$cod_centro}&cod_grupo={$grupo['cod_grupo']}";
    } else {
        $result['status'] = 'error';
        $result['message'] = 'No se encontraron grupos para este tutor.';
    }
} else { // Director: puede elegir entre varios grupos
    $stmt = $pdo->prepare("SELECT cod_grupo FROM TI_Gr1 WHERE cod_centro = ? ORDER BY cod_grupo ASC");
    $stmt->execute([$cod_centro]);
    $result['grupos'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

return $result;
