-- Usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  nombre VARCHAR(100),
  rol ENUM('admin','user') DEFAULT 'user',
  creado_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Grupos
CREATE TABLE IF NOT EXISTS grupos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cod_centro VARCHAR(100) NOT NULL,
  etapa ENUM('Infantil','Primaria','ESO','Bachillerato','FP','Otros') NOT NULL,
  nivel VARCHAR(10) NOT NULL, -- "1º", "2º"...
  grupo CHAR(1) NOT NULL,     -- "A".."H"
  listado INT UNSIGNED NOT NULL,
  creado_por INT NULL,
  creado_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_grupos_centros FOREIGN KEY (cod_centro) 
    REFERENCES centros(cod_centro) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_grupos_usuario FOREIGN KEY (creado_por)
    REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
