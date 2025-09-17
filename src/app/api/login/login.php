<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

$raw = file_get_contents("php://input");
$data = json_decode($raw, true);

if (!isset($data["email"]) || !isset($data["password"])) {
    echo json_encode(["success" => false, "message" => "Faltan datos"]);
    exit;
}

$email = $data["email"];
$password = $data["password"];

// ⚠️ Esto en local: cambia por tus credenciales XAMPP/WAMP
$conn = new mysqli("localhost", "root", "", "compacta_educa");

if ($conn->connect_error) {
    echo json_encode(["success" => false, "message" => "Error de conexión"]);
    exit;
}

$stmt = $conn->prepare("SELECT * FROM usuarios WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if ($user && password_verify($password, $user["password"])) {
    echo json_encode(["success" => true, "message" => "Login correcto"]);
} else {
    echo json_encode(["success" => false, "message" => "Credenciales inválidas"]);
}

$conn->close();
