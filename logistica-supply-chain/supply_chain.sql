CREATE DATABASE supply_chain_sql;

USE supply_chain_sql;

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
	
INSERT INTO categorias (nome, descricao) VALUES
	('Eletrônicos', 'Eletrônicos e dispositivos'),
	('Informática', 'Computadores e periféricos'),
	('Móveis', 'Móveis residenciais e comerciais'),
	('Eletrodomésticos', 'Eletrodomésticos e equipamentos domésticos'),
	('Vestuário', 'Roupas e acessórios'),
	('Calçados', 'Calçados em geral'),
	('Ferramentas', 'Ferramentas manuais e elétricas'),
	('Casa e Decoração', 'Produtos para casa e decoração'),
	('Esportes', 'Artigos e equipamentos esportivos'),
	('Automotivo', 'Peças e acessórios automotivos'),
	('Higiene e Limpeza', 'Produtos de higiene e limpeza'),
	('Papelaria', 'Materiais escolares e de escritório'),
	('Brinquedos', 'Brinquedos e produtos recreativos'),
	('Pet Shop', 'Produtos para animais de estimação'),
	('Alimentos', 'Alimentos não perecíveis');
    
INSERT INTO clientes (nome, logradouro, numero, complemento, cep, cidade, estado, telefone, email) VALUES
    ('Bruce Wayne', 'Wayne Avenue', '100', 'Wayne Manor', '01310000', 'Gotham City', 'SP', '11987654321', 'bruce.wayne@email.com'),
    ('Clark Kent', 'Metropolis Boulevard', '250', 'Daily Planet', '20040002', 'Metropolis', 'RJ', '21976543210', 'clark.kent@email.com'),
    ('Peter Parker', 'Queens Avenue', '145', 'Apto 23', '30130010', 'New York City', 'MG', '31965432109', 'peter.parker@email.com'),
    ('Tony Stark', 'Stark Tower Street', '108', 'Stark Tower', '90035070', 'New York City', 'RS', '51984321098', 'tony.stark@email.com'),
    ('Diana Prince', 'Themyscira Road', '77', 'Casa 4', '80010000', 'Themyscira', 'PR', '41973210987', 'diana.prince@email.com'),
    ('Homer Simpson', 'Evergreen Terrace', '742', NULL, '40010000', 'Springfield', 'BA', '71962109876', 'homer.simpson@email.com'),
    ('Sherlock Holmes', 'Baker Street', '221', 'Apartamento B', '50030000', 'London', 'PE', '81951098765', 'sherlock.holmes@email.com'),
    ('Harry Potter', 'Privet Drive', '4', 'Casa 2', '60010000', 'Little Whinging', 'CE', '85940987654', 'harry.potter@email.com'),
    ('Frodo Baggins', 'Bagshot Row', '1', NULL, '74003010', 'Hobbiton', 'GO', '62939876543', 'frodo.baggins@email.com'),
    ('Luke Skywalker', 'Jedi Temple Road', '5', 'Residência Jedi', '88010000', 'Coruscant', 'SC', '48928765432', 'luke.skywalker@email.com'),
    ('Mickey Mouse', 'Main Street', '1', NULL, '69005070', 'Duckburg', 'AM', '92917654321', 'mickey.mouse@email.com'),
    ('Katniss Everdeen', 'District 12 Road', '74', 'Casa 7', '70040010', 'District 12', 'DF', '61906543210', 'katniss.everdeen@email.com');

