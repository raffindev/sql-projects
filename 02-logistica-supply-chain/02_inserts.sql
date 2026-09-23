-- Inserção de dados

-- Categorias
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

-- Clientes
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

-- Fornecedores
INSERT INTO fornecedores (razao_social, nome_fantasia, cnpj, logradouro, numero, complemento, cep, cidade, estado, telefone, email) VALUES
    ('Wayne Enterprises Industria e Comercio Ltda.', 'Wayne Enterprises', '12345678000101', 'Wayne Industrial Avenue', '1000', 'Prédio A', '01310000', 'Gotham City', 'SP', '11987654321', 'contato@wayneenterprises.com'),
    ('Stark Industries Brasil Ltda.', 'Stark Industries', '23456789000102', 'Stark Tower Avenue', '108', 'Torre Principal', '20040002', 'New York City', 'RJ', '21976543210', 'contato@starkindustries.com'),
    ('ACME Produtos e Equipamentos Ltda.', 'ACME Corporation', '34567890000103', 'ACME Road', '500', NULL, '30130010', 'Desert Valley', 'MG', '31965432109', 'contato@acme.com'),
    ('Oscorp Industria Tecnologica Ltda.', 'Oscorp', '45678901000104', 'Norman Avenue', '700', 'Centro de Pesquisas', '90035070', 'New York City', 'RS', '51984321098', 'contato@oscorp.com'),
    ('Wonka Industria de Alimentos Ltda.', 'Wonka', '56789012000105', 'Chocolate Factory Road', '1', 'Fabrica Principal', '80010000', 'Chocolate City', 'PR', '41973210987', 'contato@wonka.com'),
    ('Umbrella Produtos e Pesquisas Ltda.', 'Umbrella Corporation', '67890123000106', 'Raccoon Avenue', '500', 'Laboratorio Central', '40010000', 'Raccoon City', 'BA', '71962109876', 'contato@umbrella.com'),
    ('Monarch Tecnologia e Pesquisa Ltda.', 'Monarch', '78901234000107', 'Monster Island Road', '42', NULL, '50030000', 'Isla de Mara', 'PE', '81951098765', 'contato@monarch.com'),
    ('Weyland-Yutani Comercio e Tecnologia Ltda.', 'Weyland-Yutani', '89012345000108', 'Futura Avenue', '77', 'Complexo Industrial', '60010000', 'Gateway City', 'CE', '85940987654', 'contato@weyland-yutani.com');

-- Centros de distribuição
INSERT INTO centros_distribuicao (nome, logradouro, numero, complemento, cep, cidade, estado, telefone, capacidade_maxima)
VALUES
    ('Wayne Distribution Center', 'Gotham Industrial Road', '1000', 'Galpão A', '01310000', 'Gotham City', 'SP', '11987654321', 1000),
    ('Stark Distribution Center', 'Stark Logistics Avenue', '500', 'Galpão Principal', '20040002', 'Metropolis', 'RJ', '21976543210', 800),
    ('Hogwarts Distribution Center', 'Magic Logistics Road', '777', 'Bloco B', '30130010', 'Hogsmeade', 'MG', '31965432109', 600),
    ('Wakanda Distribution Center', 'Vibranium Avenue', '500', 'Complexo Norte', '40010000', 'Wakanda', 'BA', '71962109876', 900),
    ('Central Distribution Center', 'Springfield Industrial Road', '742', NULL, '80010000', 'Springfield', 'PR', '41973210987', 1200),
    ('S.H.I.E.L.D. Distribution Center', 'Avengers Logistics Road', '42', 'Setor 7', '50030000', 'New York City', 'PE', '81951098765', 1000);

-- Transportadoras
INSERT INTO transportadoras (razao_social, cnpj, logradouro, numero, complemento, cep, cidade, estado, telefone, email) VALUES
    ('Acme Transportes e Logistica Ltda.', '90123456000109', 'Acme Logistics Road', '500', 'Unidade Central', '01310000', 'Gotham City', 'SP', '11986543210', 'contato@acmetransportes.com'),
    ('Wayne Logistics Ltda.', '01234567000110', 'Wayne Industrial Avenue', '1200', NULL, '20040002', 'Metropolis', 'RJ', '21985432109', 'contato@waynelogistics.com'),
    ('Stark Express Transportes Ltda.', '11234567000111', 'Stark Express Avenue', '108', 'Terminal Norte', '30130010', 'New York City', 'MG', '31974321098', 'contato@starkexpress.com'),
    ('Ranger Transportes e Distribuicao Ltda.', '21234567000112', 'Ranger Road', '75', NULL, '90035070', 'Gotham City', 'RS', '51963210987', 'contato@rangertransportes.com'),
    ('Weyland Transportes Ltda.', '31234567000113', 'Weyland Industrial Road', '900', 'Centro Operacional', '80010000', 'Hogsmeade', 'PR', '41952109876', 'contato@weylandtransportes.com'),
    ('S.H.I.E.L.D. Transportes Ltda.', '41234567000114', 'Avengers Logistics Avenue', '42', 'Terminal Central', '40010000', 'New York City', 'BA', '71941098765', 'contato@shieldtransportes.com');