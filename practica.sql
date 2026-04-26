--1. Creacion de esquemas para la base de datos 
-- Creamos el esquema ventas para la organizacion de clientes
CREATE SCHEMA ventas;
GO
-- Creamos el esquema logistica para gestionar envios
CREATE SCHEMA logistica;
GO
-- Creamos el esquema analytics para reportes y analisis
CREATE SCHEMA analytics;
GO
--2. Creacion de tablas
-- Tabla de clientes dentro del esquema ventas
-- Guarda informacion basica de cada cliente
CREATE TABLE ventas.Clientes (
    id_cliente INT PRIMARY KEY, -- Identificador unico del cliente
    nombre VARCHAR(100) NOT NULL, -- Nombre del cliente
    fecha_registro DATE NOT NULL -- Fecha en que el cliente se registro
);
GO
-- Tabla de envios dentro del esquema logistica
-- Guarda informacion sobre cada envio realizado
CREATE TABLE logistica.Envios (
    id_envio INT PRIMARY KEY, -- Identificador unico del envio
    destino VARCHAR(100) NOT NULL, -- Destino del envio
    fecha_envio DATE NOT NULL -- Fecha en que se realizo el envio 
    -- not null: el campo no puede quedar vacio, debe tener un valor
);
GO
-- Tabla de reportes dentro del esquema analytics
-- Guarda informacion sobre los reportes generados
CREATE TABLE analytics.Reportes (
    id_reporte INT PRIMARY KEY, -- Identificador unico del reporte
    descripcion VARCHAR(255) NOT NULL, -- Descripcion del reporte
    fecha_generacion DATE NOT NULL -- Fecha en que se genero el reporte
);
GO
--3. Creacion de Roles y asignacion de permisos
-- Creamos el rol para el area de ventas
CREATE ROLE rol_ventas;
GO
-- Creamos un rol para logistica
CREATE ROLE rol_logistica;
GO
-- Creamos un rol para analytics
CREATE ROLE rol_analytics;
GO
-- 4. Asignacion de permisos a los roles
-- Permisos para el rol de ventas
-- El rol de ventas puede leer, insertar y actualizar datos en la tabla de clientes
GRANT SELECT, INSERT, UPDATE ON ventas.Clientes TO rol_ventas;
GO
-- Permisos para el rol de logistica
-- El rol de logistica puede leer, insertar y actualizar datos en la tabla de envios
GRANT SELECT, INSERT, UPDATE ON logistica.Envios TO rol_logistica;
GO
-- Permisos para el rol de analytics
-- El rol de analytics solo puede leer reportes
GRANT SELECT ON analytics.Reportes TO rol_analytics;
GO  