INSERT INTO fornecedores (razao_social, nome_fantasia, cnpj, logradouro, numero, complemento, cep, cidade, estado, telefone, email) VALUES
    ('Wayne Enterprises Industria e Comercio Ltda.', 'Wayne Enterprises', '12345678000101', 'Wayne Industrial Avenue', '1000', 'Prédio A', '01310000', 'Gotham City', 'SP', '11987654321', 'contato@wayneenterprises.com'),
    ('Stark Industries Brasil Ltda.', 'Stark Industries', '23456789000102', 'Stark Tower Avenue', '108', 'Torre Principal', '20040002', 'New York City', 'RJ', '21976543210', 'contato@starkindustries.com'),
    ('ACME Produtos e Equipamentos Ltda.', 'ACME Corporation', '34567890000103', 'ACME Road', '500', NULL, '30130010', 'Desert Valley', 'MG', '31965432109', 'contato@acme.com'),
    ('Oscorp Industria Tecnologica Ltda.', 'Oscorp', '45678901000104', 'Norman Avenue', '700', 'Centro de Pesquisas', '90035070', 'New York City', 'RS', '51984321098', 'contato@oscorp.com'),
    ('Wonka Industria de Alimentos Ltda.', 'Wonka', '56789012000105', 'Chocolate Factory Road', '1', 'Fabrica Principal', '80010000', 'Chocolate City', 'PR', '41973210987', 'contato@wonka.com'),
    ('Umbrella Produtos e Pesquisas Ltda.', 'Umbrella Corporation', '67890123000106', 'Raccoon Avenue', '500', 'Laboratorio Central', '40010000', 'Raccoon City', 'BA', '71962109876', 'contato@umbrella.com'),
    ('Monarch Tecnologia e Pesquisa Ltda.', 'Monarch', '78901234000107', 'Monster Island Road', '42', NULL, '50030000', 'Isla de Mara', 'PE', '81951098765', 'contato@monarch.com'),
    ('Weyland-Yutani Comercio e Tecnologia Ltda.', 'Weyland-Yutani', '89012345000108', 'Futura Avenue', '77', 'Complexo Industrial', '60010000', 'Gateway City', 'CE', '85940987654', 'contato@weyland-yutani.com');
    
INSERT INTO centros_distribuicao (nome, logradouro, numero, complemento, cep, cidade, estado, telefone, capacidade_maxima)
VALUES
    ('Wayne Distribution Center', 'Gotham Industrial Road', '1000', 'Galpão A', '01310000', 'Gotham City', 'SP', '11987654321', 1000),
    ('Stark Distribution Center', 'Stark Logistics Avenue', '500', 'Galpão Principal', '20040002', 'Metropolis', 'RJ', '21976543210', 800),
    ('Hogwarts Distribution Center', 'Magic Logistics Road', '777', 'Bloco B', '30130010', 'Hogsmeade', 'MG', '31965432109', 600),
    ('Wakanda Distribution Center', 'Vibranium Avenue', '500', 'Complexo Norte', '40010000', 'Wakanda', 'BA', '71962109876', 900),
    ('Central Distribution Center', 'Springfield Industrial Road', '742', NULL, '80010000', 'Springfield', 'PR', '41973210987', 1200),
    ('S.H.I.E.L.D. Distribution Center', 'Avengers Logistics Road', '42', 'Setor 7', '50030000', 'New York City', 'PE', '81951098765', 1000);
    
INSERT INTO transportadoras (razao_social, cnpj, logradouro, numero, complemento, cep, cidade, estado, telefone, email) VALUES
    ('Acme Transportes e Logistica Ltda.', '90123456000109', 'Acme Logistics Road', '500', 'Unidade Central', '01310000', 'Gotham City', 'SP', '11986543210', 'contato@acmetransportes.com'),
    ('Wayne Logistics Ltda.', '01234567000110', 'Wayne Industrial Avenue', '1200', NULL, '20040002', 'Metropolis', 'RJ', '21985432109', 'contato@waynelogistics.com'),
    ('Stark Express Transportes Ltda.', '11234567000111', 'Stark Express Avenue', '108', 'Terminal Norte', '30130010', 'New York City', 'MG', '31974321098', 'contato@starkexpress.com'),
    ('Ranger Transportes e Distribuicao Ltda.', '21234567000112', 'Ranger Road', '75', NULL, '90035070', 'Gotham City', 'RS', '51963210987', 'contato@rangertransportes.com'),
    ('Weyland Transportes Ltda.', '31234567000113', 'Weyland Industrial Road', '900', 'Centro Operacional', '80010000', 'Hogsmeade', 'PR', '41952109876', 'contato@weylandtransportes.com'),
    ('S.H.I.E.L.D. Transportes Ltda.', '41234567000114', 'Avengers Logistics Avenue', '42', 'Terminal Central', '40010000', 'New York City', 'BA', '71941098765', 'contato@shieldtransportes.com');
    
