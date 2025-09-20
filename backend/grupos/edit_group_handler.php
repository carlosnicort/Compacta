<?php
session_start();
require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';
requireAuth();

header('Content-Type: application/json');

$id = intval($_GET['id'] ?? 0);
if ($id <= 0) {
    echo json_encode(['success'=>false, 'message'=>'Grupo no especificado']);
    exit;
}

// Recuperar datos del grupo
$stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id = ?");
$stmt->execute([$id]);
$grupo = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$grupo) {
    echo json_encode(['success'=>false, 'message'=>'Grupo no encontrado']);
    exit;
}

// Solo el creador o director del centro pueden editar
if ($_SESSION['rol'] === 'Tutor' && $grupo['id_user'] != $_SESSION['user_id']) {
    echo json_encode(['success'=>false, 'message'=>'No tienes permiso para editar este grupo']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $Etapa = trim($_POST['Etapa'] ?? '');
    $Modalidad = trim($_POST['Modalidad'] ?? '');
    $Curso = intval($_POST['Curso'] ?? 0);
    $Grupo = trim($_POST['Grupo'] ?? '');
    $listado = intval($_POST['listado'] ?? 0);

    // Validaciones básicas
    if (!$Etapa || !$Grupo || $Curso <= 0 || $listado <= 0) {
        echo json_encode(['success'=>false, 'message'=>'Completa todos los campos correctamente']);
        exit;
    }

    // Generación del código de grupo
    if (in_array($Etapa, ['ESO','Bachillerato','FP']) && $Modalidad) {
        $cod_grupo = strtoupper(substr($Modalidad,0,3)).$Curso.$Grupo;
    } else {
        $cod_grupo = strtoupper(substr($Etapa,0,3)).$Curso.$Grupo;
    }

    try {
        $stmt = $pdo->prepare("
            UPDATE TI_Gr1 
            SET Etapa=?, Modalidad=?, Curso=?, Grupo=?, cod_grupo=?, listado=? 
            WHERE id=?
        ");
        $stmt->execute([$Etapa, $Modalidad, $Curso, $Grupo, $cod_grupo, $listado, $id]);

        echo json_encode(['success'=>true, 'message'=>'Grupo actualizado correctamente']);
        exit;
    } catch (PDOException $e) {
        echo json_encode(['success'=>false, 'message'=>'Error al actualizar el grupo: '.$e->getMessage()]);
        exit;
    }
}

// Si no es POST, devolvemos los datos del grupo
echo json_encode(['success'=>true, 'grupo'=>$grupo]);
