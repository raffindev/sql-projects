-- ==========================================
--         Visão geral de produtos
-- ==========================================

-- 01. Produtos cadastrados
-- Quais produtos estão cadastrados e qual é o preço de venda de cada um?

SELECT nome, preco_venda
FROM Produtos
ORDER BY preco_venda DESC, nome ASC;

-- 02. Produtos por categoria
-- Quais produtos pertencem a cada categoria do catálogo da Supply Chain?

SELECT produtos.nome AS produto, categorias.nome AS categoria
FROM produtos
JOIN categorias
	ON categorias.id = produtos.id_categoria
ORDER BY categorias.nome ASC, produtos.nome ASC;

-- 03. Quantidade produtos por categoria
-- Quais categorias possuem produtos cadastrados e quantos produtos existem em cada uma delas?

SELECT categorias.nome AS categoria, COUNT(produtos.id) AS quantidade_produtos
FROM categorias
JOIN produtos
    ON categorias.id = produtos.id_categoria
GROUP BY categorias.id, categorias.nome;

-- ==========================================
--            Clientes e vendas
-- ==========================================

-- 04. Relacionamento com clientes
-- Quais clientes realizaram pedidos e quais foram os respectivos valores desses pedidos?

SELECT clientes.nome, pedidos.valor_total
from clientes
JOIN pedidos
	ON clientes.id = pedidos.id_cliente
WHERE pedidos.status_pedido <> 'Cancelado'
ORDER BY clientes.nome ASC, pedidos.valor_total ASC;

-- 05. Clientes recorrentes
-- Quais clientes realizaram mais de um pedido durante setembro de 2026?

SELECT clientes.nome, COUNT(pedidos.id) AS quantidade_pedidos
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.id_cliente
WHERE data_pedido >= '2026-09-01' AND data_pedido < '2026-10-01'
GROUP BY clientes.id, clientes.nome
HAVING COUNT(pedidos.id) > 1
ORDER BY quantidade_pedidos DESC;

-- 06. Pedidos de maior valor
-- Durante o período de 01/09/2026 a 15/09/2026, quais foram os pedidos de maior valor realizados?

SELECT pedidos.id AS Pedido, clientes.nome, pedidos.valor_total
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.id_cliente
WHERE data_pedido BETWEEN '2026-09-01'AND '2026-09-15'
ORDER BY pedidos.valor_total DESC;

-- 07. Distribuição dos pedidos
-- Como os pedidos foram distribuídos ao longo do período de 08/09/2026 a 15/09/2026, considerando a quantidade de pedidos e o valor movimentado por dia?

SELECT pedidos.data_pedido, COUNT(*) AS quantidade_pedidos, SUM(pedidos.valor_total) AS valor_movimentado
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.id_cliente
WHERE pedidos.data_pedido BETWEEN '2026-09-08' AND '2026-09-15'
GROUP BY pedidos.data_pedido
ORDER BY pedidos.data_pedido ASC;

-- 08. Valor movimentado por cliente
-- Quais clientes movimentaram os maiores valores em pedidos durante setembro de 2026?

SELECT clientes.nome, SUM(pedidos.valor_total) AS valor_movimentado
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.id_cliente
WHERE data_pedido >= '2026-09-01' AND data_pedido < '2026-10-01'
GROUP BY clientes.id, clientes.nome
ORDER BY valor_movimentado DESC;

-- 09. Formas de pagamento por cliente
-- Quais formas de pagamento foram utilizadas por cada cliente durante setembro de 2026 e qual foi o valor movimentado em cada uma delas?

SELECT clientes.nome, pedidos.forma_pagamento, SUM(pedidos.valor_total) AS valor_forma_pagamento
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.id_cliente
WHERE data_pedido >= '2026-09-01' AND data_pedido < '2026-10-01'
GROUP BY clientes.id, clientes.nome, pedidos.forma_pagamento
ORDER BY clientes.nome ASC, pedidos.forma_pagamento ASC; 

-- ==========================================
--           Situação dos pedidos
-- ==========================================

-- 10. Pedidos em processamento
-- Quais pedidos estão atualmente em processamento e qual o valor envolvido em cada um?

SELECT id, status_pedido, valor_total
FROM pedidos
WHERE status_pedido = 'Processando'
ORDER BY valor_total DESC;

-- 11. Pedidos cancelados
-- Quais pedidos foram cancelados durante o periodo de 08/09/2026 a 15/09/2026 e qual foi o valor total envolvido nesses cancelamentos?

SELECT id, status_pedido, valor_total
FROM pedidos
WHERE status_pedido = 'Cancelado'
  AND data_pedido BETWEEN '2026-09-08' AND '2026-09-15';

-- 12. Visão geral da situação dos pedidos
-- Considerando todos os pedidos realizados durante setembro de 2026, apresente cada situação de pedido, a quantidade de pedidos e o valor total movimentado em cada situação, incluindo os pedidos cancelados.

SELECT status_pedido, COUNT(*) AS quantidade_pedidos, SUM(valor_total) AS valor_total_status
FROM pedidos
WHERE data_pedido >= '2026-09-01'
  AND data_pedido < '2026-10-01'
