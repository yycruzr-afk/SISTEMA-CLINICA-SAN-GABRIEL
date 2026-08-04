-- MODULO 4: ATENCION MEDICA Y REGISTRO CLINICO - ATENCIONES MEDICAS
USE sistema_clinica_san_gabriel;

CREATE TABLE atenciones_medicas (
    idAtencion INT AUTO_INCREMENT PRIMARY KEY,
    codigoCita VARCHAR(20) NOT NULL,
    motivoConsulta TEXT NOT NULL,
    antecedentes TEXT,
    planTratamiento TEXT,
    observaciones TEXT,
    fechaAtencion DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM atenciones_medicas;
