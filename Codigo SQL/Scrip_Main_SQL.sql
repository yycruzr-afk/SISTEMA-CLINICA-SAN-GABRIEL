-- SCRIPT PRINCIPAL - CLINICA SAN GABRIEL (MODULOS 1 AL 6)
-- Al inicio: RESET total de la base de datos (DROP + CREATE). No se insertan datos.

DROP DATABASE IF EXISTS sistema_clinica_san_gabriel;
CREATE DATABASE sistema_clinica_san_gabriel;
USE sistema_clinica_san_gabriel;

-- MODULO 1: SEGURIDAD, AUTENTICACION Y MENU DINAMICO
CREATE TABLE Usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(30) NOT NULL,
    estado BOOLEAN DEFAULT TRUE
);

CREATE TABLE Auditorias (
    idAuditoria INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    modulo VARCHAR(50) NOT NULL,
    operacion VARCHAR(255) NOT NULL,
    CONSTRAINT fk_auditoria_usuario
        FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario)
        ON DELETE RESTRICT
);

-- MODULO 2: GESTION DE PACIENTES Y SEGURO MEDICO
CREATE TABLE IF NOT EXISTS apoderado (
    id_apoderado INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(8) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    parentesco VARCHAR(50) NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS seguro_medico (
    id_seguro INT AUTO_INCREMENT PRIMARY KEY,
    compania VARCHAR(100) NOT NULL,
    numero_poliza VARCHAR(50) NOT NULL,
    tipo_cobertura VARCHAR(100) NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(8) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    numero_historia_clinica VARCHAR(50) NOT NULL UNIQUE,
    id_seguro INT NULL,
    id_apoderado INT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_seguro) REFERENCES seguro_medico(id_seguro),
    FOREIGN KEY (id_apoderado) REFERENCES apoderado(id_apoderado)
);

-- MODULO 3: GESTION DE MEDICOS Y PROGRAMACION DE CITAS
CREATE TABLE Especialidades (
    idEspecialidad INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE Medicos (
    idMedico INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    colegiatura VARCHAR(20) NOT NULL UNIQUE,
    dni VARCHAR(15) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    CONSTRAINT fk_Medicos_usuarios
        FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario)
        ON DELETE RESTRICT
);

CREATE TABLE Medico_Especialidad (
    idMedico INT NOT NULL,
    idEspecialidad INT NOT NULL,
    PRIMARY KEY (idMedico, idEspecialidad),
    FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico),
    FOREIGN KEY (idEspecialidad) REFERENCES Especialidades(idEspecialidad)
);

CREATE TABLE Horarios_Medicos (
    idHorario INT AUTO_INCREMENT PRIMARY KEY,
    idMedico INT NOT NULL,
    diaSemana VARCHAR(15) NOT NULL,
    horaInicio TIME NOT NULL,
    horaFin TIME NOT NULL,
    FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico)
);

CREATE TABLE Citas (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    idMedico INT NOT NULL,
    numeroHistoriaClinica VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Programada',
    observaciones VARCHAR(255),
    FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico)
);

-- MODULO 4: ATENCION MEDICA Y REGISTRO CLINICO
CREATE TABLE IF NOT EXISTS medicamento (
    id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    stock_actual INT NOT NULL DEFAULT 0,
    stock_minimo INT NOT NULL DEFAULT 5,
    precio_unitario DECIMAL(10,2) NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE atenciones_medicas (
    idAtencion INT AUTO_INCREMENT PRIMARY KEY,
    codigoCita VARCHAR(20) NOT NULL,
    motivoConsulta TEXT NOT NULL,
    antecedentes TEXT,
    planTratamiento TEXT,
    observaciones TEXT,
    fechaAtencion DATETIME DEFAULT CURRENT_TIMESTAMP
);

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

CREATE TABLE diagnosticos_atencion (
    idDiagnostico INT AUTO_INCREMENT PRIMARY KEY,
    idAtencion INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) NOT NULL, -- 'Presuntivo' o 'Definitivo'
    CONSTRAINT fk_diag_atencion FOREIGN KEY (idAtencion) REFERENCES atenciones_medicas(idAtencion) ON DELETE CASCADE
);

CREATE TABLE recetas_medicas (
    idReceta INT AUTO_INCREMENT PRIMARY KEY,
    idAtencion INT NOT NULL,
    fechaEmision DATETIME DEFAULT CURRENT_TIMESTAMP,
    despachada BOOLEAN NOT NULL DEFAULT FALSE, -- TRUE si Farmacia ya despachó la receta
    CONSTRAINT fk_receta_atencion FOREIGN KEY (idAtencion) REFERENCES atenciones_medicas(idAtencion) ON DELETE CASCADE
);

CREATE TABLE detalle_receta (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idReceta INT NOT NULL,
    idMedicamento INT NOT NULL,
    cantidad INT NOT NULL,
    indicacion TEXT NOT NULL,
    CONSTRAINT fk_detalle_receta FOREIGN KEY (idReceta) REFERENCES recetas_medicas(idReceta) ON DELETE CASCADE,
    CONSTRAINT fk_detalle_medicamento FOREIGN KEY (idMedicamento) REFERENCES medicamento(id_medicamento)
);

-- MODULO 5: LABORATORIO, FARMACIA Y CONTROL DE INVENTARIO
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

CREATE TABLE IF NOT EXISTS entrega_medicamento (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_atencion INT NOT NULL,
    id_medicamento INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_entrega DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_entrega_atencion FOREIGN KEY (id_atencion) REFERENCES atenciones_medicas(idAtencion),
    CONSTRAINT fk_entrega_medicamento FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento)
);

-- MODULO 6: CAJA, FACTURACION Y REPORTES
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

-- VISUALIZACION (SELECTs generales por tabla)
SELECT * FROM Usuarios;
SELECT * FROM Auditorias;
SELECT * FROM apoderado;
SELECT * FROM seguro_medico;
SELECT * FROM paciente;
SELECT * FROM Especialidades;
SELECT * FROM Medicos;
SELECT * FROM Medico_Especialidad;
SELECT * FROM Horarios_Medicos;
SELECT * FROM Citas;
SELECT * FROM medicamento;
SELECT * FROM atenciones_medicas;
SELECT * FROM signos_vitales;
SELECT * FROM diagnosticos_atencion;
SELECT * FROM recetas_medicas;
SELECT * FROM detalle_receta;
SELECT * FROM examen_laboratorio;
SELECT * FROM resultado_examen;
SELECT * FROM entrega_medicamento;
SELECT * FROM pago;
SELECT * FROM comprobante;
