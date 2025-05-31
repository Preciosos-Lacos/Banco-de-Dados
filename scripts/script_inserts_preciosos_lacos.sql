-- 1. tipo_usuario
INSERT INTO tipo_usuario (id, nome) VALUES
(1, 'ADM'),
(2, 'Cliente');

-- 2. usuario (ALL USERS FIRST)
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
('Bianca Ramos', 'bianca@email.com', 'Senha123', '999.000.111-22', '(19)96543-2109', 1, 2, NOW() - INTERVAL 2 DAY),
-- New users for simulation
('Pedro Nunes', 'pedro@email.com', 'Senha123', '000.111.222-33', '(11)91111-2222', 1, 2, NOW() - INTERVAL 1 MONTH),
('Laura Santos', 'laura@email.com', 'Senha123', '333.222.111-00', '(21)92222-3333', 1, 2, NOW() - INTERVAL 1 MONTH),
('Ricardo Costa', 'ricardo@email.com', 'Senha123', '444.555.666-77', '(11)93333-4444', 1, 2, NOW() - INTERVAL 2 MONTH),
('Camila Almeida', 'camila@email.com', 'Senha123', '777.666.555-44', '(31)94444-5555', 1, 2, NOW() - INTERVAL 2 MONTH),
('Daniel Mendes', 'daniel@email.com', 'Senha123', '111.999.888-77', '(81)95555-6666', 1, 2, NOW() - INTERVAL 3 MONTH),
('Patrícia Reis', 'patricia@email.com', 'Senha123', '222.111.000-99', '(71)96666-7777', 1, 2, NOW() - INTERVAL 3 MONTH),
('Gustavo Pereira', 'gustavo@email.com', 'Senha123', '333.000.999-88', '(48)97777-8888', 1, 2, NOW() - INTERVAL 4 MONTH),
('Carolina Dias', 'carolina@email.com', 'Senha123', '444.999.888-77', '(19)98888-9999', 1, 2, NOW() - INTERVAL 5 MONTH);


-- 3. modelo
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

-- 4. produto
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

-- 5. status_pagamento
INSERT INTO status_pagamento (nome) VALUES
('Pendente'),
('Pago'),
('Cancelado');

-- 6. status_pedido
INSERT INTO status_pedido (nome) VALUES
('Em andamento'),
('Entregue'),
('Cancelado');

-- 7. pedido (ALL ORDERS AFTER ALL USERS ARE INSERTED)
-- Initial orders
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

-- Orders for April 2025 (CURRENT_DATE() - INTERVAL 1 MONTH)
INSERT INTO pedido (data_pedido, total, forma_pagamento, usuario_id, status_pagamento_id, status_pedido_id) VALUES
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 150.00, 'Pix', 2, 2, 2), -- This was from your original set, re-adding to keep the order
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 200.00, 'Cartão de Crédito', 3, 2, 2), -- This was from your original set, re-adding to keep the order
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 250.00, 'Pix', 4, 2, 2), -- This was from your original set, re-adding to keep the order
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 300.00, 'Cartão de Débito', 5, 2, 2), -- This was from your original set, re-adding to keep the order
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 85.00, 'Pix', 1, 2, 2), -- New order for April
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 110.00, 'Cartão de Crédito', 2, 2, 2), -- New order for April
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 40.00, 'Boleto', 4, 1, 1), -- New order for April
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 75.00, 'Pix', 5, 2, 2), -- New order for April
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 130.00, 'Cartão de Débito', 6, 2, 2), -- New order for April
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 55.00, 'Cartão de Crédito', 7, 2, 1), -- New order for April
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 90.00, 'Boleto', 8, 1, 1), -- New order for April
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 105.00, 'Pix', 9, 2, 2), -- New order for April
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 110.00, 'Pix', (SELECT id FROM usuario WHERE email = 'pedro@email.com'), 2, 2), -- Order for new user Pedro
(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 65.00, 'Cartão de Crédito', (SELECT id FROM usuario WHERE email = 'laura@email.com'), 2, 2); -- Order for new user Laura

-- Orders for March 2025 (CURRENT_DATE() - INTERVAL 2 MONTH)
INSERT INTO pedido (data_pedido, total, forma_pagamento, usuario_id, status_pagamento_id, status_pedido_id) VALUES
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 60.00, 'Cartão de Crédito', 1, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 150.00, 'Pix', 3, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 70.00, 'Boleto', 5, 1, 1),
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 115.00, 'Cartão de Débito', 7, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 95.00, 'Pix', 8, 2, 1),
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 25.00, 'Cartão de Crédito', 10, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 80.00, 'Pix', (SELECT id FROM usuario WHERE email = 'ricardo@email.com'), 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), 120.00, 'Boleto', (SELECT id FROM usuario WHERE email = 'camila@email.com'), 1, 1);

