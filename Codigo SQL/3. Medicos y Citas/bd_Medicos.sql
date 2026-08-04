-- MODULO 3: GESTION DE MEDICOS Y PROGRAMACION DE CITAS - MEDICOS
USE sistema_clinica_san_gabriel;

CREATE TABLE Medicos (
    idMedico INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    colegiatura VARCHAR(20) NOT NULL UNIQUE,
    dni VARCHAR(15) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    CONSTRAINT fk_Medicos_usuarios
        FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario)
        ON DELETE RESTRICT
);

SELECT * FROM Medicos;
