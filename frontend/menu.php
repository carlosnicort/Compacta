<?php
session_start();
require __DIR__ . '/../config/db/db.php'; // Conexión PDO

// 1️⃣ Verificar sesión
if (!isset($_SESSION['user_id'])) {
    header("Location: /public/login.php");
    exit();
}

$userId = $_SESSION['user_id'];
$rol    = $_SESSION['rol'];
$nombre = $_SESSION['nombre'] ?? 'Usuario';

// 2️⃣ Contar cuántos grupos ha creado el usuario
$stmt = $pdo->prepare("SELECT COUNT(*) FROM ti_gr1 WHERE id_user = ?");
$stmt->execute([$userId]);
$numGrupos = (int) $stmt->fetchColumn();

// 3️⃣ Definir límites por rol
$maxGrupos = ($rol === 'Director') ? 5 : 1;

// 4️⃣ Calcular permisos y progreso
$puedeCrearGrupo = $numGrupos < $maxGrupos;
$progreso = 0;
if (!$puedeCrearGrupo) $progreso++;

// Para los siguientes pasos se podría agregar reglas más complejas
$puedeCrearTipo      = $progreso >= 1;
$puedeCrearMaterias  = $progreso >= 2;

// 5️⃣ Construir menú dinámico
$menu = [
    ['label' => 'Crear Grupo', 'url' => 'grupo/create_group.php', 'activo' => $puedeCrearGrupo],
    ['label' => 'Ver Grupo', 'url' => 'grupo/ver_group.php', 'activo' => true],
    ['label' => 'Siguiente: Crear Materias', 'url' => 'create_mat.php', 'activo' => $puedeCrearMaterias],
];
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Menú Principal</title>
<style>
body { font-family: Arial, sans-serif; }
ul { list-style-type: none; padding: 0; }
li { margin: 10px 0; }
a { text-decoration: none; color: blue; }
span.bloqueado { color: gray; cursor: not-allowed; }
</style>
</head>
<body>
<h2>Bienvenido, <?= htmlspecialchars($nombre) ?></h2>

<h3>Menú</h3>
<ul>
<?php foreach ($menu as $item): ?>
    <li>
        <?php if ($item['activo']): ?>
            <a href="<?= $item['url'] ?>"><?= $item['label'] ?></a>
        <?php else: ?>
            <span class="bloqueado"><?= $item['label'] ?> (bloqueado)</span>
        <?php endif; ?>
    </li>
<?php endforeach; ?>
</ul>

<p><a href="../public/logout.php">Cerrar sesión</a></p>
</body>
</html>
