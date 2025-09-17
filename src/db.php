<?php
$host = "srv579.hstgr.io";
$db   = "u530590124_CompactaEduca";
$user = "u530590124_cno";
$pass = "Fernando3/5?";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("DB connection error: " . $e->getMessage());
}