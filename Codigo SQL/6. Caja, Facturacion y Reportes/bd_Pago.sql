-- MODULO 6: CAJA, FACTURACION Y REPORTES - PAGO
USE sistema_clinica_san_gabriel;

CREATE TABLE IF NOT EXISTS pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_atencion INT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_pago_atencion
        FOREIGN KEY (id_atencion) REFERENCES atenciones_medicas(idAtencion)
);

SELECT * FROM pago;
