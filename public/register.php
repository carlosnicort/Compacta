<?php
require_once __DIR__ . '/../src/db.php';

$nombre = $apellidos = $email = $cod_centro = $rol = $observaciones = "";
$error = "";

// Obtener lista de centros para validación
$centros = $pdo->query("SELECT cod_centro FROM ttCentros")->fetchAll(PDO::FETCH_COLUMN);
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = trim($_POST['nombre']);
    $apellidos = trim($_POST['apellidos']);
    $email = trim($_POST['email']);
    $password = $_POST['password']; // mantenemos el campo
    $cod_centro = trim($_POST['cod_centro']);
    $rol = $_POST['rol'];
    $observaciones = trim($_POST['observaciones']);

    // Validaciones
    if (!$nombre) $error = "El nombre no puede estar vacío.";
    elseif (!$apellidos) $error = "Los apellidos no pueden estar vacíos.";
    elseif (!$password) $error = "La contraseña no puede estar vacía.";
    elseif (!in_array($cod_centro, $centros)) $error = "CODCENTRO_INVALIDO";
    elseif (!in_array($rol, ['Tutor','Director'])) $error = "Rol inválido.";
    elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) $error = "Email inválido.";

    if (!$error) {
        // Hashear contraseña
        $hash = password_hash($password, PASSWORD_DEFAULT);

        // Insertar registro
        $stmt = $pdo->prepare("INSERT INTO usuarios 
            (nombre, apellidos, email, password, cod_centro, rol, observaciones)
            VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$nombre, $apellidos, $email, $hash, $cod_centro, $rol, $observaciones]);

        echo "<script>alert('Registro completado correctamente.');window.location='index.php';</script>";
        exit;
    }
}

?>

<h2>Registro de usuario</h2>

<form method="post" id="registerForm">
    <label>Nombre: <input type="text" name="nombre" value="<?= htmlspecialchars($nombre) ?>" required></label><br><br>
    <label>Apellidos: <input type="text" name="apellidos" value="<?= htmlspecialchars($apellidos) ?>" required></label><br><br>
    <label>Email: <input type="email" name="email" value="<?= htmlspecialchars($email) ?>" required></label><br><br>
    <label>Contraseña: <input type="password" name="password" required></label><br><br>
    <label>Código Centro: <input type="text" id="cod_centro" name="cod_centro" value="<?= htmlspecialchars($cod_centro) ?>" autocomplete="off" required></label>
    <div id="lista_centros" class="autocomplete-list"></div><br><br>

    <label>Rol:
        <select name="rol" required>
            <option value="">Selecciona</option>
            <option value="Tutor" <?= $rol==='Tutor'?'selected':'' ?>>Tutor</option>
            <option value="Director" <?= $rol==='Director'?'selected':'' ?>>Director</option>
        </select>
    </label><br><br>

    <label>Observaciones:<br>
        <textarea name="observaciones" rows="4" cols="50"><?= htmlspecialchars($observaciones) ?></textarea>
    </label><br><br>

    <button type="submit">Registrar</button>
</form>
	<a href="index.php">Volver</a>

<script>
const input = document.getElementById('cod_centro');
const lista = document.getElementById('lista_centros');
const centros = <?= json_encode($centros) ?>;

input.addEventListener('input', async () => {
    const term = input.value;
    if (!term) {
        lista.innerHTML = '';
        return;
    }

    const res = await fetch(`get_centros.php?term=${encodeURIComponent(term)}`);
    const data = await res.json();

    lista.innerHTML = data.map(c => `
        <div class="item" data-cod="${c.cod_centro}">
            <strong>${c.cod_centro}</strong> - <small>${c.nombre_centro}</small>
        </div>
    `).join('');

    document.querySelectorAll('.item').forEach(el => {
        el.addEventListener('click', () => {
            input.value = el.dataset.cod;
            lista.innerHTML = '';
        });
    });
});

// Validación final antes de enviar formulario
document.getElementById('registerForm').addEventListener('submit', function(e) {
    if (!centros.includes(input.value)) {
        e.preventDefault();
        alert("Si tu centro no se incluye entre las opciones, ponte en contacto con: a@a.a");
        input.focus();
    }
});
</script>

<style>
.autocomplete-list {
    border: 1px solid #ccc;
    max-height: 200px;
    overflow-y: auto;
    position: absolute;
    background: white;
    width: 250px;
    z-index: 1000;
}
.autocomplete-list .item {
    padding: 5px;
    cursor: pointer;
}
.autocomplete-list .item:hover {
    background: #eee;
}
</style>
