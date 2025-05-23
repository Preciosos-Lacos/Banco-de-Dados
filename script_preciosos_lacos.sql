-- Criar dentro do database
CREATE DATABASE IF NOT EXISTS preciosos_lacos;
USE preciosos_lacos;

-- Tabela de tipos de usuário (ex: administrador, cliente)
CREATE TABLE tipo_usuario (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

insert into tipo_usuario values (1, "ADM"), (2,"Cliente");

-- Tabela de usuários
CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha CHAR(8),
    cpf VARCHAR(14),
    telefone VARCHAR(15),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    autenticado TINYINT,
    tipo_usuario_id INT DEFAULT 2,
    FOREIGN KEY (tipo_usuario_id) REFERENCES tipo_usuario(id)
);

INSERT INTO usuario (
    nome,
    email,
    senha,
    cpf,
    telefone,
    autenticado,
    tipo_usuario_id
) VALUES (
    'Lucas Silva',
    'lucas.silva@email.com',
    'Abc12345',
    '123.456.789-00',
    '(11)91234-5678',
    1,
    1
);

-- Tabela de modelos (base dos produtos)
CREATE TABLE modelo (
    id INT PRIMARY KEY auto_increment,
    nome VARCHAR(100),
    preco DOUBLE,
    descricao VARCHAR(255),
    foto BLOB
);

-- Tabela de produtos
CREATE TABLE produto (
    id INT PRIMARY KEY auto_increment,
    tamanho VARCHAR(5),
    cor VARCHAR(45),
    tipo_laco VARCHAR(45),
    preco_final DOUBLE,
    modelo_id INT,
    FOREIGN KEY (modelo_id) REFERENCES modelo(id)
);

-- Tabela de status de pagamento (ex: pago, pendente)
CREATE TABLE status_pagamento (
    id INT PRIMARY KEY auto_increment,
    nome VARCHAR(45)
);

-- Tabela de status de pedido (ex: em andamento, entregue)
CREATE TABLE status_pedido (
    id INT PRIMARY KEY auto_increment,
    nome VARCHAR(45)
);

-- Tabela de pedidos
CREATE TABLE pedido (
    id INT PRIMARY KEY auto_increment,
    data DATE,
    total DOUBLE,
    forma_pagamento VARCHAR(45),
    usuario_id INT,
    status_pagamento_id INT,
    status_pedido_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (status_pagamento_id) REFERENCES status_pagamento(id),
    FOREIGN KEY (status_pedido_id) REFERENCES status_pedido(id)
);

-- Itens dentro do pedido
CREATE TABLE item_pedido (
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Endereço do usuário
CREATE TABLE endereco (
    id INT PRIMARY KEY auto_increment,
    cep VARCHAR(14),
    logradouro VARCHAR(45),
    bairro VARCHAR(45),
    numero INT,
    complemento VARCHAR(45),
    cidade VARCHAR(45),
    estado CHAR(2),
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Produtos favoritos dos usuários
CREATE TABLE favorito (
    usuario_id INT,
    produto_id INT,
    marcado VARCHAR(10),
    PRIMARY KEY (usuario_id, produto_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Tipos de acabamento do modelo
CREATE TABLE acabamento (
    id INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    modelo_id INT,
    FOREIGN KEY (modelo_id) REFERENCES modelo(id)
);

-- Características gerais (ex: material, tipo de fecho)
CREATE TABLE caracteristica (
    id INT PRIMARY KEY auto_increment,
    descricao VARCHAR(45)
);

-- Detalhes das características (ex: algodão, inox)
CREATE TABLE caracteristica_detalhe (
    id INT,
    caracteristica_id INT,
    descricao VARCHAR(45),
    PRIMARY KEY (id, caracteristica_id),
    FOREIGN KEY (caracteristica_id) REFERENCES caracteristica(id)
);

-- Relaciona um modelo com seus detalhes de características
CREATE TABLE modelo_caracteristica (
    modelo_id INT,
    detalhe_id INT,
    PRIMARY KEY (modelo_id, detalhe_id),
    FOREIGN KEY (modelo_id) REFERENCES modelo(id),
    FOREIGN KEY (detalhe_id) REFERENCES caracteristica_detalhe(id)
);
