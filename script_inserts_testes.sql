CREATE DATABASE preciosos_lacos;
use preciosos_lacos;

show tables;

INSERT INTO tipo_usuario (id_tipo_usuario, tipo_usuario) VALUES
(1, 'ADM'),
(2, 'Cliente');

INSERT INTO modelo (nome_modelo, preco, descricao, foto) VALUES
('Laço Clássico', 50.00, 'Tradicional e elegante.', NULL),
('Laço Fashion', 70.00, 'Estilo moderno e colorido.', NULL),
('Laço Infantil', 35.00, 'Ideal para crianças.', NULL),
('Laço Luxo', 120.00, 'Com brilho e acabamento premium.', NULL),
('Laço Simples', 20.00, 'Básico para o dia a dia.', NULL),
('Laço Pérola', 80.00, 'Com detalhes em pérolas.', NULL),
('Laço Animal Print', 90.00, 'Estampa moderna.', NULL),
('Laço Estrela', 60.00, 'Detalhes brilhantes.', NULL),
('Laço Cetim', 65.00, 'Acabamento em cetim.', NULL),
('Laço Tie Dye', 45.00, 'Colorido em degradê.', NULL);

INSERT INTO produto (tamanho, cor, tipo_laco, preco, modelo_id_modelo) VALUES
('P', 'Vermelho', 'Clássico', 50.00, 1),
('M', 'Azul', 'Fashion', 70.00, 2),
('G', 'Rosa', 'Infantil', 35.00, 3),
('M', 'Preto', 'Luxo', 120.00, 4),
('P', 'Branco', 'Simples', 20.00, 5),
('G', 'Dourado', 'Pérola', 80.00, 6),
('M', 'Onça', 'Animal Print', 90.00, 7),
('P', 'Prata', 'Estrela', 60.00, 8),
('M', 'Azul Claro', 'Cetim', 65.00, 9),
('G', 'Colorido', 'Tie Dye', 45.00, 10);

INSERT INTO status_pagamento (status) VALUES
('Pendente'),
('Pago'),
('Cancelado');

INSERT INTO status_pedido (status) VALUES
('Em andamento'),
('Entregue'),
('Cancelado');

INSERT INTO favorito_modelo (id_usuario, id_modelo) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5);

INSERT INTO Usuario(login, password) VALUES ("eduardo@gmail.com", "243r5");

INSERT INTO caracteristica(descricao) VALUES ("Cor");
INSERT INTO caracteristica(descricao) VALUES ("Colecoes");
INSERT INTO caracteristica(descricao) VALUES ("Tipo de laco");

SELECT * FROM caracteristica;

INSERT INTO caracteristica_detalhe (descricao, caracteristica_id_caracteristica, preco) VALUES ("Bico de pato",2, 0);

SELECT * FROM caracteristica_detalhe;

INSERT INTO modelo_caracteristica_detalhe VALUES(10, 4);

SELECT * FROM modelo_caracteristica_detalhe;

desc modelo_caracteristica_detalhe;