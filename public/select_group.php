<?php
session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php';
requireAuth();

$rol = $_SESSION['rol'] ?? '';
$cod_centro = $_SESSION['cod_centro'] ?? '';

if ($rol === 'Tutor') {
    $stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id_user = ? ORDER BY cod_grupo");
    $stmt->execute([$_SESSION['user_id']]);
} else {
    $stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE cod_centro = ? ORDER BY cod_grupo");
    $stmt->execute([$cod_centro]);
}

$grupos = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Seleccionar Grupo</title></head>
<body>
<h2>Selecciona un grupo para crear/editar Tipología</h2>

<?php if(empty($grupos)): ?>
    <p>No hay grupos disponibles.</p>
    <?php if($rol === 'Director'): ?>
        <a href="create_group.php">Crear Grupo</a>
    <?php endif; ?>
<?php else: ?>
    <ul>
        <?php foreach($grupos as $g): ?>
            <li>
                <?= htmlspecialchars($g['cod_grupo']) ?> 
                <a href="set_current_group.php?cod_grupo=<?= urlencode($g['cod_grupo']) ?>">✏️ Editar Tipología</a>
            </li>
        <?php endforeach; ?>
    </ul>
    <?php if($rol === 'Director'): ?>
        <a href="create_group.php">Crear Nuevo Grupo</a>
    <?php endif; ?>
<?php endif; ?>

<p><a href="menu.php">Volver al Menú</a></p>
<p><a href="logout.php">Cerrar sesión</a></p>
</body>
</html>
