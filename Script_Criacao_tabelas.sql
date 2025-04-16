CREATE DATABASE preciosos_lacos;

use preciosos_lacos;

CREATE TABLE usuario (
 id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nome_completo VARCHAR(100) NOT NULL,
 email VARCHAR(100) NOT NULL UNIQUE,
 senha CHAR(8) NOT NULL,
 cpf VARCHAR(14) NOT NULL UNIQUE,
 telefone VARCHAR(15) NOT NULL,
 data_cadastro DATE
 );

CREATE TABLE endereco(
	id_endereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(14),
    logradouro VARCHAR(45),
    bairro VARCHAR(45),
    numero INT,
    complemento VARCHAR(45),
    localidade VARCHAR(45),
    uf CHAR(2)
);

CREATE TABLE pedido(
	id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE,
    status_pagamento VARCHAR(45),
    status_pedido VARCHAR(45),
    total DOUBLE,
    forma_pagamento VARCHAR(45)
);


CREATE TABLE modelo(
	id_modelo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_modelo VARCHAR(100),
    preco DOUBLE,
    descricao VARCHAR(256),
    foto VARCHAR(256)
);

CREATE TABLE produto(
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tamanho CHAR(3),
    cor VARCHAR(45),
    tipo_laco VARCHAR(45),
    acabamento VARCHAR(45),
    preco_final DOUBLE
);

CREATE TABLE favorito(
	fkUsuario INT NOT NULL,
    fkProduto INT NOT NULL,
    favorito VARCHAR(45),
	CONSTRAINT usuarioFavorito FOREIGN KEY(fkUsuario) REFERENCES usuario(id_usuario),
    CONSTRAINT produtoFavorito FOREIGN KEY(fkProduto) REFERENCES produto(id_produto)
);

CREATE TABLE itens_pedido(
	fkPedido INT NOT NULL,
    fkProduto INT NOT NULL,
    quantidade INT,
    CONSTRAINT pedidoItens FOREIGN KEY(fkPedido) REFERENCES pedido(id_pedido),
    CONSTRAINT produtoItens FOREIGN KEY(fkProduto) REFERENCES produto(id_produto)
);