INSERT INTO produtos (nome, codigo_sku, material, descricao, preco_custo, preco_venda, id_categoria) VALUES
	-- Eletrônicos
    ('Smartphone Stark X1', 'ELE-001', 'Alumínio e vidro', 'Smartphone de alto desempenho', 1800.00, 2699.90, 1),
    ('Fone Wayne Wireless', 'ELE-002', 'Plástico e silicone', 'Fone de ouvido sem fio', 180.00, 349.90, 1),
    ('Smart TV Oscorp 55"', 'ELE-003', 'Plástico e vidro', 'Smart TV 4K de 55 polegadas', 2200.00, 3499.90, 1),
    ('Caixa de Som Stark', 'ELE-004', 'Plástico e metal', 'Caixa de som Bluetooth portátil', 250.00, 499.90, 1),

    -- Informática
    ('Monitor Oscorp 27"', 'INF-001', 'Plástico e metal', 'Monitor Full HD de 27 polegadas', 650.00, 999.90, 2),
    ('Teclado Stark Mechanical', 'INF-002', 'Alumínio e plástico', 'Teclado mecânico para computadores', 220.00, 399.90, 2),
    ('Mouse Wayne Pro', 'INF-003', 'Plástico e borracha', 'Mouse óptico para uso profissional', 80.00, 159.90, 2),
    ('Notebook Wayne X15', 'INF-004', 'Alumínio e plástico', 'Notebook para uso profissional', 2800.00, 4299.90, 2),

    -- Móveis
    ('Cadeira Wayne Executive', 'MOV-001', 'Couro sintético e aço', 'Cadeira executiva para escritório', 480.00, 799.90, 3),
    ('Mesa Central Office', 'MOV-002', 'Madeira e aço', 'Mesa para escritório', 550.00, 899.90, 3),

    -- Eletrodomésticos
    ('Geladeira Wonka Frost', 'ELE-005', 'Aço inoxidável', 'Geladeira frost free', 2200.00, 3299.90, 4),
    ('Micro-ondas Stark Heat', 'ELE-006', 'Aço e vidro', 'Micro-ondas de 32 litros', 450.00, 699.90, 4),
    ('Lavadora Wayne Clean', 'ELE-007', 'Aço e plástico', 'Máquina de lavar roupas', 1700.00, 2599.90, 4),

    -- Vestuário
    ('Camiseta Superman Classic', 'VES-001', 'Algodão', 'Camiseta estampada de algodão', 35.00, 89.90, 5),
    ('Jaqueta Gotham Premium', 'VES-002', 'Poliéster', 'Jaqueta casual impermeável', 120.00, 249.90, 5),
    ('Moletom Hogwarts', 'VES-003', 'Algodão e poliéster', 'Moletom com capuz', 90.00, 199.90, 5),

    -- Calçados
    ('Tênis Flash Runner', 'CAL-001', 'Tecido e borracha', 'Tênis esportivo para corrida', 140.00, 299.90, 6),
    ('Bota Stark Adventure', 'CAL-002', 'Couro sintético', 'Bota para atividades externas', 180.00, 379.90, 6),

    -- Ferramentas
    ('Kit Ferramentas Batman', 'FER-001', 'Aço carbono', 'Kit com ferramentas manuais', 150.00, 289.90, 7),
    ('Furadeira Stark Pro', 'FER-002', 'Plástico e aço', 'Furadeira elétrica profissional', 280.00, 499.90, 7),
    ('Parafusadeira Wayne Max', 'FER-003', 'Plástico e aço', 'Parafusadeira elétrica sem fio', 320.00, 579.90, 7),

    -- Casa e Decoração
    ('Luminária Pixar Home', 'CAS-001', 'Metal e vidro', 'Luminária decorativa de mesa', 70.00, 149.90, 8),
    ('Relógio Gotham Wall', 'CAS-002', 'Madeira e vidro', 'Relógio decorativo de parede', 55.00, 119.90, 8),

    -- Esportes
    ('Bicicleta Flash Speed', 'ESP-001', 'Alumínio e borracha', 'Bicicleta esportiva', 900.00, 1599.90, 9),
    ('Bola Captain Pro', 'ESP-002', 'Couro sintético', 'Bola oficial para esportes', 60.00, 129.90, 9),

    -- Automotivo
    ('Kit Automotivo Batmobile', 'AUT-001', 'Plástico e metal', 'Kit de acessórios automotivos', 110.00, 219.90, 10),

    -- Higiene e Limpeza
    ('Kit Limpeza Springfield', 'HIG-001', 'Plástico', 'Kit para limpeza doméstica', 35.00, 79.90, 11),

    -- Papelaria
    ('Caderno Hogwarts Premium', 'PAP-001', 'Papel e papelão', 'Caderno universitário de capa dura', 25.00, 59.90, 12),

    -- Brinquedos
    ('Action Figure Batman', 'BRI-001', 'Plástico ABS', 'Boneco articulado de coleção', 45.00, 99.90, 13),

	-- Pet Shop
    ('Cama Pet Scooby', 'PET-001', 'Tecido e espuma', 'Cama confortável para animais', 60.00, 129.90, 14);

    
