-- Criando banco de dados

CREATE DATABASE supply_chain_sql;

-- Acessar banco de dados

USE supply_chain_sql;

-- Tabelas principais

CREATE TABLE clientes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    cep CHAR(8) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(150) NOT NULL
    );
    
CREATE TABLE fornecedores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(100),
    cnpj CHAR(14) NOT NULL UNIQUE,
	logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    cep CHAR(8) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(150) NOT NULL
    );

CREATE TABLE centros_distribuicao (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
	logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    cep CHAR(8) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    capacidade_maxima INT NOT NULL
	);
    
CREATE TABLE transportadoras (
	id INT AUTO_INCREMENT PRIMARY KEY,
	razao_social VARCHAR(150) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
	logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    cep CHAR(8) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(150) NOT NULL
    );
    
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100)
    );
    
CREATE TABLE produtos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    codigo_sku VARCHAR(50) NOT NULL UNIQUE,
    material VARCHAR(100),
    descricao VARCHAR(255),
    preco_custo DECIMAL(10,2) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
    );

CREATE TABLE pedidos (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    data_pedido DATE NOT NULL,
    status_pedido VARCHAR(20) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(40) NOT NULL,
	id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
    );
    
CREATE TABLE itens_pedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
	UNIQUE (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
	FOREIGN KEY (id_produto) REFERENCES produtos(id)
    );
    
CREATE TABLE produtos_fornecedores (
    id_fornecedor INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (id_fornecedor, id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
	);
    
CREATE TABLE estoque (
	id_centro_distribuicao INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_produto, id_centro_distribuicao),
    FOREIGN KEY (id_centro_distribuicao) REFERENCES centros_distribuicao(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
    );
    
CREATE TABLE entregas (
	id_centro_distribuicao INT NOT NULL,
    id_pedido INT NOT NULL,
    id_transportadora INT NOT NULL,
    data_prevista DATE NOT NULL,
    data_entrega DATE,
    status_entrega VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_pedido, id_centro_distribuicao),
    FOREIGN KEY (id_centro_distribuicao) REFERENCES centros_distribuicao(id),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    FOREIGN KEY (id_transportadora) REFERENCES transportadoras(id)
    );