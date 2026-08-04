-- MODULO 3: GESTION DE MEDICOS Y PROGRAMACION DE CITAS - ESPECIALIDADES
USE sistema_clinica_san_gabriel;

CREATE TABLE Especialidades (
    idEspecialidad INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

SELECT * FROM Especialidades;
