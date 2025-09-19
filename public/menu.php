<?php
session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php';
requireAuth();

$cod_centro = $_SESSION['cod_centro'] ?? '';
$cod_grupo = $_SESSION['current_group'] ?? null;
$tipo_completado = false;

if ($cod_grupo) {
    $stmt = $pdo->prepare("SELECT tipo_completado FROM TI_Gr1 WHERE cod_grupo = ?");
    $stmt->execute([$cod_grupo]);
    $grupo = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($grupo) {
        $tipo_completado = (bool)$grupo['tipo_completado'];
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Principal</title>
</head>
<body>
<h2>Menú</h2>

<ul>
<?php if($_SESSION['rol'] === 'Director' || $_SESSION['rol'] === 'Tutor'): ?>
    <?php
    $puedeCrear = true;

    if ($_SESSION['rol'] === 'Tutor') {
        // Comprobar si ya tiene grupo creado
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM TI_Gr1 WHERE id_user = ?");
        $stmt->execute([$_SESSION['user_id']]);
        $gruposTutor = $stmt->fetchColumn();

        if ($gruposTutor > 0) {
            $puedeCrear = false;
        }
    }
    ?>
    <?php if($puedeCrear): ?>
        <li><a href="create_group.php">Crear Grupo</a></li>
    <?php else: ?>
        <li>Crear Grupo (ya tienes uno)</li>
    <?php endif; ?>
    <?php endif; ?>

    <li><a href="create_tipo.php">Crear Tipología</a></li>

    <li>
        <?php if($tipo_completado): ?>
            <a href="view_tipo.php">Ver Tipología</a>
        <?php else: ?>
            Ver Tipología (bloqueado hasta completar Tipología)
        <?php endif; ?>
    </li>

    <li>
        <?php if($tipo_completado): ?>
            <a href="create_mat.php">Siguiente: Crear Materias</a>
        <?php else: ?>
            Crear Materias (bloqueado hasta completar Tipología)
        <?php endif; ?>
    </li>
</ul>


<p><a href="logout.php">Cerrar sesión</a></p>
</body>
</html>
