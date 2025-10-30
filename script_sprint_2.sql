USE preciosos_lacos;

-- -----------------------------
-- TABELAS DE STATUS (mantidas)
-- -----------------------------
INSERT INTO status_pagamento (status) VALUES
('Pendente'),
('Pago'),
('Cancelado');

INSERT INTO status_pedido (status) VALUES
('Em andamento'),
('Entregue'),
('Cancelado');

INSERT INTO tipo_usuario (id_tipo_usuario, tipo_usuario) VALUES
(1, 'ADM'),
(2, 'Cliente');

-- -----------------------------
-- TABELA: caracteristica
-- -----------------------------
INSERT INTO caracteristica (descricao) VALUES
('Cor'),
('Coleções'),
('Tipo de laço'),
('Tamanho');

-- -----------------------------
-- TABELA: caracteristica_detalhe
-- -----------------------------
INSERT INTO caracteristica_detalhe (descricao, hexa_decimal, imagem, preco, caracteristica_id_caracteristica) VALUES
('Vermelho', '#FF0000', NULL, 5.00, 1),
('Azul', '#0000FF', NULL, 5.00, 1),
('Natal', NULL, NULL, 10.00, 2),
('Carnaval', NULL, NULL, 12.00, 2),
('Pequeno', NULL, NULL, 10.00, 4),
('Grande', NULL, NULL, 12.00, 4),
('Fita de Cetim', NULL, NULL, 15.00, 3),
('Fita de Gorgurão', NULL, NULL, 8.00, 3);

-- -----------------------------
-- TABELA: modelo
-- -----------------------------
INSERT INTO modelo (descricao, favorito, foto, nome_modelo, preco) VALUES
('Laço simples e delicado, ideal para o dia a dia.', b'0', NULL, 'Laço Simples', 19.90),
('Laço com glitter, perfeito para festas e eventos.', b'1', NULL, 'Laço Glamour', 29.90),
('Laço duplo com pérolas, estilo elegante.', b'0', NULL, 'Laço Elegance', 34.90);

-- -----------------------------
-- TABELA: modelo_caracteristica_detalhe
-- -----------------------------
INSERT INTO modelo_caracteristica_detalhe (modelo_id_modelo, caracteristica_id_caracteristica_detalhe) VALUES
(1, 1), -- Laço simples vermelho
(1, 2), -- Pequeno
(2, 1), -- Glamour azul
(2, 2), -- Grande
(3, 1); -- Elegance com fita de cetim

-- -----------------------------
-- TABELA: usuario
-- -----------------------------
INSERT INTO usuario (cpf, data_cadastro, foto_perfil, login, nome_completo, role, password, telefone) VALUES
('12345678900', '2024-01-01', NULL, 'admin', 'Administrador do Sistema', 'ADMIN', 'admin123', '(11) 94115-9059'),
('98765432100', '2024-02-10', NULL, 'joao', 'João Silva', 'CLIENTE', '123456', '(11) 91821-5488'),
('11122233344', '2024-03-05', NULL, 'maria', 'Maria Souza', 'CLIENTE', 'senha123', '(11) 97184-2152');

-- -----------------------------
-- TABELA: endereco
-- -----------------------------
INSERT INTO endereco (bairro, cep, complemento, localidade, logradouro, numero, uf, usuario_id_usuario) VALUES
('Centro', '01001000', 'Apto 12', 'São Paulo', 'Rua das Flores', 123, 'SP', 1),
('Jardim', '02002000', 'Casa', 'São Paulo', 'Av. Paulista', 500, 'SP', 2),
('Bela Vista', '03003000', 'Bloco B', 'São Paulo', 'Rua Augusta', 45, 'SP', 3);

-- -----------------------------
-- TABELA: produto
-- -----------------------------
INSERT INTO produto (acabamento, cor, material, nome, preco, tamanho, tipo_laco, modelo_id_modelo) VALUES
('Brilho', 'Vermelho', 'Fita de Gorgurão', 'Laço Simples Vermelho', 19.90, 'P', 'Simples', 1),
('Glitter', 'Azul', 'Fita de Cetim', 'Laço Glamour Azul', 29.90, 'G', 'Duplo', 2),
('Perolado', 'Rosa', 'Fita de Cetim', 'Laço Elegance Rosa', 34.90, 'M', 'Duplo com Pérolas', 3);

-- -----------------------------
-- TABELA: favorito_modelo
-- -----------------------------
INSERT INTO favorito_modelo (id_modelo, id_usuario) VALUES
(2, 2), -- João favoritou o Laço Glamour
(3, 3); -- Maria favoritou o Laço Elegance

-- -----------------------------
-- TABELA: pedido
-- -----------------------------
INSERT INTO pedido (data_pedido, forma_pagamento, total, status_pagamento_id_status_pagamento, status_pedido_id_status_pedido, usuario_id_usuario) VALUES
('2025-10-20', 1, 19.90, 2, 1, 2), -- Pedido João (Pago, Em andamento)
('2025-10-22', 2, 34.90, 1, 1, 3); -- Pedido Maria (Pendente, Em andamento)

-- -----------------------------
-- TABELA: pedido_produto
-- -----------------------------
INSERT INTO pedido_produto (id_pedido, id_produto) VALUES
(1, 1),
(2, 3);

-- -----------------------------
-- NOVOS PEDIDOS
-- -----------------------------
INSERT INTO pedido (data_pedido, forma_pagamento, total, status_pagamento_id_status_pagamento, status_pedido_id_status_pedido, usuario_id_usuario) VALUES
('2025-10-25', 1, 49.80, 2, 2, 2),  -- João: Pedido entregue (2x Laço Simples)
('2025-10-26', 2, 29.90, 1, 1, 3),  -- Maria: Pedido pendente (Laço Glamour Azul)
('2025-10-27', 3, 54.80, 2, 1, 3),  -- Maria: Pago e em andamento (2 Laços Elegance)
('2025-10-28', 1, 34.90, 3, 3, 2),  -- João: Pedido cancelado
('2025-10-23', 2, 64.80, 2, 2, 3);  -- Maria: Entregue com Laço Glamour + Elegance

-- -----------------------------
-- RELACIONAMENTO PEDIDO_PRODUTO
-- -----------------------------
INSERT INTO pedido_produto (id_pedido, id_produto) VALUES
-- Pedido 3: João - 2x Laço Simples Vermelho
(3, 1),
(3, 1),
-- Pedido 4: Maria - 1x Laço Glamour Azul
(4, 2),
-- Pedido 5: Maria - 2x Laço Elegance Rosa
(5, 3),
(5, 3),
-- Pedido 6: João - Cancelado
(6, 1),
-- Pedido 7: Maria - Entregue Glamour + Elegance
(7, 2),
(7, 3);


-- -----------------------------
-- VERIFICAÇÃO
-- -----------------------------
SHOW TABLES;

SELECT * FROM caracteristica;
SELECT * FROM caracteristica_detalhe;
SELECT * FROM endereco;
SELECT * FROM favorito_modelo;
SELECT * FROM modelo;
SELECT * FROM modelo_caracteristica_detalhe;
SELECT * FROM pedido;
SELECT * FROM pedido_produto;
SELECT * FROM produto;
SELECT * FROM status_pagamento;
SELECT * FROM status_pedido;
SELECT * FROM tipo_usuario;
SELECT * FROM usuario;
