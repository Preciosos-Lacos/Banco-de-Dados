INSERT INTO tipo_usuario (id, nome) VALUES 
(1, 'ADM'), 
(2, 'Cliente');

INSERT INTO usuario (nome, email, senha, cpf, telefone, autenticado, tipo_usuario_id, data_cadastro) VALUES
('Lucas Silva', 'lucas@email.com', 'Senha123', '123.456.789-00', '(11)91234-5678', 1, 1, NOW() - INTERVAL 20 DAY),
('Ana Costa', 'ana@email.com', 'Senha123', '111.222.333-44', '(21)99999-1234', 1, 2, NOW() - INTERVAL 15 DAY),
('João Mendes', 'joao@email.com', 'Senha123', '222.333.444-55', '(11)98888-4321', 1, 2, NOW() - INTERVAL 30 DAY),
('Maria Lima', 'maria@email.com', 'Senha123', '333.444.555-66', '(31)97777-1111', 1, 2, NOW() - INTERVAL 5 DAY),
('Carlos Souza', 'carlos@email.com', 'Senha123', '444.555.666-77', '(81)96666-2222', 1, 2, NOW() - INTERVAL 10 DAY),
('Fernanda Rocha', 'fernanda@email.com', 'Senha123', '555.666.777-88', '(85)93456-1111', 0, 2, NOW() - INTERVAL 1 MONTH),
('Gabriel Oliveira', 'gabriel@email.com', 'Senha123', '666.777.888-99', '(92)98877-4444', 1, 2, NOW() - INTERVAL 2 MONTH),
('Juliana Pires', 'juliana@email.com', 'Senha123', '777.888.999-00', '(71)98765-4321', 1, 2, NOW()),
('Thiago Lima', 'thiago@email.com', 'Senha123', '888.999.000-11', '(48)97654-3210', 0, 2, NOW() - INTERVAL 3 MONTH),
('Bianca Ramos', 'bianca@email.com', 'Senha123', '999.000.111-22', '(19)96543-2109', 1, 2, NOW() - INTERVAL 2 DAY);

INSERT INTO modelo (nome, preco, descricao, foto) VALUES
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

INSERT INTO produto (tamanho, cor, tipo_laco, preco_final, modelo_id) VALUES
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


INSERT INTO status_pagamento (nome) VALUES 
('Pendente'), 
('Pago'), 
('Cancelado');

INSERT INTO status_pedido (nome) VALUES 
('Em andamento'), 
('Entregue'), 
('Cancelado');

INSERT INTO pedido (total, forma_pagamento, usuario_id, status_pagamento_id, status_pedido_id) VALUES
(100.00, 'Pix', 1, 2, 2),
(70.00, 'Cartão de Crédito', 2, 2, 2),
(120.00, 'Boleto', 3, 1, 1),
(90.00, 'Pix', 4, 2, 2),
(35.00, 'Cartão de Débito', 5, 2, 2),
(65.00, 'Boleto', 6, 1, 1),
(110.00, 'Pix', 7, 2, 2),
(80.00, 'Cartão de Crédito', 8, 2, 2),
(60.00, 'Pix', 9, 2, 1),
(95.00, 'Cartão de Crédito', 10, 2, 2),
(200.00, 'Pix', 10, 2, 1),
(140.00, 'Boleto', 8, 2, 1),
(20.00, 'Boleto', 8, 2, 1),
(50.00, 'Boleto', 1, 2, 1),
(90.00, 'Boleto', 1, 2, 1),
(140.00, 'Pix', 2, 2, 1),
(20.00, 'Pix', 2, 2, 1),
(50.00, 'Cartão de Crédito', 3, 2, 1),
(100.00, 'Cartão de Crédito', 3, 2, 1);

INSERT INTO pedido (data_pedido, total, forma_pagamento, usuario_id, status_pagamento_id, status_pedido_id) VALUES
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 150.00, 'Pix', 2, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 200.00, 'Cartão de Crédito', 3, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 250.00, 'Pix', 4, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 300.00, 'Cartão de Débito', 5, 2, 2);


INSERT INTO item_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 2),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 2),
(7, 8, 1),
(8, 9, 2),
(9, 10, 1),
(11, 8, 2),
(12, 4, 1),
(13, 4, 2),
(14, 4, 3),
(15, 5, 4),
(16, 1, 1),
(17, 1, 1),
(18, 1, 1),
(19, 1, 1),
(20, 1, 2),
(21, 2, 1),
(22, 3, 3),
(23, 4, 1);

select id from pedido order by id desc;

INSERT INTO endereco (cep, logradouro, bairro, numero, complemento, cidade, estado, usuario_id) VALUES 
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 101', 'São Paulo', 'SP', 1),
('87654-321', 'Av. Central', 'Centro', 456, NULL, 'Rio de Janeiro', 'RJ', 2),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 011', 'São Paulo', 'SP', 3),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 205', 'São Paulo', 'SP', 4),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 409', 'São Paulo', 'SP', 5),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 607', 'São Paulo', 'SP', 6),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 503', 'São Paulo', 'SP', 7),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 308', 'São Paulo', 'SP', 8);


INSERT INTO favorito (usuario_id, produto_id, marcado) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 0),
(4, 4, 1),
(5, 5, 1),
(6, 6, 0),
(7, 7, 1),
(8, 8, 1),
(9, 9, 0),
(10, 10, 1);

INSERT INTO caracteristica (descricao) VALUES 
('Cor'), 
('Tamanho'), 
('Acabamento'),
('Tipo de laço');

INSERT INTO caracteristica_detalhe (id, caracteristica_id, descricao) VALUES 
(1, 1, 'Azul'),
(2, 1, 'Rosa'),
(3, 1, 'Vermelho'),
(4, 2, 'P'),
(5, 2, 'M'),
(7, 2, 'G'),
(9, 3, 'Brilho'),
(9, 3, 'Simples'),
(10, 3, 'Pom Pom'),
(8, 4, 'Bico de pato'),
(9, 4, 'Xuxinha'),
(9, 4, 'Meia de Seda');

-- há uma inconsistencia dentro da tabela modelo_caracteristica pois não há como indicar que estamos utilizando mais de uma 
-- caracteristica_detalhe na caracteristica do modelo, desta forma não tem um modelo completo.

select * from modelo_caracteristica;
describe modelo_caracteristica;
INSERT INTO modelo_caracteristica (modelo_id, detalhe_id) VALUES 
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(3, 5);

