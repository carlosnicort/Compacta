<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
if (isset($_SESSION['user_id'])) {
    // Redirigir si ya está logueado
    header("Location: ../frontend/menu.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login - Compacta Educa</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 50px; }
        .error { color: red; }
        form { max-width: 400px; }
        input { width: 100%; padding: 8px; margin: 5px 0; }
        button { padding: 8px 16px; }
    </style>
</head>
<body>
<h2>Iniciar sesión</h2>

<form id="loginForm">
    <label>Email:</label>
    <input type="email" name="email" id="email" required>
    <label>Contraseña:</label>
    <input type="password" name="password" id="password" required>
    <button type="submit">Entrar</button>
</form>

<button id="registerBtn">Crear Cuenta Nueva</button>

<div id="msg"></div>

<script>
const form = document.getElementById('loginForm');
const msgDiv = document.getElementById('msg');
const registerBtn = document.getElementById('registerBtn');

form.addEventListener('submit', async (e) => {
    e.preventDefault();
    msgDiv.textContent = "";

    const formData = new FormData(form);
    const data = Object.fromEntries(formData.entries());

    try {
			const res = await fetch('./api/login.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data),
            credentials: 'same-origin' // importante para mantener la sesión
        });
        const result = await res.json();

        if (result.success) {
            form.reset();
			window.location.href = '../frontend/menu.php';
        } else {
            msgDiv.textContent = result.message;
        }
    } catch (err) {
        msgDiv.textContent = "Error de conexión o servidor";
    }
});

registerBtn.addEventListener('click', () => {
    window.location.href = '../frontend/pages/register.php';
});
</script>
</body>
</html>
