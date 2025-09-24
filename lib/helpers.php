<?php
function build_id_alu(string $cod_centro, string $cod_grupo, int $index): string {
    // index sin padding: 1,2,3...
    return $cod_centro . $cod_grupo . $index;
}