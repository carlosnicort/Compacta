<?php
// backend/tipo/createTipoHandler.php

// ---------------------------
// 1. Configuración inicial
// ---------------------------
session_start();
ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
error_reporting(0);
ini_set('log_errors', 1);
ini_set('error_log', __DIR__.'/createTipoHandler.log');

header('Content-Type: application/json; charset=utf-8');

// limpiar cualquier salida accidental
ob_start();

require_once __DIR__.'/../../config/db/db.php';
require_once __DIR__.'/../../config/auth/auth.php';

requireAuth();

// ---------------------------
// 2. Validaciones de sesión
// ---------------------------
if (!isset($_SESSION['user_id'])) {
    ob_end_clean();
    echo json_encode(['success'=>false,'message'=>'Usuario no logueado']);
    exit();
}

$rol = $_SESSION['rol'] ?? '';
if (!in_array($rol, ['Director','Tutor'])) {
    ob_end_clean();
    echo json_encode(['success'=>false,'message'=>'Rol no autorizado']);
    exit();
}

$cod_centro = $_SESSION['cod_centro'] ?? '';
$cod_grupo  = $_SESSION['current_group'] ?? null;

if (!$cod_grupo) {
    ob_end_clean();
    echo json_encode(['success'=>false,'message'=>'No se ha seleccionado ningún grupo.']);
    exit();
}

// ---------------------------
// 3. Procesar POST
// ---------------------------
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    ob_end_clean();
    echo json_encode(['success'=>false,'message'=>'Método no permitido']);
    exit();
}

$input = file_get_contents("php://input");
$data  = json_decode($input, true) ?? [];

// ---------------------------
// 4. Recoger datos
// ---------------------------
$id_alu = $data['id_alu'] ?? '';
if (!$id_alu) {
    ob_end_clean();
    echo json_encode(['success'=>false,'message'=>'Falta id_alu en la petición']);
    exit();
}

$Tipo1           = isset($data['Tipo1']) && $data['Tipo1'] ? 1 : 0;
$Informe         = isset($data['Informe']) && $data['Informe'] ? 1 : 0;

// Campos opcionales: si vacíos, guardar 0
$Perfil1         = !empty($data['Perfil1']) ? $data['Perfil1'] : '0';
$ExtraPerfil1    = !empty($data['ExtraPerfil1']) ? $data['ExtraPerfil1'] : '0';
$Perfil2         = !empty($data['Perfil2']) ? $data['Perfil2'] : '0';
$ExtraPerfil2    = !empty($data['ExtraPerfil2']) ? $data['ExtraPerfil2'] : '0';
$OtrasObservaciones = !empty($data['OtrasObservaciones']) ? $data['OtrasObservaciones'] : '0';

$nextIndex = $data['nextIndex'] ?? 1;

// ---------------------------
// 5. Validaciones lógicas
// ---------------------------
if ($Tipo1 === 1 && $Perfil1 === '0') {
    ob_end_clean();
    echo json_encode([
        'success' => false,
        'message' => 'Debes seleccionar un Perfil1 si activas Perfil ACNEAE'
    ]);
    exit();
}

// ---------------------------
// 6. Guardar en la base de datos
// ---------------------------
try {
    $stmt = $pdo->prepare("
        INSERT INTO ti_alu1
        (id_alu, cod_centro, cod_grupo, Tipo1, Informe, Perfil1, ExtraPerfil1, Perfil2, ExtraPerfil2, OtrasObservaciones, id_user)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE
            Tipo1 = VALUES(Tipo1),
            Informe = VALUES(Informe),
            Perfil1 = VALUES(Perfil1),
            ExtraPerfil1 = VALUES(ExtraPerfil1),
            Perfil2 = VALUES(Perfil2),
            ExtraPerfil2 = VALUES(ExtraPerfil2),
            OtrasObservaciones = VALUES(OtrasObservaciones)
    ");

    $stmt->execute([
        $id_alu,
        $cod_centro,
        $cod_grupo,
        $Tipo1,
        $Informe,
        $Perfil1,
        $ExtraPerfil1,
        $Perfil2,
        $ExtraPerfil2,
        $OtrasObservaciones,
        $_SESSION['user_id']
    ]);

} catch (Exception $e) {
    // log y respuesta JSON
    error_log($e->getMessage());
    ob_end_clean();
    echo json_encode(['success'=>false,'message'=>'Error al guardar en la base de datos']);
    exit();
}

// ---------------------------
// 7. Respuesta JSON limpia
// ---------------------------
ob_end_clean();
echo json_encode([
    'success' => true,
    'message' => 'Tipología registrada correctamente',
    'nextIndex' => $nextIndex
]);
exit();
