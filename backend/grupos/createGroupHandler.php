<?php
require_once __DIR__.'/../../config/db/db.php';
require_once __DIR__.'/../../config/auth/auth.php';
requireAuth();
requireRole(['Director','Tutor']); // Solo Director o Tutor

header('Content-Type: application/json');

$cod_centro = $_SESSION['cod_centro'];
$user_id    = $_SESSION['user_id'];
$rol        = $_SESSION['rol'];

// Obtener info del centro (opcional para frontend)
$stmt = $pdo->prepare("SELECT nombre_centro, tipo_centro, loc FROM ttCentros WHERE cod_centro = ?");
$stmt->execute([$cod_centro]);
$centro = $stmt->fetch(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success'=>false,'message'=>'Método no permitido']);
    exit;
}

// Para Tutores: validar que no tengan grupo creado
if ($rol === 'Tutor') {
    $stmt2 = $pdo->prepare("SELECT COUNT(*) FROM TI_Gr1 WHERE id_user = ?");
    $stmt2->execute([$user_id]);
    $existeGrupo = $stmt2->fetchColumn() > 0;
    if ($existeGrupo) {
        echo json_encode(['success'=>false,'message'=>'Los tutores solo pueden crear un grupo. Ya existe un grupo creado.']);
        exit;
    }
}

// Recibir datos
$Etapa = trim($_POST['Etapa'] ?? '');
$Modalidad = trim($_POST['Modalidad'] ?? '');
$Curso = intval($_POST['Curso'] ?? 0);
$Grupo = trim($_POST['Grupo'] ?? '');
$listado = intval($_POST['listado'] ?? 0);

$error = false;
$grupos_validos = ['A','B','C','D','E','F','G','H'];
$alumnos_validos = range(1,33);

// Validaciones
if (!$Etapa || !$Grupo || $Curso <= 0 || $listado <= 0) $error = "Completa todos los campos.";
elseif (in_array($Etapa, ['ESO','Bachillerato','FP']) && !$Modalidad) $error = "Selecciona la Modalidad/Grado.";
elseif (!in_array($Grupo, $grupos_validos)) $error = "Grupo inválido.";
elseif (!in_array($listado, $alumnos_validos)) $error = "Número de alumnos inválido.";

// Validación Curso
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

// Insertar grupo
if (!$error) {
    $cod_grupo = strtoupper(substr($Etapa,0,3)) . $Curso . $Grupo;
    if (in_array($Etapa,['ESO','Bachillerato','FP']) && $Modalidad) {
        $cod_grupo = strtoupper(substr($Modalidad,0,3)) . $Curso . $Grupo;
    }

    try {
        $stmt = $pdo->prepare("INSERT INTO TI_Gr1
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
} else {
    echo json_encode(['success'=>false,'message'=>$error]);
    exit;
}