GROUP BY status_pedido
ORDER BY status_pedido;

-- ==========================================
--            Produtos vendidos
-- ==========================================

-- 13. Volume de produtos vendidos
-- Quais produtos foram vendidos e quantas unidades de cada produto foram comercializadas?

SELECT produtos.nome, SUM(itens_pedido.quantidade) AS quantidade
FROM produtos
JOIN itens_pedido
    ON produtos.id = itens_pedido.id_produto
JOIN pedidos
    ON pedidos.id = itens_pedido.id_pedido
WHERE pedidos.status_pedido <> 'Cancelado'
GROUP BY produtos.id, produtos.nome;

-- 14. Faturamento por produto
-- Quais produtos geraram os maiores valores em vendas, considerando apenas os pedidos que não foram cancelados?

SELECT produtos.nome, SUM(itens_pedido.quantidade * produtos.preco_venda) AS valor_venda
FROM produtos
JOIN itens_pedido
    ON produtos.id = itens_pedido.id_produto
JOIN pedidos
    ON pedidos.id = itens_pedido.id_pedido
WHERE pedidos.status_pedido <> 'Cancelado'
GROUP BY produtos.nome
ORDER BY valor_venda DESC;

-- 15. Produtos sem vendas
-- Quais produtos estão cadastrados atualmente, mas não tiveram nenhuma unidade vendida nos pedidos não cancelados?

SELECT produtos.nome
FROM produtos
LEFT JOIN itens_pedido
    ON produtos.id = itens_pedido.id_produto
LEFT JOIN pedidos
    ON pedidos.id = itens_pedido.id_pedido
    AND pedidos.status_pedido <> 'Cancelado'
WHERE pedidos.id IS NULL;

-- ==========================================
--     Estoque e Centros de Distribuição
-- ==========================================

-- 16. Estoque por centro de distribuição
-- Quais produtos estão armazenados em cada centro de distribuição e qual a quantidade disponível de cada produto?

SELECT produtos.nome, centros_distribuicao.nome, SUM(estoque.quantidade) AS quantidade_disponivel
FROM produtos
JOIN estoque
	ON produtos.id = estoque.id_produto
JOIN centros_distribuicao
	ON centros_distribuicao.id = estoque.id_centro_distribuicao
GROUP BY produtos.id, produtos.nome,
         centros_distribuicao.id, centros_distribuicao.nome
ORDER BY centros_distribuicao.nome ASC, produtos.nome ASC;

-- 17. Estoque total por produto
-- Considerando todos os centros de distribuição, quais produtos possuem as maiores quantidades totais disponíveis em estoque?

SELECT produtos.nome AS produto, SUM(estoque.quantidade) AS quantidade_total
FROM produtos
JOIN estoque
    ON produtos.id = estoque.id_produto
GROUP BY produtos.id, produtos.nome
ORDER BY quantidade_total DESC;

-- 18. Estoque concentrado
-- Quais produtos estão armazenados em mais de um centro de distribuição?

SELECT produtos.nome AS produto, COUNT(*) AS centros
FROM produtos
JOIN estoque
    ON produtos.id = estoque.id_produto
JOIN centros_distribuicao
    ON centros_distribuicao.id = estoque.id_centro_distribuicao
GROUP BY produtos.id, produtos.nome
HAVING COUNT(*) > 1;

-- 19. Capacidade de distribuição
-- Quais centros de distribuição possuem a maior quantidade total de produtos armazenados e qual é o total disponível em cada centro?

SELECT centros_distribuicao.nome,
       centros_distribuicao.capacidade_maxima,
       SUM(estoque.quantidade) AS capacidade_atual
FROM centros_distribuicao
JOIN estoque
    ON centros_distribuicao.id = estoque.id_centro_distribuicao
GROUP BY centros_distribuicao.id, centros_distribuicao.nome
ORDER BY capacidade_atual DESC;

-- 20. Ocupação dos centros de distribuição
-- Quais centros de distribuição estão utilizando a maior proporção de sua capacidade máxima e qual é o percentual de ocupação de cada um?

SELECT
    centros_distribuicao.nome,
    centros_distribuicao.capacidade_maxima,
    SUM(estoque.quantidade) AS capacidade_atual,
    ROUND((SUM(estoque.quantidade) / centros_distribuicao.capacidade_maxima) * 100,2) AS percentual_ocupacao
FROM centros_distribuicao
JOIN estoque
    ON centros_distribuicao.id = estoque.id_centro_distribuicao
GROUP BY centros_distribuicao.id, centros_distribuicao.nome
ORDER BY percentual_ocupacao DESC;

-- ==========================================
--         Fornecedores e produtos
-- ==========================================

-- 21. Produtos por fornecedor
-- Quais produtos são fornecidos por cada fornecedor e quais são os respectivos preços de venda desses produtos?

SELECT produtos.nome, fornecedores.nome_fantasia AS fornecedor, produtos.preco_venda
FROM produtos
JOIN produtos_fornecedores
	ON produtos.id = produtos_fornecedores.id_produto
