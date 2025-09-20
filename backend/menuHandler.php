<?php
// backend/menuHandler.php
require_once __DIR__.'/../config/db/db.php';
require_once __DIR__.'/../config/auth/auth.php';
requireAuth();

header('Content-Type: application/json');

$cod_centro = $_SESSION['cod_centro'] ?? '';
$cod_grupo = $_SESSION['current_group'] ?? null;
$tipo_completado = false;
$puedeCrear = false;

// Comprobar si hay grupo seleccionado
if ($cod_grupo) {
    $stmt = $pdo->prepare("SELECT tipo_completado FROM TI_Gr1 WHERE cod_grupo = ?");
    $stmt->execute([$cod_grupo]);
    $grupo = $stmt->fetch(PDO::FETCH_ASSOC);
    $tipo_completado = $grupo ? (bool)$grupo['tipo_completado'] : false;
}

// Comprobar permisos de creación de grupo
$stmt = $pdo->prepare("SELECT COUNT(*) FROM TI_Gr1 WHERE id_user = ?");
$stmt->execute([$_SESSION['user_id']]);
$countGrupos = $stmt->fetchColumn();

if ($_SESSION['rol'] === 'Director') {
    $puedeCrear = $countGrupos < 5;
} elseif ($_SESSION['rol'] === 'Tutor') {
    $puedeCrear = $countGrupos === 0;
}

// Obtener progreso
$stmt = $pdo->prepare("SELECT progreso FROM usuarios WHERE id_user = ?");
$stmt->execute([$_SESSION['user_id']]);
$progreso = $stmt->fetchColumn();
$progresoArray = [];

if ($progreso) {
    foreach(explode(';', $progreso) as $item) {
        [$key,$val] = explode(':', $item);
        $progresoArray[$key] = (int)$val;
    }
}

// Construir menú
$menuItems = [
    ['label'=>'Crear Grupo', 'url'=>'create_group.php', 'activo'=>$puedeCrear],
    ['label'=>'Crear Tipología', 'url'=>'create_tipo.php', 'activo'=>($progresoArray['grupo'] ?? 0) === 1],
    ['label'=>'Ver Tipología', 'url'=>'view_tipo.php', 'activo'=>($progresoArray['tipologia'] ?? 0) === 1],
    ['label'=>'Siguiente: Crear Materias', 'url'=>'create_mat.php', 'activo'=>($progresoArray['tipologia'] ?? 0) === 1],
];

echo json_encode([
    'success' => true,
    'menu' => $menuItems,
    'tipo_completado' => $tipo_completado,
    'progreso' => $progresoArray,
    'rol' => $_SESSION['rol'] ?? ''
]);
