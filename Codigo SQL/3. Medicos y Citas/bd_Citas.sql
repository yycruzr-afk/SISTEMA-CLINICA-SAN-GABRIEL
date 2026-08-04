-- MODULO 3: GESTION DE MEDICOS Y PROGRAMACION DE CITAS - CITAS
USE sistema_clinica_san_gabriel;

CREATE TABLE Citas (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    idMedico INT NOT NULL,
    numeroHistoriaClinica VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Programada',
    observaciones VARCHAR(255),
    FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico)
);

SELECT * FROM Citas;