-- Orders for February 2025 (CURRENT_DATE() - INTERVAL 3 MONTH)
INSERT INTO pedido (data_pedido, total, forma_pagamento, usuario_id, status_pagamento_id, status_pedido_id) VALUES
(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), 80.00, 'Pix', 2, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), 100.00, 'Boleto', 4, 1, 1),
(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), 45.00, 'Cartão de Crédito', 6, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), 120.00, 'Pix', 9, 2, 1),
(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), 70.00, 'Cartão de Crédito', (SELECT id FROM usuario WHERE email = 'daniel@email.com'), 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 3 MONTH), 90.00, 'Pix', (SELECT id FROM usuario WHERE email = 'patricia@email.com'), 2, 1);

-- Orders for January 2025 (CURRENT_DATE() - INTERVAL 4 MONTH)
INSERT INTO pedido (data_pedido, total, forma_pagamento, usuario_id, status_pagamento_id, status_pedido_id) VALUES
(DATE_SUB(CURDATE(), INTERVAL 4 MONTH), 70.00, 'Pix', 1, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 4 MONTH), 95.00, 'Cartão de Crédito', 3, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 4 MONTH), 30.00, 'Boleto', 5, 1, 1),
(DATE_SUB(CURDATE(), INTERVAL 4 MONTH), 110.00, 'Cartão de Débito', 7, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 4 MONTH), 80.00, 'Pix', 10, 2, 1),
(DATE_SUB(CURDATE(), INTERVAL 4 MONTH), 150.00, 'Cartão de Crédito', (SELECT id FROM usuario WHERE email = 'gustavo@email.com'), 2, 2);

-- Orders for December 2024 (CURRENT_DATE() - INTERVAL 5 MONTH)
INSERT INTO pedido (data_pedido, total, forma_pagamento, usuario_id, status_pagamento_id, status_pedido_id) VALUES
(DATE_SUB(CURDATE(), INTERVAL 5 MONTH), 130.00, 'Pix', 2, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 5 MONTH), 50.00, 'Boleto', 4, 1, 1),
(DATE_SUB(CURDATE(), INTERVAL 5 MONTH), 100.00, 'Cartão de Crédito', 6, 2, 2),
(DATE_SUB(CURDATE(), INTERVAL 5 MONTH), 60.00, 'Pix', 8, 2, 1),
(DATE_SUB(CURDATE(), INTERVAL 5 MONTH), 200.00, 'Boleto', (SELECT id FROM usuario WHERE email = 'carolina@email.com'), 2, 2);


-- 8. item_pedido (Get the latest ID from pedido first!)
-- Run `SELECT id FROM pedido ORDER BY id DESC LIMIT 1;` after all pedido inserts
-- and adjust the starting pedido_id for these inserts.
-- For example, if the last pedido_id from the consolidated list above is 76, then start from 77.
-- I'll use a placeholder `LAST_PEDIDO_ID + X` for demonstration.

-- Assuming the initial 19 orders took IDs 1-19.
-- And the subsequent inserts for months took 20-43. (Check your actual last ID)
-- Let's assume the previous `pedido` inserts end around `id = 76`. So, the next `item_pedido` start after that.

-- 8. item_pedido (Refactored using INSERT INTO ... SELECT)

-- Initial orders' items (these don't use subqueries for pedido_id, so they can stay as VALUES)
INSERT INTO item_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 1), (1, 2, 1),
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
(20, 1, 2), (21, 2, 1), (22, 3, 3), (23, 4, 1); -- Continued from initial inserts

-- Items for April 2025 orders (starting from existing ID 24)
INSERT INTO item_pedido (pedido_id, produto_id, quantidade) VALUES
(24, 1, 1), (24, 5, 1),
(25, 2, 1), (25, 6, 1),
(26, 3, 2),
(27, 4, 1), (27, 7, 1),
(28, 8, 1),
(29, 9, 2),
(30, 10, 1),
(31, 1, 2), (31, 2, 1);

-- Items for new users' orders (using INSERT INTO ... SELECT for dynamic IDs)

-- Item for Pedro's April order
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    1 AS produto_id, -- Example product_id
    1 AS quantidade
FROM pedido
WHERE usuario_id = (SELECT id FROM usuario WHERE email = 'pedro@email.com')
ORDER BY id DESC LIMIT 1;

-- Item for Laura's April order
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    2 AS produto_id, -- Example product_id
    1 AS quantidade
FROM pedido
WHERE usuario_id = (SELECT id FROM usuario WHERE email = 'laura@email.com')
ORDER BY id DESC LIMIT 1;

