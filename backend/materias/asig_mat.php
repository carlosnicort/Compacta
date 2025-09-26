<?php
if (session_status() === PHP_SESSION_NONE) session_start();

require_once __DIR__ . '../../config/db/db.php';
require_once __DIR__ . '../../config/auth/auth.php';

header('Content-Type: application/json');

try {
    requireAuth();

    // Leer datos JSON
    $input = file_get_contents('php://input');
    $data = json_decode($input, true);

    if (!$data || !isset($data['asignaciones'])) {
        throw new Exception('Datos inválidos');
    }

    $asignaciones = $data['asignaciones'];

    if (empty($asignaciones)) {
        throw new Exception('No se han seleccionado materias');
    }

    // Validar que todas las asignaciones pertenecen al mismo alumno y grupo
    $id_alu = $asignaciones[0]['id_alu'];
    $cod_grupo = $asignaciones[0]['cod_grupo'];

    foreach ($asignaciones as $asignacion) {
        if ($asignacion['id_alu'] !== $id_alu || $asignacion['cod_grupo'] !== $cod_grupo) {
            throw new Exception('Inconsistencia en los datos de asignación');
        }
    }

    // ----------------------------
    // Validación robusta B_BACH3 / B_BACH4
    // ----------------------------
    // Mapa de posibles valores que pueden llegar del frontend
    $mapaBloques = [
        'B_BACH3' => ['B_BACH3','B-BACH3','B_Bach3','B_Bach3 '],
        'B_BACH4' => ['B_BACH4','B-BACH4','B_Bach4','B_Bach4 ']
    ];

    $conteo = ['B_BACH3' => 0, 'B_BACH4' => 0];

    foreach ($asignaciones as $a) {
        $grupoRaw = trim($a['grupo_eleccion']);
        foreach ($mapaBloques as $bloque => $valores) {
            if (in_array($grupoRaw, $valores, true)) {
                $conteo[$bloque]++;
                break;
            }
        }
    }

    // Validar reglas de negocio específicas
    if ($conteo['B_BACH3'] == 0 && $conteo['B_BACH4'] < 1) {
        throw new Exception("Si no se elige nada en B_BACH3, debes elegir al menos 1 de B_BACH4");
    }

    if ($conteo['B_BACH4'] == 0 && $conteo['B_BACH3'] < 2) {
        throw new Exception("Si no se elige nada en B_BACH4, debes elegir al menos 2 de B_BACH3");
    }

    // ----------------------------
    // Guardar asignaciones en DB
    // ----------------------------
    $pdo->beginTransaction();
    try {
        // Eliminar asignaciones previas
        $stmt = $pdo->prepare("DELETE FROM ti_asignaciones WHERE id_alu = ? AND cod_grupo = ?");
        $stmt->execute([$id_alu, $cod_grupo]);

        // Insertar nuevas asignaciones
        $stmt = $pdo->prepare("
            INSERT INTO ti_asignaciones (id_alu, cod_grupo, id_materia, grupo_eleccion) 
            VALUES (?, ?, ?, ?)
        ");

        foreach ($asignaciones as $asignacion) {
            $stmt->execute([
                $asignacion['id_alu'],
                $asignacion['cod_grupo'],
                $asignacion['id_materia'],
                $asignacion['grupo_eleccion']
            ]);
        }

        $pdo->commit();
        echo json_encode([
            'success' => true,
            'message' => 'Materias asignadas correctamente'
        ]);
    } catch (Exception $e) {
        $pdo->rollBack();
        throw $e;
    }

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}
?>
