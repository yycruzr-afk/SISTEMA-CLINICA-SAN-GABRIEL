-- MODULO 3: GESTION DE MEDICOS Y PROGRAMACION DE CITAS - HORARIOS MEDICOS
USE sistema_clinica_san_gabriel;

CREATE TABLE Horarios_Medicos (
    idHorario INT AUTO_INCREMENT PRIMARY KEY,
    idMedico INT NOT NULL,
    diaSemana VARCHAR(15) NOT NULL,
    horaInicio TIME NOT NULL,
    horaFin TIME NOT NULL,
    FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico)
);

SELECT * FROM Horarios_Medicos;
