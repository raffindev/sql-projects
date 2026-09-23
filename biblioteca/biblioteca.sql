CREATE DATABASE biblioteca_sql;

USE biblioteca_sql;

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

INSERT INTO autores (nome, ano_nascimento, nacionalidade)
VALUES
    ("J. R. R. Tolkien", 1892, "Britânica"),
    ("George Lucas", 1944, "Americana"),
    ("J. K. Rowling", 1965, "Britânica"),
    ("Stephen King", 1947, "Americana"),
    ("George R. R. Martin", 1948, "Americana"),
	('Agatha Christie', 1890, 'Britânica'),
	('Neil Gaiman', 1960, 'Britânico');

INSERT INTO livros (titulo, ano_publicacao, quantidade_paginas)
VALUES
	("O Hobbit", 1937, 310),
    ("A Sociedade do Anel", 1954, 432),
    ("As Duas Torres", 1954, 448),
    ("O Retorno do Rei", 1955, 432),
    ("Mestre Gil de Ham", 1949, 127),
    ("Star Wars: From the Adventures of Luke Skywalker", 1976, 182),
    ("The Empire Strikes Back", 1980, 256),
    ("Return of the Jedi", 1983, 224),
    ("Harry Potter e a Pedra Filosofal", 1997, 223),
    ("Harry Potter e a Câmara Secreta", 1998, 251),
    ("Harry Potter e o Prisioneiro de Azkaban", 1999, 287),
    ("Harry Potter e o Cálice de Fogo", 2000, 583),
    ("Harry Potter e a Ordem da Fênix", 2003, 766),
    ("Carrie", 1974, 199),
    ("Salem", 1975, 439),
    ("O Iluminado", 1977, 447),
    ("A Dança da Morte", 1978, 823),
    ("A Zona Morta", 1979, 428),
    ("A Guerra dos Tronos", 1996, 694),
    ("A Fúria dos Reis", 1999, 768),
    ("A Tormenta de Espadas", 2000, 992),
    ("O Festim dos Corvos", 2005, 753),
    ("A Dança dos Dragões", 2011, 1125);

INSERT INTO livros_autores (id_livro, id_autor)
VALUES
	-- Tolkien
    (1, 1),   -- O Hobbit
    (2, 1),   -- A Sociedade do Anel
    (3, 1),   -- As Duas Torres
    (4, 1),   -- O Retorno do Rei
    (5, 1),   -- Mestre Gil de Ham

    -- George Lucas
    (6, 2),   -- Star Wars: From the Adventures of Luke Skywalker
    (7, 2),   -- The Empire Strikes Back
    (8, 2),   -- Return of the Jedi

    -- J. K. Rowling
    (9, 3),   -- Harry Potter e a Pedra Filosofal
    (10, 3),  -- Harry Potter e a Câmara Secreta
    (11, 3),  -- Harry Potter e o Prisioneiro de Azkaban
    (12, 3),  -- Harry Potter e o Cálice de Fogo
    (13, 3),  -- Harry Potter e a Ordem da Fênix

    -- Stephen King
    (14, 4),  -- Carrie
    (15, 4),  -- Salem
    (16, 4),  -- O Iluminado
    (17, 4),  -- A Dança da Morte
    (18, 4),  -- A Zona Morta

    -- George R. R. Martin
    (19, 5),  -- A Guerra dos Tronos
    (20, 5),  -- A Fúria dos Reis
    (21, 5),  -- A Tormenta de Espadas
    (22, 5),  -- O Festim dos Corvos
    (23, 5);  -- A Dança dos Dragões

INSERT INTO generos (nome)
VALUES
    ('Ficção'),
    ('Romance'),
    ('Fantasia'),
    ('Ficção Científica'),
    ('Mistério'),
    ('História'),
    ('Biografia'),
    ('Aventura'),
    ('Drama'),
    ('Policial'),
    ('Clássico'),
    ('Filosofia'),
    ('Poesia'),
	('Terror'),
    ('Suspense');
    
INSERT INTO leitores (nome)
VALUES
    ('Jack Sparrow'),
    ('Obi-Wan Kenobi'),
    ('Sherlock Holmes'),
    ('Hermione Granger'),
    ('Frodo Bolseiro'),
    ('Katniss Everdeen'),
    ('Peter Parker'),
    ('Bruce Wayne');
    