-- Items for March 2025 orders (using dynamic IDs for existing users' new orders)
-- This assumes 'pedido_id' for these specific orders was correctly inserted with distinct values.
-- You might need to adjust the WHERE clause to be more specific if there are duplicate total/date combinations.
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    3 AS produto_id, -- Example product_id
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND total = 60.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    5 AS produto_id, -- Example product_id
    2 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND total = 150.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    6 AS produto_id, -- Example product_id
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND total = 70.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    8 AS produto_id, -- Example product_id
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND total = 115.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    9 AS produto_id, -- Example product_id
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND total = 95.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    10 AS produto_id, -- Example product_id
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND total = 25.00
ORDER BY id DESC LIMIT 1;

-- Item for Ricardo's March order
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    1 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE usuario_id = (SELECT id FROM usuario WHERE email = 'ricardo@email.com')
ORDER BY id DESC LIMIT 1;

-- Item for Camila's March order
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    3 AS produto_id,
    2 AS quantidade
FROM pedido
WHERE usuario_id = (SELECT id FROM usuario WHERE email = 'camila@email.com')
ORDER BY id DESC LIMIT 1;

-- Items for February 2025 orders
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    4 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND total = 80.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    5 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND total = 100.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    6 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND total = 45.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    7 AS produto_id,
    2 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND total = 120.00
ORDER BY id DESC LIMIT 1;

-- Item for Daniel's Feb order
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    8 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE usuario_id = (SELECT id FROM usuario WHERE email = 'daniel@email.com')
ORDER BY id DESC LIMIT 1;

-- Item for Patrícia's Feb order
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    9 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE usuario_id = (SELECT id FROM usuario WHERE email = 'patricia@email.com')
ORDER BY id DESC LIMIT 1;

-- Items for January 2025 orders
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    1 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 4 MONTH) AND total = 70.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    3 AS produto_id,
    2 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 4 MONTH) AND total = 95.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    4 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 4 MONTH) AND total = 30.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    5 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 4 MONTH) AND total = 110.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    6 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 4 MONTH) AND total = 80.00
ORDER BY id DESC LIMIT 1;

-- Item for Gustavo's Jan order
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    8 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE usuario_id = (SELECT id FROM usuario WHERE email = 'gustavo@email.com')
ORDER BY id DESC LIMIT 1;

-- Items for December 2024 orders
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    1 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 5 MONTH) AND total = 130.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    3 AS produto_id,
    2 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 5 MONTH) AND total = 50.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    4 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 5 MONTH) AND total = 100.00
ORDER BY id DESC LIMIT 1;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    6 AS produto_id,
    1 AS quantidade
FROM pedido
WHERE data_pedido = DATE_SUB(CURDATE(), INTERVAL 5 MONTH) AND total = 60.00
ORDER BY id DESC LIMIT 1;

-- Item for Carolina's Dec order
INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
    id AS pedido_id,
    7 AS produto_id,
    2 AS quantidade
FROM pedido
WHERE usuario_id = (SELECT id FROM usuario WHERE email = 'carolina@email.com')
ORDER BY id DESC LIMIT 1;


-- 9. endereco
INSERT INTO endereco (cep, logradouro, bairro, numero, complemento, cidade, estado, usuario_id) VALUES
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 101', 'São Paulo', 'SP', 1),
('87654-321', 'Av. Central', 'Centro', 456, NULL, 'Rio de Janeiro', 'RJ', 2),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 011', 'São Paulo', 'SP', 3),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 205', 'São Paulo', 'SP', 4),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 409', 'São Paulo', 'SP', 5),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 607', 'São Paulo', 'SP', 6),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 503', 'São Paulo', 'SP', 7),
('12345-678', 'Rua das Flores', 'Jardim Primavera', 123, 'Apto 308', 'São Paulo', 'SP', 8);

-- 10. favorito
INSERT INTO favorito (usuario_id, produto_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- Disable safe update mode temporarily
SET SQL_SAFE_UPDATES = 0;

-- Delete data from child table first
DELETE FROM modelo_caracteristica;
-- Then delete data from parent table
DELETE FROM caracteristica_detalhe;

-- Re-enable safe update mode (good practice)
SET SQL_SAFE_UPDATES = 1;

-- 11. caracteristica (Insert if not already present)
-- If 'Cor', 'Tamanho', 'Acabamento', 'Tipo de laço' already exist, you can skip this block
INSERT INTO caracteristica (descricao) VALUES
('Cor'),
('Tamanho'),
('Acabamento'),
('Tipo de laço');

-- 12. caracteristica_detalhe (Corrected and definitive IDs)
INSERT INTO caracteristica_detalhe (id, caracteristica_id, descricao) VALUES
(1, 1, 'Azul'),           -- Cor
(2, 1, 'Rosa'),           -- Cor
(3, 1, 'Vermelho'),       -- Cor
(4, 2, 'P'),              -- Tamanho
(5, 2, 'M'),              -- Tamanho
(6, 2, 'G'),              -- Tamanho
(7, 3, 'Brilho'),         -- Acabamento
(8, 3, 'Simples'),        -- Acabamento
(9, 3, 'Pom Pom'),        -- Acabamento
(10, 4, 'Bico de pato'),  -- Tipo de laço
(11, 4, 'Xuxinha');       -- Tipo de laço

-- 13. modelo_caracteristica
INSERT INTO modelo_caracteristica (modelo_id, detalhe_id) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(3, 5),
(4, 7),
(5, 8);

