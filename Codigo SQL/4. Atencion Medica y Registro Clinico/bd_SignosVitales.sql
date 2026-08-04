-- MODULO 4: ATENCION MEDICA Y REGISTRO CLINICO - SIGNOS VITALES
USE sistema_clinica_san_gabriel;

CREATE TABLE signos_vitales (
    idSignos INT AUTO_INCREMENT PRIMARY KEY,
    idAtencion INT NOT NULL,
    pas DOUBLE NOT NULL,
    pad DOUBLE NOT NULL,
    temperatura DOUBLE NOT NULL,
    peso DOUBLE NOT NULL,
    talla DOUBLE NOT NULL,
    fc INT NOT NULL,
    fr INT NOT NULL,
    imc DOUBLE NOT NULL,
    CONSTRAINT fk_signos_atencion FOREIGN KEY (idAtencion) REFERENCES atenciones_medicas(idAtencion) ON DELETE CASCADE
);

SELECT * FROM signos_vitales;
