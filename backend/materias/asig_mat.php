<?php
if (session_status() === PHP_SESSION_NONE) session_start();

require_once __DIR__ . '/../../config/db/db.php';
require_once __DIR__ . '/../../config/auth/auth.php';

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
    
    // Validar reglas de negocio
    $stmt = $pdo->prepare("SELECT * FROM ti_reglas_grupo WHERE cod_grupo = ?");
    $stmt->execute([$cod_grupo]);
    $reglas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Agrupar asignaciones por grupo_eleccion para validar
    $asignacionesPorGrupo = [];
    foreach ($asignaciones as $asignacion) {
        $grupo = $asignacion['grupo_eleccion'];
        if (!isset($asignacionesPorGrupo[$grupo])) {
            $asignacionesPorGrupo[$grupo] = [];
        }
        $asignacionesPorGrupo[$grupo][] = $asignacion;
    }
    
    // Validar cada regla
    foreach ($reglas as $regla) {
        $grupoEleccion = $regla['grupo_eleccion'];
        $seleccionadas = count($asignacionesPorGrupo[$grupoEleccion] ?? []);
        
        if ($seleccionadas < $regla['min_selecciones']) {
            throw new Exception("Debes elegir al menos {$regla['min_selecciones']} materia(s) en: {$regla['descripcion']}");
        }
        
        if ($seleccionadas > $regla['max_selecciones']) {
            throw new Exception("No puedes elegir más de {$regla['max_selecciones']} materia(s) en: {$regla['descripcion']}");
        }
    }
    
    // Iniciar transacción
    $pdo->beginTransaction();
    
    try {
        // Eliminar asignaciones previas de este alumno y grupo
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
        
        // Confirmar transacción
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