INSERT INTO pedidos (data_pedido, status_pedido, valor_total, forma_pagamento, id_cliente) VALUES
    -- Pedidos processando
    ('2026-09-04', 'Processando', 3999.80, 'Cartão de débito', 4),
    ('2026-09-08', 'Processando', 199.90, 'PIX', 8),
    ('2026-09-11', 'Processando', 1849.70, 'PIX', 7),
    ('2026-09-14', 'Processando', 339.60, 'Boleto bancário', 2),

    -- Pedidos pendentes
    ('2026-09-01', 'Pendente', 3799.60, 'Cartão de crédito', 1),
    ('2026-09-06', 'Pendente', 4999.70, 'Cartão de crédito', 1),
    ('2026-09-13', 'Pendente', 629.80, 'PIX', 5),

    -- Pedidos enviados
    ('2026-09-03', 'Enviado', 2359.60, 'Cartão de crédito', 3),
    ('2026-09-09', 'Enviado', 4259.60, 'Cartão de crédito', 4),
    ('2026-09-15', 'Enviado', 4199.70, 'Cartão de crédito', 4),

    -- Pedidos entregues
    ('2026-09-02', 'Entregue', 4299.90, 'PIX', 2),
    ('2026-09-05', 'Entregue', 1599.90, 'PIX', 5),
    ('2026-09-07', 'Entregue', 4079.70, 'Boleto bancário', 6),
    ('2026-09-10', 'Entregue', 729.70, 'Cartão de débito', 3),
    ('2026-09-12', 'Entregue', 499.90, 'Cartão de crédito', 1),

    -- Pedidos cancelados
    ('2026-09-16', 'Cancelado', 729.70, 'Cartão de débito', 3),
    ('2026-09-17', 'Cancelado', 499.90, 'PIX', 1);


INSERT INTO itens_pedido (quantidade, id_pedido, id_produto) VALUES
    (1, 1, 3),   -- Pedido 1 - Smart TV
    (1, 1, 4),   -- Pedido 1 - Caixa de Som

    (1, 2, 16),  -- Pedido 2 - Moletom Hogwarts

    (1, 3, 10),  -- Pedido 3 - Mesa
    (1, 3, 9),   -- Pedido 3 - Cadeira
    (1, 3, 22),  -- Pedido 3 - Luminária

    (1, 4, 28),  -- Pedido 4 - Caderno
    (1, 4, 29),  -- Pedido 4 - Action Figure
    (2, 4, 14),  -- Pedido 4 - Camiseta

    (1, 5, 1),   -- Pedido 5 - Smartphone
    (2, 5, 2),   -- Pedido 5 - Fone
    (1, 5, 6),   -- Pedido 5 - Teclado

    (1, 6, 8),   -- Pedido 6 - Notebook
    (2, 6, 2),   -- Pedido 6 - Fone

    (1, 7, 18),  -- Pedido 7 - Bota
    (1, 7, 15),  -- Pedido 7 - Jaqueta

    (1, 8, 5),   -- Pedido 8 - Monitor
    (1, 8, 6),   -- Pedido 8 - Teclado
    (1, 8, 7),   -- Pedido 8 - Mouse
    (1, 8, 9),   -- Pedido 8 - Cadeira

    (1, 9, 1),   -- Pedido 9 - Smartphone
    (1, 9, 5),   -- Pedido 9 - Monitor
    (1, 9, 6),   -- Pedido 9 - Teclado
    (1, 9, 7),   -- Pedido 9 - Mouse

    (1, 10, 3),  -- Pedido 10 - Smart TV
    (2, 10, 2),  -- Pedido 10 - Fone

    (1, 11, 8),  -- Pedido 11 - Notebook

    (1, 12, 24), -- Pedido 12 - Bicicleta

    (1, 13, 11), -- Pedido 13 - Geladeira
    (1, 13, 12), -- Pedido 13 - Micro-ondas
    (1, 13, 27), -- Pedido 13 - Kit Limpeza

    (2, 14, 17), -- Pedido 14 - Tênis
    (1, 14, 25), -- Pedido 14 - Bola

    (1, 15, 20), -- Pedido 15 - Furadeira

    (2, 16, 17), -- Pedido 16 - Cancelado - Tênis
    (1, 16, 25), -- Pedido 16 - Cancelado - Bola

    (1, 17, 20); -- Pedido 17 - Cancelado - Furadeira
    
