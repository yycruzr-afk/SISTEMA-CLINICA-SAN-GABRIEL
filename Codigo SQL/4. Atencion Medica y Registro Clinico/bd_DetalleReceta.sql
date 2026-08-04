-- MODULO 4: ATENCION MEDICA Y REGISTRO CLINICO - DETALLE RECETA
USE sistema_clinica_san_gabriel;

CREATE TABLE detalle_receta (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idReceta INT NOT NULL,
    idMedicamento INT NOT NULL,
    cantidad INT NOT NULL,
    indicacion TEXT NOT NULL,
    CONSTRAINT fk_detalle_receta FOREIGN KEY (idReceta) REFERENCES recetas_medicas(idReceta) ON DELETE CASCADE,
    CONSTRAINT fk_detalle_medicamento FOREIGN KEY (idMedicamento) REFERENCES medicamento(id_medicamento)
);

SELECT * FROM detalle_receta;
