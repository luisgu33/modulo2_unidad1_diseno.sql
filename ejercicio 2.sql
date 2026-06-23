-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: [Luis Gutierrez]
-- Fecha: [22-06-2026]
-- ══════════════════════════════════════════
-- ── SECCIÓN DDL ──────────────────────────
DROP TABLE IF EXISTS inventario
CREATE TABLE inventario(

id_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- aca use int porque es un numero entero, INDENTITY(1,1) para que se vayan agregando los id's solos
nombre_producto VARCHAR(100) NOT NULL, -- use VARCHAR(100) para colocar la categoria con un maximo de 100 caracteres
categoria VARCHAR(50) NOT NULL, -- use VARCHAR(50) para colocar la categoria con un maximo de 50 caracteres
precio_unitario DECIMAL(10,2) NOT NULL, -- use DECIMAL(10,2) porque los datos a ingresar son numeros con decimales
stock_actual INT NOT NULL, -- use INT porque son numeros enteros
stock_minimo INT NOT NULL, -- use INT porque son numeros enteros
fecha_ingreso DATE NOT NULL, -- use DATE porque es una fecha lo que ingresara
activo BIT NOT NULL --use bit para 1 o 0 en disponibilidad, el ejercicio menciona para usar TINYINT(1) pero el SSMS no reconoce el comando
);

-- Ver la tabla completa para confirmar que la tabla fue creada
SELECT * FROM inventario

-- ── SECCIÓN DML ──────────────────────────

INSERT INTO inventario (nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo)
VALUES 
('Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
('Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
('Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
('Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
('Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1), 
('Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
('Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
('Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
('SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
('Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- Ver la tabla completa para confirmar que los datos fueron cargados
SELECT * FROM inventario

UPDATE INVENTARIO
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

UPDATE INVENTARIO 
SET activo = 0
WHERE id_producto = 8;

-- Ver la tabla completa para confirmar que los datos se cargaron
SELECT * FROM inventario;

