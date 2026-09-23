-- ==========================================
--           CONHECENDO O ACERVO
-- ==========================================

-- 1. Catálogo completo
-- Mostrar título, ano de publicação e quantidade de páginas.

SELECT titulo, ano_publicacao, quantidade_paginas
FROM livros;

-- 2. Livros publicados recentemente
-- Mostrar livros publicados a partir de 2000.

SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao >= 2000;

-- 3. Livros mais antigos
-- Mostrar os 5 livros mais antigos da coleção.

SELECT titulo, ano_publicacao
FROM livros
ORDER BY ano_publicacao ASC
LIMIT 5;

-- 4. Livros grandes
-- Mostrar livros com mais de 700 páginas.

SELECT titulo, quantidade_paginas
FROM livros
WHERE quantidade_paginas > 700;

-- 5. Livros de um período
-- Mostrar livros publicados entre 1970 e 1980, inclusive.

SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao BETWEEN 1970 AND 1980
ORDER BY ano_publicacao ASC;

-- ==========================================
--            AUTORES E CATÁLOGO
-- ==========================================

-- 6. Livros de um autor específico
-- Quais livros de Stephen King estão cadastrados na biblioteca

SELECT livros.titulo, livros.ano_publicacao
FROM livros
JOIN livros_autores
	ON livros.id = livros_autores.id_livro
JOIN autores
	ON autores.id = livros_autores.id_autor
WHERE autores.nome = 'Stephen King'
ORDER BY livros.ano_publicacao ASC;

-- 7. Agora vamos explorar o catálogo
-- Quais autores estão cadastrados, mas não possuem livros no acervo?

SELECT autores.nome
FROM autores
LEFT JOIN livros_autores
    ON autores.id = livros_autores.id_autor
WHERE livros_autores.id_autor IS NULL;

-- 8. Quantidade de livros por autor
-- Quantos livros temos cadastrados de cada autor?

SELECT autores.nome, COUNT(livros_autores.id_livro) AS quantidade_livros
FROM autores
LEFT JOIN livros_autores
    ON autores.id = livros_autores.id_autor
GROUP BY autores.nome;

-- 9. Autores de um livro específico
-- Quais são os autores cadastrados para A Sociedade do Anel?

SELECT autores.nome
FROM autores
JOIN livros_autores
	ON autores.id = livros_autores.id_autor
JOIN livros
	ON livros.id = livros_autores.id_livro
WHERE livros.titulo = 'A Sociedade do Anel';

-- ==========================================
--                GÊNEROS
-- ==========================================

-- 10. Livros por gênero
-- Quantos livros temos cadastrados em cada gênero?

SELECT generos.nome, COUNT(livros_generos.id_livro) AS quantidade_livros
FROM generos
LEFT JOIN livros_generos
	ON generos.id = livros_generos.id_genero
GROUP BY generos.nome;

-- 11. Livros de um gênero específico
-- Quais livros de ficção científica estão cadastrados?

SELECT livros.titulo, livros.ano_publicacao
FROM livros
JOIN livros_generos
	ON livros.id = livros_generos.id_livro
JOIN generos
	ON generos.id = livros_generos.id_genero
WHERE generos.nome = 'Ficção Científica'
ORDER BY ano_publicacao ASC;

-- 12. Livros com múltiplos gêneros
-- Quais livros possuem mais de um gênero associado?

SELECT livros.titulo, COUNT(livros_generos.id_genero) AS quantidade_generos
FROM livros
JOIN livros_generos
	ON livros.id = livros_generos.id_livro
GROUP BY livros.id, livros.titulo
HAVING COUNT(livros_generos.id_genero) > 1
ORDER BY livros.titulo ASC;

-- ==========================================
--                EMPRÉSTIMOS
-- ==========================================

-- 13. Empréstimos em aberto
-- Quais livros estão atualmente emprestados e ainda não foram devolvidos?

SELECT livros.titulo, emprestimos.data_emprestimo, emprestimos.data_previsao_devolucao
FROM livros
JOIN emprestimos
	ON livros.id = emprestimos.id_livro
WHERE emprestimos.data_devolucao IS NULL
ORDER BY emprestimos.data_emprestimo ASC;

-- 14. Histórico de empréstimos de um leitor
-- Quais livros Sherlock Holmes já pegou emprestado e em quais datas?

SELECT livros.titulo, emprestimos.data_emprestimo, emprestimos.data_devolucao, emprestimos.data_previsao_devolucao
FROM livros
JOIN emprestimos
	ON livros.id = emprestimos.id_livro
JOIN leitores
	ON leitores.id = emprestimos.id_leitor
WHERE leitores.nome = 'Sherlock Holmes'
ORDER BY emprestimos.data_previsao_devolucao DESC;

-- 15. Livros mais emprestados
-- Quais livros tiveram mais empréstimos?

SELECT livros.titulo, COUNT(emprestimos.id_livro) AS numero_vezes_emprestado
FROM livros
JOIN emprestimos
	ON livros.id = emprestimos.id_livro
GROUP BY livros.id, livros.titulo
ORDER BY numero_vezes_emprestado DESC, livros.titulo ASC;

-- 16. Leitores com mais empréstimos
-- Quais leitores realizaram mais empréstimos? Nome e quantidade de empréstimos.

SELECT leitores.nome, COUNT(emprestimos.id_leitor) AS quantidade_emprestimos
FROM leitores
JOIN emprestimos
	ON leitores.id = emprestimos.id_leitor
GROUP BY leitores.id, leitores.nome
ORDER BY quantidade_emprestimos DESC, leitores.nome ASC;

-- 17. Empréstimos ainda não devolvidos
-- Liste os empréstimos que ainda não foram devolvidos.
SELECT leitores.nome, livros.titulo, emprestimos.data_emprestimo, emprestimos.data_previsao_devolucao 
FROM livros
JOIN emprestimos
    ON livros.id = emprestimos.id_livro
JOIN leitores
    ON leitores.id = emprestimos.id_leitor
WHERE emprestimos.data_devolucao IS NULL
ORDER BY emprestimos.data_previsao_devolucao ASC;