<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Login Compacta Educa</title>
<style>
/* Estilos mínimos, puedes moverlos a CSS externo */
body { font-family: Arial, sans-serif; background: #f4f4f4; padding: 50px; }
form { background: #fff; padding: 20px; border-radius: 6px; max-width: 400px; margin: auto; }
input { width: 100%; padding: 8px; margin: 6px 0; }
button { padding: 10px 15px; }
#errorMsg { color: red; }
</style>
</head>
<body>
<h2>Iniciar sesión</h2>
<div id="errorMsg"><?= $_SESSION['msg_login'] ?? '' ?></div>

<form id="loginForm">
    <input type="email" name="email" id="email" placeholder="Email" required>
    <input type="password" name="password" id="password" placeholder="Contraseña" required>
    <button type="submit">Entrar</button>
</form>

<script>
document.getElementById('loginForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();

    if (!email || !password) {
        document.getElementById('errorMsg').textContent = 'Introduce email y contraseña.';
        return;
    }

    try {
        const res = await fetch('../../backend/auth/login.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, password })
        });

        const data = await res.json();

        if (data.success) {
            // Redirigir al menú principal
            window.location.href = '../../public/menu.php';
        } else {
            document.getElementById('errorMsg').textContent = data.message;
        }
    } catch (err) {
        console.error(err);
        document.getElementById('errorMsg').textContent = 'Error de conexión.';
    }
});
</script>
</body>
</html>