INSERT INTO livros_generos (id_livro, id_genero)
VALUES
    -- Tolkien
    (1, 3),   -- O Hobbit → Fantasia
    (1, 8),   -- O Hobbit → Aventura
    (2, 3),   -- A Sociedade do Anel → Fantasia
    (2, 8),   -- A Sociedade do Anel → Aventura
    (3, 3),   -- As Duas Torres → Fantasia
    (3, 8),   -- As Duas Torres → Aventura
    (4, 3),   -- O Retorno do Rei → Fantasia
    (4, 8),   -- O Retorno do Rei → Aventura
    (5, 3),   -- Mestre Gil de Ham → Fantasia

    -- Star Wars
    (6, 4),   -- Star Wars → Ficção Científica
    (6, 8),   -- Star Wars → Aventura
    (7, 4),   -- The Empire Strikes Back → Ficção Científica
    (7, 8),   -- The Empire Strikes Back → Aventura
    (8, 4),   -- Return of the Jedi → Ficção Científica
    (8, 8),   -- Return of the Jedi → Aventura

    -- Harry Potter
    (9, 3),   -- Pedra Filosofal → Fantasia
    (9, 8),   -- Pedra Filosofal → Aventura
    (10, 3),  -- Câmara Secreta → Fantasia
    (10, 5),  -- Câmara Secreta → Mistério
    (11, 3),  -- Prisioneiro de Azkaban → Fantasia
    (11, 5),  -- Prisioneiro de Azkaban → Mistério
    (12, 3),  -- Cálice de Fogo → Fantasia
    (12, 8),  -- Cálice de Fogo → Aventura
    (13, 3),  -- Ordem da Fênix → Fantasia
    (13, 9),  -- Ordem da Fênix → Drama

    -- Stephen King
    (14, 14), -- Carrie → Terror
    (15, 14), -- Salem → Terror
    (16, 14), -- O Iluminado → Terror
    (17, 14), -- A Dança da Morte → Terror
    (18, 15), -- A Zona Morta → Suspense

    -- As Crônicas de Gelo e Fogo
    (19, 3),  -- A Guerra dos Tronos → Fantasia
    (19, 9),  -- A Guerra dos Tronos → Drama
    (20, 3),  -- A Fúria dos Reis → Fantasia
    (20, 9),  -- A Fúria dos Reis → Drama
    (21, 3),  -- A Tormenta de Espadas → Fantasia
    (21, 9),  -- A Tormenta de Espadas → Drama
    (22, 3),  -- O Festim dos Corvos → Fantasia
    (22, 9),  -- O Festim dos Corvos → Drama
    (23, 3),  -- A Dança dos Dragões → Fantasia
    (23, 9);  -- A Dança dos Dragões → Drama
    
-- Livros / Leitores
INSERT INTO emprestimos (id_livro, id_leitor, data_emprestimo, data_previsao_devolucao, data_devolucao)
VALUES
    -- Frodo Bolseiro → 3 empréstimos
    (2, 5, '2026-01-10', '2026-01-24', '2026-01-23'), -- A Sociedade do Anel
    (3, 5, '2026-01-30', '2026-02-13', '2026-02-12'), -- As Duas Torres
    (4, 5, '2026-02-20', '2026-03-06', '2026-03-05'), -- O Retorno do Rei

    -- Bruce Wayne → 5 empréstimos
    (19, 8, '2026-02-01', '2026-02-15', '2026-02-14'), -- A Guerra dos Tronos
    (20, 8, '2026-02-20', '2026-03-06', '2026-03-05'), -- A Fúria dos Reis
    (21, 8, '2026-03-15', '2026-03-29', '2026-03-28'), -- A Tormenta de Espadas
    (22, 8, '2026-04-05', '2026-04-19', '2026-04-18'), -- O Festim dos Corvos
    (23, 8, '2026-04-25', '2026-05-09', '2026-05-08'), -- A Dança dos Dragões

    -- Jack Sparrow → 3 empréstimos
    (1, 1, '2026-03-01', '2026-03-15', '2026-03-14'), -- O Hobbit
    (14, 1, '2026-05-01', '2026-05-15', '2026-05-14'), -- Carrie
    (17, 1, '2026-07-20', '2026-08-03', '2026-08-02'), -- A Dança da Morte

    -- Hermione Granger → 5 empréstimos
    (9, 4, '2026-04-05', '2026-04-19', '2026-04-18'), -- A Pedra Filosofal
    (10, 4, '2026-04-25', '2026-05-09', '2026-05-08'), -- A Câmara Secreta
    (11, 4, '2026-05-20', '2026-06-03', '2026-06-02'), -- O Prisioneiro de Azkaban
    (12, 4, '2026-06-15', '2026-06-29', '2026-06-28'), -- O Cálice de Fogo
    (16, 4, '2026-08-10', '2026-08-24', NULL),          -- O Iluminado

    -- Obi-Wan Kenobi → 1 empréstimo
    (6, 2, '2026-05-15', '2026-05-29', '2026-05-28'), -- Star Wars

    -- Sherlock Holmes → 5 empréstimos
    (16, 3, '2026-01-15', '2026-01-29', '2026-01-28'), -- O Iluminado
    (18, 3, '2026-03-25', '2026-04-08', '2026-04-07'), -- A Zona Morta
    (1, 3, '2026-05-25', '2026-06-08', '2026-06-07'), -- O Hobbit
    (4, 3, '2026-07-01', '2026-07-15', '2026-07-14'), -- O Retorno do Rei
    (20, 3, '2026-08-01', '2026-08-15', NULL),          -- A Fúria dos Reis

    -- Peter Parker → 5 empréstimos
    (19, 7, '2026-03-01', '2026-03-15', '2026-03-14'), -- A Guerra dos Tronos
    (7, 7, '2026-04-15', '2026-04-29', '2026-04-28'), -- The Empire Strikes Back
    (1, 7, '2026-06-20', '2026-07-04', '2026-07-03'), -- O Hobbit
    (14, 7, '2026-07-25', '2026-08-08', '2026-08-07'), -- Carrie
    (21, 7, '2026-09-01', '2026-09-15', NULL), -- A Tormenta de Espadas

    -- Katniss Everdeen → 1 empréstimo
    (13, 6, '2026-09-01', '2026-09-15', '2026-09-14'); -- Harry Potter e a Ordem da Fênix
    