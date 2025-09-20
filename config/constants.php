<?php
// Límites por rol
define('MAX_GRUPOS_TUTOR', 1);
define('MAX_GRUPOS_DIRECTOR', 5);

// Etapas educativas válidas
define('ETAPAS_VALIDAS', ['Infantil','Primaria','ESO','Bachillerato','FP']);

// Grupos válidos
define('GRUPOS_VALIDOS', ['A','B','C','D','E','F','G','H']);

// Número máximo de alumnos por grupo
define('MIN_ALUMNOS', 1);
define('MAX_ALUMNOS', 33);

// Extras por perfil
$PERFILES_EXTRAS = [
    "TDAH"     => ["Leve", "Moderado", "Severo"],
    "Dislexia" => ["Lectora", "Escritura", "Comprensión"],
    "Autismo"  => ["Nivel 1", "Nivel 2", "Nivel 3"]
];

// Otros valores globales opcionales
define('DEFAULT_COD_CENTRO', ''); // por si algún script necesita valor por defecto


