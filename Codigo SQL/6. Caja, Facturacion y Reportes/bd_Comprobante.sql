-- MODULO 6: CAJA, FACTURACION Y REPORTES - COMPROBANTE
USE sistema_clinica_san_gabriel;

CREATE TABLE IF NOT EXISTS comprobante (
    id_comprobante INT AUTO_INCREMENT PRIMARY KEY,
    numero_comprobante VARCHAR(20) NOT NULL UNIQUE,
    fecha_emision DATE NOT NULL,
    tipo_comprobante VARCHAR(20) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_pago INT NOT NULL UNIQUE,
    CONSTRAINT fk_comprobante_pago
        FOREIGN KEY (id_pago) REFERENCES pago(id_pago)
);

SELECT * FROM comprobante;
