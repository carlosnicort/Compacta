<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Registro Compacta Educa</title>
<style>
body { font-family: Arial; padding: 50px; background: #f4f4f4; }
form { background: #fff; padding: 20px; max-width: 400px; margin: auto; border-radius: 6px; }
input, select { width: 100%; padding: 8px; margin: 6px 0; }
button { padding: 10px 15px; }
#errorMsg { color: red; }
#successMsg { color: green; }
</style>
</head>
<body>
<h2>Registro de usuario</h2>
<div id="errorMsg"></div>
<div id="successMsg"></div>

<form id="registerForm">
    <input type="text" name="nombre" id="nombre" placeholder="Nombre" required>
    <input type="text" name="apellidos" id="apellidos" placeholder="Apellidos" required>
    <input type="email" name="email" id="email" placeholder="Email" required>
    <input type="password" name="password" id="password" placeholder="Contraseña" required>
    <input type="text" name="cod_centro" id="cod_centro" placeholder="Código Centro" required>
    <select name="rol" id="rol" required>
        <option value="">Selecciona rol</option>
        <option value="Tutor">Tutor</option>
        <option value="Director">Director</option>
    </select>
    <input type="text" name="observaciones" id="observaciones" placeholder="Observaciones (opcional)">
    <button type="submit">Registrar</button>
</form>

<script>
document.getElementById('registerForm').addEventListener('submit', async function(e){
    e.preventDefault();

    const formData = {
        nombre: document.getElementById('nombre').value.trim(),
        apellidos: document.getElementById('apellidos').value.trim(),
        email: document.getElementById('email').value.trim(),
        password: document.getElementById('password').value,
        cod_centro: document.getElementById('cod_centro').value.trim(),
        rol: document.getElementById('rol').value,
        observaciones: document.getElementById('observaciones').value.trim()
    };

    try {
        const res = await fetch('/../../backend/auth/register.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(formData)
        });

        const data = await res.json();
        if (data.success) {
            document.getElementById('successMsg').textContent = data.message;
            document.getElementById('errorMsg').textContent = '';
            document.getElementById('registerForm').reset();
        } else {
            document.getElementById('errorMsg').textContent = data.message;
            document.getElementById('successMsg').textContent = '';
        }
    } catch (err) {
        console.error(err);
        document.getElementById('errorMsg').textContent = 'Error de conexión';
    }
});
</script>
</body>
</html>
