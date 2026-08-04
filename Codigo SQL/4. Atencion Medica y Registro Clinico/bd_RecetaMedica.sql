-- MODULO 4: ATENCION MEDICA Y REGISTRO CLINICO - RECETAS MEDICAS
USE sistema_clinica_san_gabriel;

CREATE TABLE recetas_medicas (
    idReceta INT AUTO_INCREMENT PRIMARY KEY,
    idAtencion INT NOT NULL,
    fechaEmision DATETIME DEFAULT CURRENT_TIMESTAMP,
    despachada BOOLEAN NOT NULL DEFAULT FALSE, -- TRUE si Farmacia ya despachó la receta
    CONSTRAINT fk_receta_atencion FOREIGN KEY (idAtencion) REFERENCES atenciones_medicas(idAtencion) ON DELETE CASCADE
);

SELECT * FROM recetas_medicas;
