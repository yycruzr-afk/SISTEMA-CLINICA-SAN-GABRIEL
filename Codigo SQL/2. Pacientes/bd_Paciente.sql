-- MODULO 2: GESTION DE PACIENTES Y SEGURO MEDICO - PACIENTE
USE sistema_clinica_san_gabriel;

CREATE TABLE IF NOT EXISTS paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(8) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    numero_historia_clinica VARCHAR(50) NOT NULL UNIQUE,
    id_seguro INT NULL,
    id_apoderado INT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_seguro) REFERENCES seguro_medico(id_seguro),
    FOREIGN KEY (id_apoderado) REFERENCES apoderado(id_apoderado)
);

SELECT * FROM paciente;