JOIN fornecedores
	ON fornecedores.id = produtos_fornecedores.id_fornecedor
ORDER BY fornecedores.nome_fantasia ASC, produtos.nome ASC;

-- 22. Diversificação de fornecedores
-- Quais fornecedores trabalham com mais de três produtos diferentes e quantos produtos cada um fornece?

SELECT fornecedores.nome_fantasia AS fornecedor, COUNT(DISTINCT produtos.id) AS quantidade_produtos
FROM produtos
JOIN produtos_fornecedores
    ON produtos.id = produtos_fornecedores.id_produto
JOIN fornecedores
    ON fornecedores.id = produtos_fornecedores.id_fornecedor
GROUP BY fornecedores.id, fornecedores.nome_fantasia
HAVING COUNT(DISTINCT produtos.id) > 3
ORDER BY fornecedores.nome_fantasia ASC;

-- 23. Dependência de fornecedores
-- Quais produtos possuem apenas um fornecedor cadastrado e qual é o fornecedor responsável por cada um deles?

SELECT produtos.nome AS produto, fornecedores.nome_fantasia AS fornecedor
FROM produtos
JOIN produtos_fornecedores
    ON produtos.id = produtos_fornecedores.id_produto
JOIN fornecedores
    ON fornecedores.id = produtos_fornecedores.id_fornecedor
WHERE produtos.id IN (
    SELECT id_produto
    FROM produtos_fornecedores
    GROUP BY id_produto
    HAVING COUNT(DISTINCT id_fornecedor) = 1
)
ORDER BY produtos.nome ASC;

-- ==========================================
--           Logística e entregas
-- ==========================================

-- 24. Situação das entregas
-- Quais pedidos estão atualmente com as entregas em preparação ou em trânsito?

SELECT id_pedido, status_entrega
FROM entregas
WHERE status_entrega IN ('Em preparação', 'Em trânsito')

-- 25. Prazo das entregas
-- Entre as entregas que já foram concluídas, quais pedidos foram entregues antes da data prevista e quantos dias de antecedência tiveram?

SELECT id_pedido, status_entrega, DATEDIFF(data_prevista, data_entrega) AS dias_antecedencia
FROM entregas
WHERE status_entrega = 'Entregue'
  AND data_entrega < data_prevista;

-- 26. Desempenho das transportadoras
-- Quantas entregas cada transportadora já concluiu durante setembro de 2026?

SELECT id_transportadora, COUNT(status_entrega) AS quantidade_entregas
FROM entregas
WHERE status_entrega = 'Entregue'
  AND data_entrega >= '2026-09-01'
  AND data_entrega < '2026-10-01'
GROUP BY id_transportadora;

-- ==========================================
--            Relatório gerencial
-- ==========================================

-- 27. Faturamento por período
-- Qual foi o valor total movimentado em cada dia de setembro de 2026, considerando apenas pedidos não cancelados?

SELECT data_pedido, SUM(valor_total) AS valor_dia
FROM pedidos
WHERE status_pedido <> 'Cancelado'
  AND data_pedido >= '2026-09-01'
  AND data_pedido < '2026-10-01'
GROUP BY data_pedido
ORDER BY data_pedido;

-- 28. Desempenho por categoria
-- Quais categorias de produtos geraram os maiores valores em vendas e quantas unidades foram comercializadas em cada uma?

SELECT categorias.nome AS categoria,
       SUM(itens_pedido.quantidade) AS unidades_vendidas,
       SUM(itens_pedido.quantidade * produtos.preco_venda) AS valor_vendas
FROM categorias
JOIN produtos
    ON categorias.id = produtos.id_categoria
JOIN itens_pedido
    ON produtos.id = itens_pedido.id_produto
JOIN pedidos
    ON itens_pedido.id_pedido = pedidos.id
WHERE pedidos.status_pedido <> 'Cancelado'
GROUP BY categorias.id, categorias.nome
ORDER BY valor_vendas DESC;

-- 29. Clientes e recorrência
-- Quais clientes realizaram pedidos em setembro de 2026, quantos pedidos fizeram e quanto movimentaram no período?

SELECT clientes.nome,
       COUNT(pedidos.id) AS quantidade_pedidos,
       SUM(pedidos.valor_total) AS valor_movimentado
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.id_cliente
WHERE pedidos.data_pedido >= '2026-09-01'
  AND pedidos.data_pedido < '2026-10-01'
  AND pedidos.status_pedido <> 'Cancelado'
GROUP BY clientes.id, clientes.nome
ORDER BY valor_movimentado DESC;

-- 30. Situação do estoque
-- Quais produtos possuem estoque total inferior a 50 unidades considerando todos os centros de distribuição?

SELECT produtos.nome,
       SUM(estoque.quantidade) AS estoque_total
FROM produtos
JOIN estoque
    ON produtos.id = estoque.id_produto
GROUP BY produtos.id, produtos.nome
HAVING SUM(estoque.quantidade) < 50
ORDER BY estoque_total ASC;
