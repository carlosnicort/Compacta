<?php
if (session_status() === PHP_SESSION_NONE) session_start();
require __DIR__ . '/../config/db/db.php'; // Conexión PDO
require_once __DIR__ . '/../config/auth/auth.php'; // ✅ Incluye la función requireAuth()

requireAuth();

$userId = $_SESSION['user_id'];

// 1️⃣ Comprobaciones para calcular porcentaje
$porcentajeTotal = 1; // 1% por estar registrado
$detalle = [
    'registro' => 1,  // 1%
    'grupos' => 4,    // 4%
    'perfiles' => 15, // 15%
    'materias' => 10, // 10%
    'fase0' => 20,    // 20%
    'faseDUA' => 50,  // 50%
];

// 1️⃣ Registro ya está hecho, 1% fijo
$progreso = $detalle['registro'];

// 2️⃣ Grupos
$stmt = $pdo->prepare("SELECT COUNT(*) FROM ti_gr1 WHERE id_user = ?");
$stmt->execute([$userId]);
$numGrupos = (int) $stmt->fetchColumn();
$maxGrupos = ($_SESSION['rol'] === 'Director') ? 5 : 1;
$progreso += ($numGrupos / $maxGrupos) * $detalle['grupos'];

// 3️⃣ Perfiles asignados (ti_alu1)
$stmt = $pdo->prepare("SELECT COUNT(*) FROM ti_alu1 WHERE id_user = ?");
$stmt->execute([$userId]);
$numPerfiles = (int) $stmt->fetchColumn();
$stmt = $pdo->prepare("SELECT SUM(listado) FROM ti_gr1 WHERE id_user = ?");
$stmt->execute([$userId]);
$totalAlumnos = (int) $stmt->fetchColumn();
$progreso += ($totalAlumnos ? ($numPerfiles / $totalAlumnos) : 0) * $detalle['perfiles'];

// 4️⃣ Materias asignadas (ti_asignaciones)
$stmt = $pdo->prepare("
    SELECT COUNT(*) 
    FROM ti_asignaciones a
    JOIN ti_alu1 u ON a.id_alu = u.id_alu
    WHERE u.id_user = ?");
$stmt->execute([$userId]);
$numMaterias = (int) $stmt->fetchColumn();
$progreso += ($totalAlumnos ? ($numMaterias / $totalAlumnos) : 0) * $detalle['materias'];

// 5️⃣ Fase0 y 6️⃣ FaseDUA todavía 0%
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Progreso Usuario</title>
<style>
body { font-family: Arial, sans-serif; padding: 20px; }
h2 { margin-bottom: 20px; }
.barra-container {
    width: 100%;
    background: #ddd;
    border-radius: 8px;
    overflow: hidden;
    height: 30px;
}
.barra-progreso {
    height: 100%;
    display: flex;
    width: 0%;
    animation: llenar 2s forwards;
}
.bloque {
    height: 100%;
}
.bloque-registro { background: #6c5ce7; }
.bloque-grupos { background: #00b894; }
.bloque-perfiles { background: #fdcb6e; }
.bloque-materias { background: #e17055; }
.bloque-fase0 { background: #0984e3; }
.bloque-faseDUA { background: #d63031; }

/* Animación */
@keyframes llenar {
    from { width: 0%; }
    to { width: <?= round($progreso,2) ?>%; }
}

.legend {
    margin-top: 15px;
}
.legend div {
    display: inline-block;
    margin-right: 10px;
    padding: 4px 8px;
    border-radius: 4px;
    color: #fff;
    font-size: 12px;
}
.legend .registro { background: #6c5ce7; }
.legend .grupos { background: #00b894; }
.legend .perfiles { background: #fdcb6e; }
.legend .materias { background: #e17055; }
.legend .fase0 { background: #0984e3; }
.legend .faseDUA { background: #d63031; }
</style>
</head>
<body>
<h2>Seguimiento de Progreso</h2>

<div class="barra-container">
    <div class="barra-progreso">
        <div class="bloque bloque-registro" style="flex: <?= $detalle['registro'] ?>;"></div>
        <div class="bloque bloque-grupos" style="flex: <?= $detalle['grupos'] ?>;"></div>
        <div class="bloque bloque-perfiles" style="flex: <?= $detalle['perfiles'] ?>;"></div>
        <div class="bloque bloque-materias" style="flex: <?= $detalle['materias'] ?>;"></div>
        <div class="bloque bloque-fase0" style="flex: <?= $detalle['fase0'] ?>;"></div>
        <div class="bloque bloque-faseDUA" style="flex: <?= $detalle['faseDUA'] ?>;"></div>
    </div>
</div>

<p>Total completado: <?= round($progreso,2) ?>%</p>

<div class="legend">
    <div class="registro">Registro (1%)</div>
    <div class="grupos">Grupos (4%)</div>
    <div class="perfiles">Perfiles (15%)</div>
    <div class="materias">Materias (10%)</div>
    <div class="fase0">Fase0 (20%)</div>
    <div class="faseDUA">FaseDUA (50%)</div>
</div>

</body>
</html>
