INSERT INTO generos (id, nombre) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Jazz');

INSERT INTO artistas (id, nombre, pais) VALUES
(1, 'Pink Floyd', 'Reino Unido'),
(2, 'Michael Jackson', 'Estados Unidos'),
(3, 'Miles Davis', 'Estados Unidos'),
(4, 'Soda Stereo', 'Argentina'),
(5, 'Rosalia', 'España');

INSERT INTO discos (id, titulo, anio,precio, stock, artista_id, genero_id) VALUES
(1, 'The Dark Side of the Moon', 1973, 24.90, 8, 1, 1),
(2, 'Wish You Were Here', 1975, 22.50, 5, 1, 1),
(3, 'Thriller', 1982, 20.90, 9, 2, 2),
(4, 'Kind of Blue', 1959, 19.90, 7, 3, 3),
(5, 'Bitches Brew', 1970, 21.00, 2, 3, 3),
(6, 'Dynamo', 1992, 18.50, 3, 4, 1),  
(7, 'El Mal Querer', 2018, 13.99, 6, 5, 2),
(8, 'Signos', 1986, 17.50, 4, 4, 1);

INSERT INTO clientes(id, nombre, email, ciudad, fecha_alta) VALUES
(1, 'Ana Perez', 'ana.perez@example.com', 'Madrid', '2025-02-10'),
(2, 'Luis Garcia', 'luis.garcia@example.com', 'Sevilla', '2025-04-22'),
(3, 'Clara Soto', 'clara.soto@example.com', 'Barcelona', '2025-08-05'),
(4, 'Mario Diaz', 'mario.diaz@example.com', 'Valencia', '2025-01-14');

INSERT INTO ventas (id, cliente_id, fecha) VALUES
(1,1, '2025-10-03'),
(2,2, '2025-11-15'),
(3,1, '2026-01-20'),
(4,3, '2026-02-08'),
(5,2, '2026-03-12'),
(6,3, '2026-04-30');

INSERT INTO detalle_venta (venta_id, disco_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 24.90),
(1, 3, 1, 20.90),
(2, 4, 1, 19.90),
(3, 1, 1, 24.90),
(3, 7, 1, 22.00),
(4, 3, 2, 20.90),
(5, 6, 1, 18.50),
(5, 4, 1, 19.90),
(6, 2, 1, 22.50);