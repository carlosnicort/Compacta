<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once __DIR__ . '/../src/db.php'; // conexión a la base de datos

// Verificar usuario logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

$msg = "";

// Procesar formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $cod_grupo = trim($_POST['cod_grupo'] ?? '');
    $Tipo1 = isset($_POST['Tipo1']) ? 1 : 0;
    $Informe = isset($_POST['Informe']) ? 1 : 0;
    $Perfil1 = $_POST['Perfil1'] ?? null;
    $ExtraPerfil1 = $_POST['ExtraPerfil1'] ?? null;
    $Perfil2 = $_POST['Perfil2'] ?? null;
    $ExtraPerfil2 = $_POST['ExtraPerfil2'] ?? null;
    $Otro = trim($_POST['Otro'] ?? '');

    try {
        $stmt = $pdo->prepare("
            INSERT INTO TI_tipologia
            (cod_grupo, Tipo1, Informe, Perfil1, ExtraPerfil1, Perfil2, ExtraPerfil2, Otro)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([$cod_grupo, $Tipo1, $Informe, $Perfil1, $ExtraPerfil1, $Perfil2, $ExtraPerfil2, $Otro]);
		header("Location: menu.php");
		exit();
    } catch (PDOException $e) {
        $msg = "Error: " . $e->getMessage();
    }
}

// Obtener lista de grupos para seleccionar
$gruposStmt = $pdo->query("SELECT cod_grupo FROM TI_Gr1 ORDER BY cod_grupo");
$grupos = $gruposStmt->fetchAll(PDO::FETCH_COLUMN);

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Tipología</title>
</head>
<body>
<h2>Crear Tipología</h2>

<?php if($msg): ?>
    <p style="color:<?= strpos($msg,'Error')===0 ? 'red' : 'green' ?>"><?= htmlspecialchars($msg) ?></p>
<?php endif; ?>
<form method="POST">
    <label><input type="checkbox" name="Tipo1" id="Tipo1" onclick="togglePerfil1()"> Tipo1</label><br>
    <label><input type="checkbox" name="Informe"> Informe</label><br><br>

    <label>Perfil1:</label><br>
    <select name="Perfil1" id="Perfil1" onchange="toggleExtra1(); togglePerfil2();" disabled>
        <option value="">Selecciona</option>
        <option value="TDAH">TDAH</option>
        <option value="Dislexia">Dislexia</option>
        <option value="Autismo">Autismo</option>
    </select><br><br>

    <label>ExtraPerfil1:</label><br>
    <select name="ExtraPerfil1" id="ExtraPerfil1" style="display:none;">
        <option value="">Selecciona Perfil1 primero</option>
    </select><br><br>

    <label>Perfil2:</label><br>
    <select name="Perfil2" id="Perfil2" onchange="toggleExtra2();" disabled>
        <option value="">Selecciona Perfil1 primero</option>
        <option value="TDAH">TDAH</option>
        <option value="Dislexia">Dislexia</option>
        <option value="Autismo">Autismo</option>
    </select><br><br>

    <label>ExtraPerfil2:</label><br>
    <select name="ExtraPerfil2" id="ExtraPerfil2" style="display:none;">
        <option value="">Selecciona Perfil2 primero</option>
    </select><br><br>

    <label>Otro:</label><br>
    <input type="text" name="Otro" maxlength="255"><br><br>

    <button type="submit">Guardar</button>
    <button type="button" onclick="window.location='menu.php'">Volver al Menú</button>
</form>

<script>
const extras = {
    "TDAH": ["Leve", "Moderado", "Severo"],
    "Dislexia": ["Lectora", "Escritura", "Comprensión"],
    "Autismo": ["Nivel 1", "Nivel 2", "Nivel 3"]
};

// Habilita Perfil1 si Tipo1 está marcado
function togglePerfil1() {
    const tipo1 = document.getElementById('Tipo1').checked;
    const perfil1 = document.getElementById('Perfil1');
    perfil1.disabled = !tipo1;
    if (!tipo1) {
        perfil1.value = '';
        toggleExtra1();
        togglePerfil2();
    }
}

// Muestra ExtraPerfil1 solo si Perfil1 tiene valor
function toggleExtra1() {
    const perfil1 = document.getElementById('Perfil1').value;
    const extra1 = document.getElementById('ExtraPerfil1');
    if (perfil1) {
        extra1.style.display = 'inline';
        extra1.innerHTML = '';
        extras[perfil1].forEach(opt => {
            let option = document.createElement('option');
            option.value = opt;
            option.text = opt;
            extra1.add(option);
        });
    } else {
        extra1.style.display = 'none';
        extra1.innerHTML = '<option value="">Selecciona Perfil1 primero</option>';
    }
}

// Habilita Perfil2 solo si Perfil1 tiene valor
function togglePerfil2() {
    const perfil1 = document.getElementById('Perfil1').value;
    const perfil2 = document.getElementById('Perfil2');
    perfil2.disabled = !perfil1;
    if (!perfil1) {
        perfil2.value = '';
        toggleExtra2();
    }
}

// Muestra ExtraPerfil2 solo si Perfil2 tiene valor
function toggleExtra2() {
    const perfil2 = document.getElementById('Perfil2').value;
    const extra2 = document.getElementById('ExtraPerfil2');
    if (perfil2) {
        extra2.style.display = 'inline';
        extra2.innerHTML = '';
        extras[perfil2].forEach(opt => {
            let option = document.createElement('option');
            option.value = opt;
            option.text = opt;
            extra2.add(option);
        });
    } else {
        extra2.style.display = 'none';
        extra2.innerHTML = '<option value="">Selecciona Perfil2 primero</option>';
    }
}
</script>


<p><a href="logout.php">Cerrar sesión</a></p>
</body>
</html>
