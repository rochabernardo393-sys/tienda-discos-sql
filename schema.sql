DROP TABLE IF EXISTS detalle_venta;  
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS discos;
DROP TABLE IF EXISTS generos;
DROP TABLE IF EXISTS artistas;

CREATE TABLE artistas (
    id  INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE,
    pais TEXT NOT NULL 
);
CREATE TABLE generos (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE discos (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    anio INTEGER NOT NULL CHECK(anio BETWEEN 1900 AND 2100),
    precio REAL NOT NULL CHECK (precio >0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK(stock >= 0),
    artista_id INTEGER NOT NULL REFERENCES artistas(id),
    genero_id INTEGER NOT NULL REFERENCES generos(id)
);

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    ciudad TEXT NOT NULL,
    fecha_alta TEXT NOT NULL DEFAULT (DATE('now'))

);

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER NOT NULL REFERENCES clientes(id),
    fecha TEXT NOT NULL DEFAULT (DATE('now'))
);

CREATE TABLE detalle_venta (
    id INTEGER PRIMARY KEY,
    venta_id INTEGER NOT NULL REFERENCES ventas(id),
    disco_id INTEGER NOT NULL REFERENCES discos(id),
    cantidad INTEGER NOT NULL CHECK(cantidad > 0),
    precio_unitario REAL NOT NULL CHECK(precio_unitario > 0)
);


CREATE INDEX idx_discos_artista ON discos(artista_id);      
CREATE INDEX idx_ventas_cliente ON ventas(cliente_id);  
CREATE INDEX idx_detalle_venta  ON detalle_venta(venta_id);
CREATE INDEX idx_detalle_disco  ON detalle_venta(disco_id);