INSERT INTO produtos_fornecedores (id_fornecedor, id_produto) VALUES
    -- Wayne Enterprises
    -- Informática, eletrônicos, móveis e ferramentas
    (1, 1),   -- Smartphone Stark X1
    (1, 2),   -- Fone Wayne Wireless
    (1, 5),   -- Monitor Oscorp 27"
    (1, 7),   -- Mouse Wayne Pro
    (1, 8),   -- Notebook Wayne X15
    (1, 9),   -- Cadeira Wayne Executive
    (1, 10),  -- Mesa Central Office
    (1, 19),  -- Kit Ferramentas Batman
    (1, 21),  -- Parafusadeira Wayne Max
    (1, 23),  -- Relógio Gotham Wall

    -- Stark Industries
    -- Eletrônicos, informática, eletrodomésticos e ferramentas
    (2, 1),   -- Smartphone Stark X1
    (2, 4),   -- Caixa de Som Stark
    (2, 6),   -- Teclado Stark Mechanical
    (2, 12),  -- Micro-ondas Stark Heat
    (2, 18),  -- Bota Stark Adventure
    (2, 20),  -- Furadeira Stark Pro

    -- ACME Corporation
    -- Ferramentas, produtos domésticos e recreativos
    (3, 19),  -- Kit Ferramentas Batman
    (3, 20),  -- Furadeira Stark Pro
    (3, 21),  -- Parafusadeira Wayne Max
    (3, 22),  -- Luminária Pixar Home
    (3, 25),  -- Bola Captain Pro
    (3, 29),  -- Action Figure Batman

    -- Oscorp
    -- Tecnologia e eletrônicos
    (4, 1),   -- Smartphone Stark X1
    (4, 3),   -- Smart TV Oscorp 55"
    (4, 5),   -- Monitor Oscorp 27"
    (4, 6),   -- Teclado Stark Mechanical
    (4, 8),   -- Notebook Wayne X15

    -- Wonka
    -- Alimentos e produtos relacionados
    (5, 11),  -- Geladeira Wonka Frost
    (5, 27),  -- Kit Limpeza Springfield

    -- Umbrella Corporation
    -- Tecnologia, equipamentos e produtos de pesquisa
    (6, 1),   -- Smartphone Stark X1
    (6, 5),   -- Monitor Oscorp 27"
    (6, 8),   -- Notebook Wayne X15
    (6, 20),  -- Furadeira Stark Pro
    (6, 26),  -- Kit Automotivo Batmobile

    -- Monarch
    -- Tecnologia, equipamentos e pesquisa
    (7, 3),   -- Smart TV Oscorp 55"
    (7, 4),   -- Caixa de Som Stark
    (7, 5),   -- Monitor Oscorp 27"
    (7, 8),   -- Notebook Wayne X15
    (7, 24),  -- Bicicleta Flash Speed
    (7, 26),  -- Kit Automotivo Batmobile

    -- Weyland-Yutani
    -- Tecnologia, equipamentos e produtos diversos
    (8, 1),   -- Smartphone Stark X1
    (8, 5),   -- Monitor Oscorp 27"
    (8, 8),   -- Notebook Wayne X15
    (8, 20),  -- Furadeira Stark Pro
    (8, 24),  -- Bicicleta Flash Speed
    (8, 26);  -- Kit Automotivo Batmobile
    
