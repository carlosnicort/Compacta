<?php
session_start();
require_once __DIR__ . '/../src/db.php';
require_once __DIR__ . '/../src/auth.php';
requireAuth();

if (!isset($_GET['id'])) {
    die("Grupo no especificado.");
}

// Guardar grupo seleccionado en sesión
$_SESSION['current_group'] = $_GET['id'];

header("Location: menu.php");
exit();
