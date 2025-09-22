<?php
session_start();
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__.'/../../config/db/db.php';
require_once __DIR__.'/../../config/auth/auth.php';

requireAuth(); // Verifica que el usuario está logueado

// Validar rol
$rol = $_SESSION['rol'] ?? '';
if (!in_array($rol, ['Director','Tutor'])) {
    echo json_encode(['success'=>false,'message'=>'Rol no autorizado']);
    exit();
}

// Capturar JSON entrante
$input = json_decode(file_get_contents('php://input'), true);
if (!$input) $input = [];

// Grupo y centro de sesión
$cod_centro = $_SESSION['cod_centro'] ?? '';
$cod_grupo  = $_SESSION['current_group'] ?? '';
$listado    = $_SESSION['listado'] ?? 1;

if (!$cod_grupo) {
    echo json_encode(['success'=>false,'message'=>'No se ha seleccionado ningún grupo.']);
    exit();
}

// Obtener info del grupo
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE cod_grupo = ? AND cod_centro = ?");
$stmt->execute([$cod_grupo, $cod_centro]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    echo json_encode(['success'=>false,'message'=>'Grupo no encontrado']);
    exit();
}

$Curso = $grupo['Curso'];
$GrupoLetra = $grupo['Grupo'];
$Etapa = $grupo['Etapa'];

// Índice actual
$index = max(1, intval($input['index'] ?? 1));

// Comprobar si ya se completaron todos los alumnos
if ($index > $listado) {
    $stmt = $pdo->prepare("UPDATE TI_Gr1 SET tipo_completado = 1 WHERE cod_grupo = ?");
    $stmt->execute([$cod_grupo]);

    echo json_encode([
        'success' => true,
        'completed' => true,
        'message' => 'Todos los alumnos han sido registrados.'
    ]);
    exit();
}

// Procesar formulario POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $Tipo1 = isset($input['Tipo1']) ? 1 : 0;
    $Informe = isset($input['Informe']) ? 1 : 0;
    $Perfil1 = trim($input['Perfil1'] ?? '');
    $ExtraPerfil1 = trim($input['ExtraPerfil1'] ?? '');
    $Perfil2 = trim($input['Perfil2'] ?? '');
    $ExtraPerfil2 = trim($input['ExtraPerfil2'] ?? '');
    $OtrasObservaciones = trim($input['OtrasObservaciones'] ?? '');

    $error = '';
    if ($Tipo1 && !$Perfil1) $error = "Debes seleccionar Perfil1";
    elseif ($Perfil1 && !$ExtraPerfil1) $error = "Debes seleccionar ExtraPerfil1";
    elseif ($Perfil1 && !$Perfil2) $error = "Debes seleccionar Perfil2";
    elseif ($Perfil2 && !$ExtraPerfil2) $error = "Debes seleccionar ExtraPerfil2";

    if ($error) {
        http_response_code(400);
        echo json_encode(['success'=>false,'message'=>$error]);
        exit();
    }

    // Generar id_alu
    $id_alu = $cod_centro . $cod_grupo . $index;

    $stmt = $pdo->prepare("
        INSERT INTO ti_alu1
        (id_alu, cod_centro, cod_grupo, Tipo1, Informe, Perfil1, ExtraPerfil1, Perfil2, ExtraPerfil2, OtrasObservaciones)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ");
    $stmt->execute([
        $id_alu, $cod_centro, $cod_grupo,
        $Tipo1, $Informe, $Perfil1, $ExtraPerfil1, $Perfil2, $ExtraPerfil2, $OtrasObservaciones
    ]);

    echo json_encode([
        'success' => true,
        'message' => 'Alumno registrado correctamente',
        'nextIndex' => $index + 1
    ]);
    exit();
}

// Si no es POST
echo json_encode(['success'=>false,'message'=>'Método no permitido']);
exit();
