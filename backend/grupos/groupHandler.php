<?php
require_once __DIR__.'/../../config/db/db.php';
require_once __DIR__.'/../../config/auth/auth.php';

requireAuth();
requireRole(['Director','Tutor']); // Solo Director o Tutor

header('Content-Type: application/json');

// Solo POST permitido
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success'=>false,'message'=>'Método no permitido']);
    exit;
}

// Recibir datos según tipo de request (POST normal o fetch JSON)
if (strpos($_SERVER['CONTENT_TYPE'] ?? '', 'application/json') !== false) {
    $raw = file_get_contents('php://input');
    $data = json_decode($raw, true);
} else {
    $data = $_POST;
}

// Extraer campos
$Etapa    = trim($data['Etapa'] ?? '');
$Modalidad= trim($data['Modalidad'] ?? '');
$Curso    = intval($data['Curso'] ?? 0);
$Grupo    = trim($data['Grupo'] ?? '');
$listado  = intval($data['listado'] ?? 0);

$cod_centro = $_SESSION['cod_centro'];
$user_id    = $_SESSION['user_id'];
$rol        = $_SESSION['rol'];

// Validaciones básicas
$error = false;
$grupos_validos = ['A','B','C','D','E','F','G','H'];
$alumnos_validos = range(1,33);

if (!$Etapa || !$Grupo || $Curso <= 0 || $listado <= 0) $error = "Completa todos los campos.";
elseif (in_array($Etapa, ['ESO','Bachillerato','FP']) && !$Modalidad) $error = "Selecciona la Modalidad/Grado.";
elseif (!in_array($Grupo, $grupos_validos)) $error = "Grupo inválido.";
elseif (!in_array($listado, $alumnos_validos)) $error = "Número de alumnos inválido.";

// Validación Curso según etapa y modalidad
if (!$error) {
    $maxCurso = match($Etapa) {
        'Infantil' => 3,
        'Primaria' => 6,
        'ESO' => ($Modalidad === 'ESO') ? 4 : 2,
        'Bachillerato', 'FP' => 2,
        default => 3
    };
    if ($Curso < 1 || $Curso > $maxCurso) $error = "Curso fuera de rango.";
}

// Limite de grupos por rol
if (!$error) {
    $stmt2 = $pdo->prepare("SELECT COUNT(*) FROM ti_gr1 WHERE id_user = ?");
    $stmt2->execute([$user_id]);
    $numGrupos = (int)$stmt2->fetchColumn();
    $maxGrupos = ($rol === 'Director') ? 5 : 1;

    if ($numGrupos >= $maxGrupos) {
        $error = "Has alcanzado el número máximo de grupos que puedes crear";
    }
}

if ($error) {
    echo json_encode(['success'=>false,'message'=>$error]);
    exit;
}

// Generar cod_grupo
$cod_grupo = strtoupper(substr($Etapa,0,3)) . $Curso . $Grupo;
if (in_array($Etapa,['ESO','Bachillerato','FP']) && $Modalidad) {
    $cod_grupo = strtoupper(substr($Modalidad,0,3)) . $Curso . $Grupo;
}

// Insertar grupo
try {
    $stmt = $pdo->prepare("INSERT INTO ti_gr1
        (cod_centro, Etapa, Modalidad, Curso, Grupo, cod_grupo, listado, id_user)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$cod_centro, $Etapa, $Modalidad, $Curso, $Grupo, $cod_grupo, $listado, $user_id]);

    $_SESSION['ultimo_grupo'] = $cod_grupo;
    $_SESSION['current_group'] = $cod_grupo;

    echo json_encode(['success'=>true,'message'=>'Grupo creado correctamente']);
    exit;

} catch (PDOException $e) {
    echo json_encode(['success'=>false,'message'=>'Error al crear el grupo: '.$e->getMessage()]);
    exit;
}
