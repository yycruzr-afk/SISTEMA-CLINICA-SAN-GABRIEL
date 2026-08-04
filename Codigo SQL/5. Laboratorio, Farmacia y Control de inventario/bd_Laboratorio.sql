-- MODULO 5: LABORATORIO, FARMACIA Y CONTROL DE INVENTARIO - LABORATORIO
USE sistema_clinica_san_gabriel;

CREATE TABLE IF NOT EXISTS examen_laboratorio (
    id_examen INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    tipo_examen VARCHAR(100) NOT NULL,
    observaciones VARCHAR(255),
    estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente', -- 'Pendiente', 'En proceso', 'Finalizado', 'Entregado'
    fecha_solicitud DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_examen_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

CREATE TABLE IF NOT EXISTS resultado_examen (
    id_resultado INT AUTO_INCREMENT PRIMARY KEY,
    id_examen INT NOT NULL,
    detalle_resultado TEXT NOT NULL,
    observaciones VARCHAR(255),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_resultado_examen FOREIGN KEY (id_examen) REFERENCES examen_laboratorio(id_examen) ON DELETE CASCADE
);

SELECT * FROM examen_laboratorio;
SELECT * FROM resultado_examen;
