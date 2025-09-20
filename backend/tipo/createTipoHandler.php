<?php
// backend/tipo/createTipoHandler.php
require_once __DIR__.'/../../config/db/db.php';
require_once __DIR__.'/../../config/auth/auth.php';

requireAuth();
requireRole(['Director','Tutor']);
requireGroup($pdo);

header('Content-Type: application/json');

$cod_centro = $_SESSION['cod_centro'] ?? '';
$cod_grupo  = $_SESSION['current_group'] ?? null;

if (!$cod_grupo) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'message' => 'No se ha seleccionado ningún grupo.'
    ]);
    exit();
}

// Datos del grupo
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE cod_grupo = ? AND cod_centro = ?");
$stmt->execute([$cod_grupo, $cod_centro]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$grupo) {
    http_response_code(404);
    echo json_encode(['success'=>false,'message'=>'Grupo no encontrado']);
    exit();
}

$listado = $grupo['listado'];
$Curso   = $grupo['Curso'];
$Grupo   = $grupo['Grupo'];
$index   = max(1, intval($_GET['index'] ?? 1));

$extras = [
    "TDAH"     => ["Leve", "Moderado", "Severo"],
    "Dislexia" => ["Lectora", "Escritura", "Comprensión"],
    "Autismo"  => ["Nivel 1", "Nivel 2", "Nivel 3"]
];

// Comprobar si ya completado
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
    $data = json_decode(file_get_contents("php://input"), true) ?? [];

    $Tipo1 = isset($data['Tipo1']) ? 1 : 0;
    $Informe = isset($data['Informe']) ? 1 : 0;
    $Perfil1 = trim($data['Perfil1'] ?? '');
    $ExtraPerfil1 = trim($data['ExtraPerfil1'] ?? '');
    $Perfil2 = trim($data['Perfil2'] ?? '');
    $ExtraPerfil2 = trim($data['ExtraPerfil2'] ?? '');
    $OtrasObservaciones = trim($data['OtrasObservaciones'] ?? '');

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

    $id_alu = $cod_centro . $Curso . $Grupo . $index;
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
