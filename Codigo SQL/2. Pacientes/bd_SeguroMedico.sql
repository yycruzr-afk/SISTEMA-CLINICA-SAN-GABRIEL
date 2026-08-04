-- MODULO 2: GESTION DE PACIENTES Y SEGURO MEDICO - SEGURO MEDICO
USE sistema_clinica_san_gabriel;

CREATE TABLE IF NOT EXISTS seguro_medico (
    id_seguro INT AUTO_INCREMENT PRIMARY KEY,
    compania VARCHAR(100) NOT NULL,
    numero_poliza VARCHAR(50) NOT NULL,
    tipo_cobertura VARCHAR(100) NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

SELECT * FROM seguro_medico;
