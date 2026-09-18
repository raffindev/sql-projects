-- Criando banco de dados

CREATE DATABASE biblioteca_sql;

-- Acessar banco de dados

USE biblioteca_sql;

-- Tabelas principais

CREATE TABLE autores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    ano_nascimento INT,
    nacionalidade VARCHAR(50)
    );

CREATE TABLE livros (
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200),
    ano_publicacao INT,
    quantidade_paginas INT
    );

CREATE TABLE generos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
    );

CREATE TABLE leitores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
    );

-- Tabelas de relacionamento

CREATE TABLE livros_autores (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livros(id),
    FOREIGN KEY (id_autor) REFERENCES autores(id)
);

CREATE TABLE livros_generos (
    id_livro INT,
    id_genero INT,
    PRIMARY KEY (id_livro, id_genero),
    FOREIGN KEY (id_livro) REFERENCES livros(id),
    FOREIGN KEY (id_genero) REFERENCES generos(id)
);

-- Tabela de empréstimos

CREATE TABLE emprestimos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    id_leitor INT,
    data_emprestimo DATE,
    data_previsao_devolucao DATE,
    data_devolucao DATE,
    FOREIGN KEY (id_livro) REFERENCES livros(id),
    FOREIGN KEY (id_leitor) REFERENCES leitores(id)
    );