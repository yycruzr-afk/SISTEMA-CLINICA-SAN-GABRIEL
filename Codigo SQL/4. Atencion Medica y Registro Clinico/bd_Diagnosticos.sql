-- MODULO 4: ATENCION MEDICA Y REGISTRO CLINICO - DIAGNOSTICOS
USE sistema_clinica_san_gabriel;

CREATE TABLE diagnosticos_atencion (
    idDiagnostico INT AUTO_INCREMENT PRIMARY KEY,
    idAtencion INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) NOT NULL, -- 'Presuntivo' o 'Definitivo'
    CONSTRAINT fk_diag_atencion FOREIGN KEY (idAtencion) REFERENCES atenciones_medicas(idAtencion) ON DELETE CASCADE
);

SELECT * FROM diagnosticos_atencion;
