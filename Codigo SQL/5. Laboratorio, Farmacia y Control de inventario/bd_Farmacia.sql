-- MODULO 5: LABORATORIO, FARMACIA Y CONTROL DE INVENTARIO - FARMACIA
USE sistema_clinica_san_gabriel;

CREATE TABLE IF NOT EXISTS medicamento (
    id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    stock_actual INT NOT NULL DEFAULT 0,
    stock_minimo INT NOT NULL DEFAULT 5,
    precio_unitario DECIMAL(10,2) NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS entrega_medicamento (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_atencion INT NOT NULL,
    id_medicamento INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_entrega DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_entrega_atencion FOREIGN KEY (id_atencion) REFERENCES atenciones_medicas(idAtencion),
    CONSTRAINT fk_entrega_medicamento FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento)
);

SELECT * FROM medicamento;
SELECT * FROM entrega_medicamento;
