# 🚚 Logística & Supply Chain SQL

Projeto de banco de dados desenvolvido para praticar **SQL e modelagem relacional** utilizando MySQL.

O projeto simula uma operação de logística e Supply Chain, permitindo cadastrar clientes, fornecedores, produtos, centros de distribuição e transportadoras, além de registrar pedidos, estoque, entregas e relacionamentos entre produtos e fornecedores.

## 🎯 Objetivo

Praticar, de forma aplicada, conceitos de SQL e banco de dados relacional em um cenário próximo de uma operação comercial e logística:

* Criação e organização de bancos de dados;

* Criação de tabelas;

* Chaves primárias e estrangeiras;

* Relacionamentos entre tabelas;

* Relacionamentos muitos-para-muitos;

* Inserção de dados;

* Consultas com `SELECT`;

* Filtros com `WHERE`;

* Ordenação com `ORDER BY`;

* Intervalos de datas;

* `JOIN` e `LEFT JOIN`;

* Funções de agregação, como `COUNT` e `SUM`;

* Agrupamento com `GROUP BY`;

* Filtros de agrupamentos com `HAVING`;

* Subconsultas;

* Funções de data;

* Cálculo de indicadores;

* Consultas envolvendo múltiplas tabelas e relacionamentos;

* Análise de dados aplicada a regras de negócio.

## 🗂️ Estrutura do banco

O banco `supply_chain_sql` possui as seguintes tabelas:

### Tabelas principais

* `clientes` — informações dos clientes;

* `fornecedores` — informações dos fornecedores;

* `centros_distribuicao` — centros responsáveis pelo armazenamento e distribuição dos produtos;

* `transportadoras` — empresas responsáveis pelo transporte das entregas;

* `categorias` — categorias dos produtos;

* `produtos` — produtos comercializados;

* `pedidos` — pedidos realizados pelos clientes.

### Tabelas de relacionamento

* `itens_pedido` — relaciona pedidos e produtos, armazenando as quantidades de cada produto;

* `produtos_fornecedores` — relaciona produtos e fornecedores;

* `estoque` — relaciona produtos e centros de distribuição, armazenando as quantidades disponíveis;

* `entregas` — relaciona pedidos, centros de distribuição e transportadoras, além de armazenar as informações da entrega.

Os relacionamentos muitos-para-muitos entre produtos/fornecedores, produtos/centros de distribuição e pedidos/produtos são representados por tabelas intermediárias.

## 🧩 Modelo simplificado

```text
clientes
   │
   │
pedidos
   │
   ├──────── itens_pedido ──────── produtos
   │                                  │
   │                                  ├──── categorias
   │                                  │
   │                                  └──── produtos_fornecedores ──── fornecedores
   │
   └──────── entregas ───────── centros_distribuicao
                    │
                    └──────────── transportadoras

centros_distribuicao
   │
   └──────── estoque ───────── produtos
```

## 📁 Organização dos arquivos

```text
02-logistica-supply-chain/

│
├── README.md
│
├── 01_criar_banco_dados.sql
├── 02_inserts.sql
├── 03_relacionamentos.sql
├── 04_consultas.sql
```

### `01_criar_banco_dados.sql`

Criação do banco `supply_chain_sql` e das tabelas utilizadas no projeto.

O arquivo contém a estrutura das tabelas, suas chaves primárias, chaves estrangeiras e demais restrições necessárias para representar o cenário.

### `02_inserts.sql`

Inserção dos dados iniciais das tabelas independentes, como:

* Clientes;

* Fornecedores;

* Centros de distribuição;

* Transportadoras;

* Categorias;

* Produtos.

### `03_relacionamentos.sql`

Inserção dos dados que dependem de relacionamentos entre as tabelas, incluindo:

* Pedidos;

* Itens dos pedidos;

* Produtos e fornecedores;

* Estoque;

* Entregas.

### `04_consultas.sql`

Conjunto de consultas práticas desenvolvidas durante o projeto, dividido em:

* Visão geral de produtos;

* Clientes e vendas;

* Situação dos pedidos;

* Produtos vendidos;

* Estoque e centros de distribuição;

* Fornecedores e produtos;

* Logística e entregas;

* Relatório gerencial.

Ao todo, foram desenvolvidas **30 consultas SQL**.

## 🔎 Exemplos de consultas

O projeto possui consultas para:

* listar produtos e seus preços de venda;

* relacionar produtos às suas categorias;

* contar produtos por categoria;

* identificar clientes com mais de um pedido;

* analisar pedidos realizados em determinados períodos;

* calcular valores movimentados por cliente;

* analisar pedidos de acordo com seu*
