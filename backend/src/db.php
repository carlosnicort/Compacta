<?php
/* $host = "srv579.hstgr.io";
$db   = "u530590124_CompactaEduca";
$user = "u530590124_cno";
$pass = "Fernando3/5?"; */

$host = "127.0.0.1";
$db   = "u530590124_compacta_educa";
$user = "root";
$pass = "";
$charset = "utf8";

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_PERSISTENT         => false,  // No persistente para evitar "gone away"
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    die("DB connection error: " . $e->getMessage());
}

/*
try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("DB connection error: " . $e->getMessage());
	
	*/