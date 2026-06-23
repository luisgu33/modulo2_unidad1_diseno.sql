--Empezaremos eliminando las tablas en tal caso de que existan
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

--Crearemos la tabla de categorias, declaramos "id_categoria" como nuestra llave primaria
CREATE TABLE categorias(
id_categoria INT NOT NULL IDENTITY PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(200) NOT NULL
);

--Crearemos la tabla clientes, declaramos "id_cliente" como nuestra llave primaria
CREATE TABLE clientes(
id_cliente INT  NOT NULL IDENTITY PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
ciudad VARCHAR(50) NOT NULL,
fecha_registro DATE NOT NULL
);

--Crearemos la tabla productos, declaramos "id_producto" como nuestra llave primaria y "id_categoria" como nuestra llave foranea con referencia a "id_categoria" en la tabla categorias
CREATE TABLE productos(
id_producto INT NOT NULL IDENTITY PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
id_categoria INT NOT NULL FOREIGN KEY REFERENCES categorias(id_categoria),
precio DECIMAL(10,2) NOT NULL,
stock INT NOT NULL DEFAULT 0,
activo BIT NOT NULL DEFAULT 1
);

--Crearemos la tabla ventas(hechos), declaramos "id_producto" como nuestra llave primaria, "id_cliente" como llave foranea con referencia a "id_cliente en la tabla clientes y "id_producto" como llave foranea con referencia a "idproducto" en la tabla productos
CREATE TABLE ventas(
id_venta INT NOT NULL IDENTITY PRIMARY KEY,
id_cliente INT NOT NULL FOREIGN KEY REFERENCES clientes(id_cliente),
id_producto INT NOT NULL FOREIGN KEY REFERENCES productos(id_producto),
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
fecha_venta DATE NOT NULL
);

--Insertaremos los valores a nuestra tabla de categorias
INSERT INTO categorias VALUES ('Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias VALUES ('Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES ('Audio', 'Auriculares y parlantes');
INSERT INTO categorias VALUES ('Almacenamiento', 'Discos y memorias');

--Insertaremos los valores a nuestra tabla de cientes
INSERT INTO clientes VALUES ('María López', 'maria@mail.com', 'Buenos Aires', '2024-01-05');
INSERT INTO clientes VALUES ('Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10');
INSERT INTO clientes VALUES ('Ana Gómez', 'ana@mail.com', 'Rosario', '2024-02-01');
INSERT INTO clientes VALUES ('Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15');
INSERT INTO clientes VALUES ('Laura Torres', 'laura@mail.com', 'Tucumán', '2024-03-01');

--Insertaremos los valores a nuestra tabla de productos
INSERT INTO productos VALUES ('Laptop Pro 15',      1, 1200.00, 15, 1);
INSERT INTO productos VALUES ('Mouse Inalámbrico',  2,   28.00, 80, 1);
INSERT INTO productos VALUES ('Monitor 4K 27"',     1,  450.00, 12, 1);
INSERT INTO productos VALUES ('Auriculares BT Pro', 3,  120.00, 35, 1);
INSERT INTO productos VALUES ('SSD Externo 1TB',    4,  130.00, 18, 1);
INSERT INTO productos VALUES ('Teclado Mecánico',   2,   95.00, 40, 1);

--Insertaremos los valores a nuestra tabla de ventas
INSERT INTO ventas VALUES (1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO ventas VALUES (2, 2, 5,   28.00, '2024-03-06');
INSERT INTO ventas VALUES (3, 3, 1,  450.00, '2024-03-07');
INSERT INTO ventas VALUES (1, 4, 2,  120.00, '2024-03-08');
INSERT INTO ventas VALUES (4, 5, 3,  130.00, '2024-03-10');
INSERT INTO ventas VALUES (2, 6, 4,   95.00, '2024-03-11');
INSERT INTO ventas VALUES (5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO ventas VALUES (3, 2, 8,   28.00, '2024-03-13');
INSERT INTO ventas VALUES (4, 4, 1,  120.00, '2024-03-14');
INSERT INTO ventas VALUES (5, 3, 2,  450.00, '2024-03-15');

--Abrimos las tablas para confirmar que todo este correctamente cargado
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;

--Todo se cargo correctamente