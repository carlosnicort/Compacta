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
.autocomplete-active { background-color: #e9e9e9; }
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

	<label>Código Centro:</label>
	<input type="text" id="cod_centro_input" placeholder="Escribe para buscar..." autocomplete="off" required>
	<div id="cod_centro_list" style="border:1px solid #ccc; max-height:150px; overflow-y:auto; display:none; position:absolute; background:white; z-index:10;"></div>



    <select name="rol" id="rol" required>
        <option value="">Selecciona rol</option>
        <option value="Tutor">Tutor</option>
        <option value="Director">Director</option>
    </select>
    <input type="text" name="observaciones" id="observaciones" placeholder="Observaciones (opcional)">
    <button type="submit">Registrar</button>
</form>
	
<p><a href="../../public/login.php">Volver al Menú</a></p>

<script>
let centros = [];
let currentFocus = -1;

// ------------------------
// 1️⃣ Cargar centros desde la BBDD
// ------------------------
async function cargarCentros() {
    try {
        const res = await fetch('../../backend/get_centros.php');
        const data = await res.json();
        if (data.success) {
            centros = data.centros; // [{cod_centro, nombre_centro}, ...]
        }
    } catch (err) {
        console.error('Error cargando centros:', err);
    }
}

// ------------------------
// 2️⃣ Mostrar lista filtrada
// ------------------------
function mostrarLista(value) {
    const listDiv = document.getElementById('cod_centro_list');
    listDiv.innerHTML = '';
    currentFocus = -1;

    if (!value) {
        listDiv.style.display = 'none';
        return;
    }

    const filtrados = centros.filter(c =>
        c.cod_centro.toLowerCase().includes(value.toLowerCase()) ||
        c.nombre_centro.toLowerCase().includes(value.toLowerCase())
    );

    filtrados.forEach(c => {
        const item = document.createElement('div');
        item.innerHTML = `<strong>${c.cod_centro}</strong> - <small>${c.nombre_centro}</small>`;
        item.style.padding = '4px';
        item.style.cursor = 'pointer';
        item.addEventListener('click', () => {
            document.getElementById('cod_centro_input').value = c.cod_centro;
            listDiv.style.display = 'none';
        });
        listDiv.appendChild(item);
    });

    listDiv.style.display = filtrados.length ? 'block' : 'none';
}

// ------------------------
// 3️⃣ Navegación con teclado
// ------------------------
function moverSeleccion(e) {
    const listDiv = document.getElementById('cod_centro_list');
    const items = listDiv.getElementsByTagName('div');
    if (!items) return;

    if (e.key === "ArrowDown") {
        currentFocus++;
        if (currentFocus >= items.length) currentFocus = 0;
        setActive(items);
    } else if (e.key === "ArrowUp") {
        currentFocus--;
        if (currentFocus < 0) currentFocus = items.length - 1;
        setActive(items);
    } else if (e.key === "Enter") {
        e.preventDefault();
        if (currentFocus > -1) items[currentFocus].click();
    }
}

function setActive(items) {
    Array.from(items).forEach(i => i.classList.remove('autocomplete-active'));
    if (currentFocus >= 0) items[currentFocus].classList.add('autocomplete-active');
}

// ------------------------
// 4️⃣ Validación submit
// ------------------------
document.getElementById('registerForm').addEventListener('submit', async function(e){
    e.preventDefault();

    const codCentroInput = document.getElementById('cod_centro_input').value.trim();

    // Validar que el cod_centro exista
    const centroValido = centros.some(c => c.cod_centro === codCentroInput);
    if (!centroValido) {
        document.getElementById('errorMsg').textContent = 'El código de centro no es válido. Selecciona uno de la lista.';
        document.getElementById('successMsg').textContent = '';
        return;
    }

    const formData = {
        nombre: document.getElementById('nombre').value.trim(),
        apellidos: document.getElementById('apellidos').value.trim(),
        email: document.getElementById('email').value.trim(),
        password: document.getElementById('password').value,
        cod_centro: codCentroInput,
        rol: document.getElementById('rol').value,
        observaciones: document.getElementById('observaciones').value.trim()
    };

    try {
        const res = await fetch('../../config/auth/register.php', {
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

// ------------------------
// 5️⃣ Eventos input y teclado
// ------------------------
document.getElementById('cod_centro_input').addEventListener('input', e => mostrarLista(e.target.value));
document.getElementById('cod_centro_input').addEventListener('keydown', moverSeleccion);

// ------------------------
// 6️⃣ Cerrar lista si clic fuera
// ------------------------
document.addEventListener('click', e => {
    if (e.target.id !== 'cod_centro_input') {
        document.getElementById('cod_centro_list').style.display = 'none';
    }
});

// ------------------------
// 7️⃣ Inicializar
// ------------------------
cargarCentros();
</script>


	
</body>
</html>
