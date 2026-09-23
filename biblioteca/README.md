# 📚 Biblioteca SQL

Projeto de banco de dados desenvolvido para praticar **SQL e modelagem relacional** utilizando MySQL.

O projeto simula o funcionamento de uma biblioteca, permitindo cadastrar autores, livros, gêneros e leitores, além de registrar empréstimos e realizar consultas sobre o acervo.

## 🎯 Objetivo

Praticar, de forma aplicada, os principais fundamentos de SQL:

* Criação e organização de bancos de dados;
* Criação de tabelas;
* Chaves primárias e estrangeiras;
* Relacionamentos entre tabelas;
* Relacionamentos muitos-para-muitos;
* Inserção de dados;
* Consultas com `SELECT`;
* Filtros com `WHERE`;
* Ordenação com `ORDER BY`;
* Limitação de resultados com `LIMIT`;
* Intervalos com `BETWEEN`;
* `JOIN` e `LEFT JOIN`;
* Funções de agregação, como `COUNT`;
* Agrupamento com `GROUP BY`;
* Filtros de agrupamentos com `HAVING`;
* Consultas envolvendo múltiplas tabelas e relacionamentos.

## 🗂️ Estrutura do banco

O banco `biblioteca_sql` possui as seguintes tabelas:

### Tabelas principais

* `autores` — informações dos autores;
* `livros` — informações dos livros;
* `generos` — gêneros literários;
* `leitores` — pessoas cadastradas na biblioteca;

### Tabelas de relacionamento

* `livros_autores` — relaciona livros e autores;
* `livros_generos` — relaciona livros e gêneros.
* `emprestimos` — registra a relação entre leitores e livros, junto às informações do empréstimo.

Os relacionamentos muitos-para-muitos entre livros/autores e livros/gêneros são representados por tabelas intermediárias.

A tabela `emprestimos` relaciona **leitores e livros** e armazena as datas de empréstimo, previsão de devolução e devolução efetiva.

## 🧩 Modelo simplificado

```text
autores
   │
   │
livros_autores
   │
   │
livros
   │
   ├──────── livros_generos ──────── generos
   │
   │
emprestimos
   │
   │
leitores
```

## 📁 Organização dos arquivos

```text
biblioteca_sql/
│
├── biblioteca.sql
├── 01_criar_banco_dados.sql
├── 02_inserts.sql
├── 03_relacionamentos.sql
├── 04_consultas.sql
│
└── README.md
```

### `biblioteca.sql`

Arquivo geral contendo a criação do banco, estrutura das tabelas e inserção dos dados necessários para reproduzir o banco.

O arquivo **não contém as consultas de prática**, que ficam organizadas separadamente.

### `01_criar_banco_dados.sql`

Criação do banco `biblioteca_sql` e das tabelas utilizadas no projeto.

### `02_inserts.sql`

Inserção dos dados iniciais de autores, livros, gêneros e leitores.

### `03_relacionamentos.sql`

Inserção dos relacionamentos entre livros e autores, livros e gêneros, além dos registros de empréstimos entre leitores e livros.

### `04_consultas.sql`

Conjunto de consultas práticas desenvolvidas durante o projeto, dividido em:

* Conhecendo o acervo;
* Autores e catálogo;
* Gêneros;
* Empréstimos.

Ao todo, foram desenvolvidas **17 consultas SQL**.

## 🔎 Exemplos de consultas

O projeto possui consultas para:

* listar o catálogo completo;
* encontrar livros publicados a partir de determinado ano;
* identificar os livros mais antigos;
* buscar livros de um autor específico;
* encontrar autores sem livros cadastrados;
* contar livros por autor;
* contar livros por gênero;
* encontrar livros associados a múltiplos gêneros;
* consultar o histórico de empréstimos de um leitor;
* identificar os livros mais emprestados;
* identificar os leitores com mais empréstimos;
* encontrar empréstimos ainda não devolvidos.

## 🛠️ Tecnologias

* **MySQL**
* **MySQL Workbench**
* **SQL**

## ▶️ Como executar

Para reproduzir o banco utilizando os arquivos separados:

1. Instale o MySQL e o MySQL Workbench.
2. Clone este repositório.
3. Abra os arquivos SQL no MySQL Workbench.
4. Execute os arquivos na seguinte ordem:

```text
01_criar_banco_dados.sql
02_inserts.sql
03_relacionamentos.sql
```

Depois disso, o banco estará estruturado e populado.

O arquivo `04_consultas.sql` contém as consultas utilizadas para praticar e explorar os dados.

### Arquivo geral

Também é possível utilizar o `biblioteca.sql`, que reúne a estrutura e os dados necessários para reproduzir o banco em um único arquivo.

## 📌 Sobre o projeto

Este projeto faz parte dos meus estudos práticos de **SQL e bancos de dados relacionais**, com foco em transformar conceitos estudados em consultas e estruturas que simulam um cenário real.

O objetivo principal foi consolidar os fundamentos de SQL através da construção de um banco completo, desde sua estrutura e relacionamentos até a realização de consultas envolvendo múltiplas tabelas.
