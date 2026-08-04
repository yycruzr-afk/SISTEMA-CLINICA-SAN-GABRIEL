-- MODULO 3: GESTION DE MEDICOS Y PROGRAMACION DE CITAS - MEDICO ESPECIALIDAD
USE sistema_clinica_san_gabriel;

CREATE TABLE Medico_Especialidad (
    idMedico INT NOT NULL,
    idEspecialidad INT NOT NULL,
    PRIMARY KEY (idMedico, idEspecialidad),
    FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico),
    FOREIGN KEY (idEspecialidad) REFERENCES Especialidades(idEspecialidad)
);

SELECT * FROM Medico_Especialidad;
