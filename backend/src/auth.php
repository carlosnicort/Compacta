<?php
// Inicializar sesión de forma segura
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

/**
 * Obliga a que el usuario esté logueado
 */
function requireAuth() {
    if (!isset($_SESSION['user_id'])) {
        header("Location: login.php");
        exit();
    }
}

/**
 * Controla que el usuario tenga uno de los roles permitidos
 * @param array $roles Array con los roles permitidos
 */
function requireRole(array $roles) {
    if (!in_array($_SESSION['rol'], $roles)) {
        die("Acceso denegado");
    }
}

/**
 * Controla que haya un grupo seleccionado y que pertenezca al usuario o centro
 * @param PDO $pdo Conexión a la base de datos
 */
function requireGroup($pdo) {
    if (!isset($_SESSION['current_group'])) {
        header("Location: select_group.php");
        exit();
    }

    $cod_grupo  = $_SESSION['current_group'];
    $cod_centro = $_SESSION['cod_centro'];
    $user_id    = $_SESSION['user_id'];

    // Validar que el grupo pertenece al centro o al usuario (Tutor)
    $stmt = $pdo->prepare("
        SELECT cod_grupo FROM TI_Gr1 
        WHERE cod_grupo = ? 
        AND (cod_centro = ? OR id_user = ?)
    ");
    $stmt->execute([$cod_grupo, $cod_centro, $user_id]);

    if (!$stmt->fetch()) {
        die("Grupo inválido o no autorizado");
    }
}

/**
 * Inicializa automáticamente current_group para Tutores que tengan un grupo
 * @param PDO $pdo Conexión a la base de datos
 */
function initTutorGroup($pdo) {
    if ($_SESSION['rol'] === 'Tutor' && !isset($_SESSION['current_group'])) {
        $stmt = $pdo->prepare("SELECT cod_grupo FROM TI_Gr1 WHERE id_user = ?");
        $stmt->execute([$_SESSION['user_id']]);
        $grupoTutor = $stmt->fetchColumn();
        if ($grupoTutor) {
            $_SESSION['current_group'] = $grupoTutor;
        }
    }
}
