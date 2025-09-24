<?php
session_start();
require_once __DIR__.'/../../config/db/db.php';
require_once __DIR__.'/../../config/auth/auth.php';
requireAuth();

header('Content-Type: application/json; charset=utf-8');

try {
    $stmt = $pdo->prepare("SELECT id, perfil, opcion FROM ti_perfiles ORDER BY id ASC");
    $stmt->execute();
    $perfiles = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $extras = [];
    foreach ($perfiles as $row) {
        $extras[$row['perfil']][] = $row['opcion'];
    }

    echo json_encode(['success'=>true,'extras'=>$extras]);
} catch (PDOException $e) {
    echo json_encode(['success'=>false,'message'=>'Error DB: '.$e->getMessage()]);
}