-- ESTOQUE
INSERT INTO estoque (id_centro_distribuicao, id_produto, quantidade) VALUES
    -- Centro 1 - Wayne Distribution Center
    (1, 1, 35),   -- Smartphone Stark X1
    (1, 2, 80),   -- Fone Wayne Wireless
    (1, 5, 25),   -- Monitor Oscorp 27"
    (1, 7, 60),   -- Mouse Wayne Pro
    (1, 8, 20),   -- Notebook Wayne X15
    (1, 9, 30),   -- Cadeira Wayne Executive
    (1, 10, 18),  -- Mesa Central Office
    (1, 19, 25),  -- Kit Ferramentas Batman
    (1, 21, 15),  -- Parafusadeira Wayne Max
    (1, 23, 40),  -- Relógio Gotham Wall

    -- Centro 2 - Stark Distribution Center
    (2, 1, 45),   -- Smartphone Stark X1
    (2, 3, 20),   -- Smart TV Oscorp 55"
    (2, 4, 35),   -- Caixa de Som Stark
    (2, 6, 50),   -- Teclado Stark Mechanical
    (2, 8, 25),   -- Notebook Wayne X15
    (2, 12, 30),  -- Micro-ondas Stark Heat
    (2, 20, 18),  -- Furadeira Stark Pro

    -- Centro 3 - Hogwarts Distribution Center
    (3, 14, 100), -- Camiseta Superman Classic
    (3, 15, 60),  -- Jaqueta Gotham Premium
    (3, 16, 80),  -- Moletom Hogwarts
    (3, 17, 50),  -- Tênis Flash Runner
    (3, 28, 120), -- Caderno Hogwarts Premium
    (3, 29, 35),  -- Action Figure Batman
    (3, 30, 25),  -- Cama Pet Scooby

    -- Centro 4 - Wakanda Distribution Center
    (4, 1, 25),   -- Smartphone Stark X1
    (4, 4, 30),   -- Caixa de Som Stark
    (4, 5, 20),   -- Monitor Oscorp 27"
    (4, 8, 15),   -- Notebook Wayne X15
    (4, 18, 30),  -- Bota Stark Adventure
    (4, 24, 20),  -- Bicicleta Flash Speed
    (4, 26, 40),  -- Kit Automotivo Batmobile

    -- Centro 5 - Central Distribution Center
    (5, 2, 100),  -- Fone Wayne Wireless
    (5, 6, 70),   -- Teclado Stark Mechanical
    (5, 7, 100),  -- Mouse Wayne Pro
    (5, 11, 15),  -- Geladeira Wonka Frost
    (5, 12, 25),  -- Micro-ondas Stark Heat
    (5, 13, 18),  -- Lavadora Wayne Clean
    (5, 22, 40),  -- Luminária Pixar Home
    (5, 27, 80),  -- Kit Limpeza Springfield

    -- Centro 6 - S.H.I.E.L.D. Distribution Center
    (6, 1, 30),   -- Smartphone Stark X1
    (6, 3, 15),   -- Smart TV Oscorp 55"
    (6, 5, 25),   -- Monitor Oscorp 27"
    (6, 8, 20),   -- Notebook Wayne X15
    (6, 19, 30),  -- Kit Ferramentas Batman
    (6, 20, 20),  -- Furadeira Stark Pro
    (6, 21, 15),  -- Parafusadeira Wayne Max
    (6, 24, 15),  -- Bicicleta Flash Speed
    (6, 25, 50),  -- Bola Captain Pro
    (6, 26, 35);  -- Kit Automotivo Batmobile
    
INSERT INTO entregas (id_centro_distribuicao, id_pedido, id_transportadora, data_prevista, data_entrega, status_entrega) VALUES
-- Pedidos em processamento
(2, 1, 3, '2026-09-20', NULL, 'Em preparação'), -- Pedido 1
(3, 2, 2, '2026-09-22', NULL, 'Em preparação'), -- Pedido 2
(1, 3, 2, '2026-09-23', NULL, 'Em preparação'), -- Pedido 3
(3, 4, 4, '2026-09-24', NULL, 'Em preparação'), -- Pedido 4

-- Pedidos pendentes
(1, 5, 2, '2026-09-19', NULL, 'Pendente'), -- Pedido 5
(2, 6, 3, '2026-09-21', NULL, 'Pendente'), -- Pedido 6
(4, 7, 4, '2026-09-20', NULL, 'Pendente'), -- Pedido 7

-- Pedidos enviados
(5, 8, 1, '2026-09-19', NULL, 'Em trânsito'), -- Pedido 8
(2, 9, 3, '2026-09-20', NULL, 'Em trânsito'), -- Pedido 9
(6, 10, 6, '2026-09-22', NULL, 'Em trânsito'), -- Pedido 10

-- Pedidos entregues
(1, 11, 2, '2026-09-08', '2026-09-07', 'Entregue'), -- Pedido 11
(4, 12, 4, '2026-09-12', '2026-09-11', 'Entregue'), -- Pedido 12
(5, 13, 1, '2026-09-14', '2026-09-13', 'Entregue'), -- Pedido 13
(6, 14, 6, '2026-09-17', '2026-09-16', 'Entregue'), -- Pedido 14
(2, 15, 3, '2026-09-18', '2026-09-17', 'Entregue'), -- Pedido 15

-- Pedidos cancelados
(6, 16, 6, '2026-09-20', NULL, 'Cancelada'), -- Pedido 16
(2, 17, 3, '2026-09-21', NULL, 'Cancelada'); -- Pedido 17