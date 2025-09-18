<?php
session_start();
require_once __DIR__ . '/../src/db.php';

// Verificar usuario
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

// Obtener grupos del usuario
$stmt = $pdo->prepare("SELECT id, cod_centro, Etapa, Modalidad, Curso, Grupo, cod_grupo, listado 
                       FROM TI_Gr1 
                       WHERE id_user = ?");
$stmt->execute([$_SESSION['user_id']]);
$grupos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ver Grupos</title>
</head>
<body>
    <h2>Grupos creados</h2>

    <?php if (empty($grupos)): ?>
        <p>No tienes grupos creados aún.</p>
    <?php else: ?>
        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>Código Centro</th>
                <th>Etapa</th>
                <th>Modalidad</th>
                <th>Curso</th>
                <th>Grupo</th>
                <th>Código Grupo</th>
                <th>Listado</th>
                <th>Acciones</th>
            </tr>
            <?php foreach ($grupos as $g): ?>
                <tr>
                    <td><?= htmlspecialchars($g['id']) ?></td>
                    <td><?= htmlspecialchars($g['cod_centro']) ?></td>
                    <td><?= htmlspecialchars($g['Etapa']) ?></td>
                    <td><?= htmlspecialchars($g['Modalidad']) ?></td>
                    <td><?= htmlspecialchars($g['Curso']) ?></td>
                    <td><?= htmlspecialchars($g['Grupo']) ?></td>
                    <td><?= htmlspecialchars($g['cod_grupo']) ?></td>
                    <td><?= htmlspecialchars($g['listado']) ?></td>
                    <td>
                        <!-- Al hacer clic se guarda el grupo en sesión y se va a create_tipo -->
                        <a href="create_tipo.php?grupo=<?= $g['id'] ?>">Seleccionar / Crear Tipología</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>
    <?php endif; ?>
<a href="select_group.php?id=<?= $g['id'] ?>">Seleccionar</a>

    <p><a href="menu.php">⬅ Volver al menú</a></p>
</body>
</html>
