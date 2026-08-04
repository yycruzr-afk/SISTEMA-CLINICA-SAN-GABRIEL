-- MODULO 4: ATENCION MEDICA Y REGISTRO CLINICO - MEDICAMENTO
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

SELECT * FROM medicamento;
