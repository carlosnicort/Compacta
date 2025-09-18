<?php
session_start();
require_once __DIR__ . '/../src/db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

// Recuperar rol y centro del usuario
$stmt = $pdo->prepare("SELECT cod_centro, rol FROM usuarios WHERE id_user = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    die("Usuario no encontrado.");
}

$rol = $user['rol'];
$cod_centro = $user['cod_centro'];

// Traer grupos según rol
if ($rol === 'Tutor') {
    $stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE id_user = ?");
    $stmt->execute([$_SESSION['user_id']]);
} elseif ($rol === 'Director') {
    $stmt = $pdo->prepare("SELECT * FROM TI_Gr1 WHERE cod_centro = ?");
    $stmt->execute([$cod_centro]);
}

$grupos = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Ver grupos</title>
</head>
<body>
<h1>Grupos</h1>

<?php if(count($grupos) === 0): ?>
    <p>No hay grupos disponibles.</p>
<?php else: ?>
<table border="1">
<tr>
    <th>Código Grupo</th>
    <th>Etapa</th>
    <th>Modalidad</th>
    <th>Curso</th>
    <th>Grupo</th>
    <th>Acciones</th>
</tr>
<?php foreach($grupos as $g): ?>
<tr>
    <td><?= htmlspecialchars($g['cod_grupo']) ?></td>
    <td><?= htmlspecialchars($g['Etapa']) ?></td>
    <td><?= htmlspecialchars($g['Modalidad']) ?></td>
    <td><?= htmlspecialchars($g['Curso']) ?></td>
    <td><?= htmlspecialchars($g['Grupo']) ?></td>
    <td>
        <a href="edit_group.php?id=<?= $g['id'] ?>">Editar</a>
    </td>
</tr>
<?php endforeach; ?>
</table>

<?php endif; ?>

<p>
<a href="create_group.php">Crear nuevo grupo</a> | 
<a href="logout.php">Cerrar sesión</a>
<a href="menu.php">Volver sin guardar</button>
</p>
</body>
</html>
