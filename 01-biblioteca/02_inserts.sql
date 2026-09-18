-- Inserção de dados

-- Autores
INSERT INTO autores (nome, ano_nascimento, nacionalidade)
VALUES
    ("J. R. R. Tolkien", 1892, "Britânica"),
    ("George Lucas", 1944, "Americana"),
    ("J. K. Rowling", 1965, "Britânica"),
    ("Stephen King", 1947, "Americana"),
    ("George R. R. Martin", 1948, "Americana"),
	('Agatha Christie', 1890, 'Britânica'),
	('Neil Gaiman', 1960, 'Britânico');

-- Livros
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

-- Generos
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
    ('Poesia')
    ('Terror'),
    ('Suspense');

-- Leitores
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
