<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start(); // <--- imprescindible al principio

header('Content-Type: application/json; charset=utf-8');

require_once __DIR__.'/../../config/db/db.php';
require_once __DIR__.'/../../config/auth/auth.php';

requireAuth(); // verifica que usuario está logueado

// Chequeo extra de usuario
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success'=>false,'message'=>'Usuario no logueado']);
    exit();
}

// Validar rol
$rol = $_SESSION['rol'] ?? '';
if (!in_array($rol, ['Director','Tutor'])) {
    echo json_encode(['success'=>false,'message'=>'Rol no autorizado']);
    exit();
}

// Grupo y centro de sesión
$cod_centro = $_SESSION['cod_centro'] ?? '';
$cod_grupo  = $_SESSION['current_group'] ?? null;

if (!$cod_grupo) {
    echo json_encode(['success'=>false,'message'=>'No se ha seleccionado ningún grupo.']);
    exit();
}

// Procesar formulario POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true) ?? [];

    $id_alu = $data['id_alu'] ?? '';
    if (!$id_alu) {
        echo json_encode(['success'=>false,'message'=>'Falta id_alu en la petición']);
        exit();
    }

    $Tipo1 = isset($data['Tipo1']) ? 1 : 0;
    $Informe = isset($data['Informe']) ? 1 : 0;
    $Perfil1 = trim($data['Perfil1'] ?? '');
    $ExtraPerfil1 = trim($data['ExtraPerfil1'] ?? '');
    $Perfil2 = trim($data['Perfil2'] ?? '');
    $ExtraPerfil2 = trim($data['ExtraPerfil2'] ?? '');
    $OtrasObservaciones = trim($data['OtrasObservaciones'] ?? '');

    // Validaciones mínimas
    $error = "";
    if ($Tipo1 && !$Perfil1) $error = "Debes seleccionar Perfil1";
    elseif ($Perfil1 && !$ExtraPerfil1) $error = "Debes seleccionar ExtraPerfil1";
    elseif ($Perfil1 && !$Perfil2) $error = "Debes seleccionar Perfil2";
    elseif ($Perfil2 && !$ExtraPerfil2) $error = "Debes seleccionar ExtraPerfil2";

    if ($error) {
        http_response_code(400);
        echo json_encode(['success'=>false,'message'=>$error]);
        exit();
    }

    // Insertar o actualizar tipología
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
        $id_alu, $cod_centro, $cod_grupo,
        $Tipo1, $Informe, $Perfil1, $ExtraPerfil1, $Perfil2, $ExtraPerfil2, $OtrasObservaciones,
        $_SESSION['user_id'] // quien crea el registro
    ]);

    echo json_encode([
        'success' => true,
        'message' => 'Tipología registrada correctamente',
        'nextIndex' => ($data['nextIndex'] ?? null)
    ]);
    exit();
}

// Si no es POST
echo json_encode(['success'=>false,'message'=>'Método no permitido']);
exit();
