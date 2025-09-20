<?php
session_start();

// Destruir todas las variables de sesión
$_SESSION = [];

setcookie(session_name(), '', time() - 3600, '/');
// Destruir la sesión
session_destroy();

// Redirigir al login
header("Location: index.php");
exit();
