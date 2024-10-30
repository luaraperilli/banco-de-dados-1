-- Tabela fornecedor
INSERT INTO fornecedor (cnpj, razaosocial, endereco) VALUES 
('12345678901234', 'Filmes Ltda', 'Rua A, 100'),
('23456789012345', 'CineMagic', 'Rua B, 200'),
('34567890123456', 'Mundo Filmes', 'Rua C, 300'),
('45678901234567', 'Mega Filmes', 'Rua D, 400'),
('56789012345678', 'Distribuidora Brasil', 'Rua E, 500'),
('67890123456789', 'Cinema World', 'Rua F, 600'),
('78901234567890', 'FilmeTop', 'Rua G, 700'),
('89012345678901', 'Filmes Nacionais', 'Rua H, 800'),
('90123456789012', 'Cinema Total', 'Rua I, 900'),
('01234567890123', 'Filme Fácil', 'Rua J, 1000'),
('11234567890123', 'Central de Filmes', 'Rua K, 1100'),
('21234567890123', 'Filmoteca', 'Rua L, 1200'),
('31234567890123', 'FilmeMania', 'Rua M, 1300'),
('41234567890123', 'Cine Popular', 'Rua N, 1400'),
('51234567890123', 'Blockbuster', 'Rua O, 1500'),
('61234567890123', 'Filme Master', 'Rua P, 1600'),
('71234567890123', 'Cinema Express', 'Rua Q, 1700'),
('81234567890123', 'Super Filmes', 'Rua R, 1800'),
('91234567890123', 'Distribuidora Oeste', 'Rua S, 1900'),
('10123456789012', 'Filme Global', 'Rua T, 2000');

-- Tabela filme
INSERT INTO filme (codigo, nome, duracao, diretor) VALUES 
(1, 'Annie Hall', 93, 'Woody Allen'),
(2, 'Midnight in Paris', 94, 'Woody Allen'),
(3, 'Julie & Julia', 123, 'Nora Ephron'),
(4, 'Capote', 114, 'Bennett Miller'),
(5, 'The Master', 144, 'Paul Thomas Anderson'),
(6, 'Moneyball', 133, 'Bennett Miller'),
(7, 'Doubt', 104, 'John Patrick Shanley'),
(8, 'Hunger Games', 142, 'Gary Ross'),
(9, 'The Big Lebowski', 117, 'Joel Coen'),
(10, 'A Serious Man', 106, 'Joel Coen'),
(11, 'No Country for Old Men', 122, 'Joel Coen'),
(12, 'Inside Llewyn Davis', 104, 'Joel Coen'),
(13, 'Blue Jasmine', 98, 'Woody Allen'),
(14, 'The Aviator', 170, 'Martin Scorsese'),
(15, 'The Departed', 151, 'Martin Scorsese'),
(16, 'Gangs of New York', 167, 'Martin Scorsese'),
(17, 'The Godfather', 175, 'Francis Ford Coppola'),
(18, 'Goodfellas', 146, 'Martin Scorsese'),
(19, 'Taxi Driver', 114, 'Martin Scorsese'),
(20, 'Raging Bull', 129, 'Martin Scorsese');

-- Tabela atorfilme
INSERT INTO atorfilme (codigofilme, ator) VALUES 
(1, 'Woody Allen'),
(2, 'Owen Wilson'),
(3, 'Meryl Streep'),
(4, 'Philip Seymour Hoffman'),
(5, 'Amy Adams'),
(6, 'Joaquin Phoenix'),
(7, 'Brad Pitt'),
(8, 'Jennifer Lawrence'),
(9, 'John Goodman'),
(10, 'Michael Stuhlbarg'),
(11, 'Tommy Lee Jones'),
(12, 'Oscar Isaac'),
(13, 'Cate Blanchett'),
(14, 'Leonardo DiCaprio'),
(15, 'Matt Damon'),
(16, 'Jack Nicholson'),
(17, 'Robert De Niro'),
(18, 'Al Pacino'),
(19, 'Joe Pesci'),
(20, 'Martin Sheen');

-- Tabela estilofilme
INSERT INTO estilofilme (codigofilme, estilo) VALUES 
(1, 'Comédia'),
(2, 'Romance'),
(3, 'Drama'),
(4, 'Biografia'),
(5, 'Aventura'),
(6, 'Suspense'),
(7, 'Ação'),
(8, 'Ficção Científica'),
(9, 'Terror'),
(10, 'Fantasia'),
(11, 'Mistério'),
(12, 'Musical'),
(13, 'Histórico'),
(14, 'Policial'),
(15, 'Guerra'),
(16, 'Esporte'),
(17, 'Thriller'),
(18, 'Western'),
(19, 'Documentário'),
(20, 'Animação');

-- Tabela copia
INSERT INTO copia (numero, status, codigofilme) VALUES 
(1, 'Disponível', 1),
(2, 'Alugado', 1),
(3, 'Disponível', 2),
(4, 'Alugado', 2),
(5, 'Disponível', 3),
(6, 'Alugado', 3),
(7, 'Disponível', 4),
(8, 'Alugado', 4),
(9, 'Disponível', 5),
(10, 'Alugado', 5),
(11, 'Disponível', 6),
(12, 'Alugado', 6),
(13, 'Disponível', 7),
(14, 'Alugado', 7),
(15, 'Disponível', 8),
(16, 'Alugado', 8),
(17, 'Disponível', 9),
(18, 'Alugado', 9),
(19, 'Disponível', 10),
(20, 'Alugado', 10);

-- Tabela funcionario
INSERT INTO funcionario (codigo, nome, cargo) VALUES 
(1, 'José da Silva Xavier', 'Vendedor'),
(2, 'Maria Souza', 'Gerente'),
(3, 'Pedro Lima', 'Atendente'),
(4, 'Ana Costa', 'Assistente'),
(5, 'Carlos Mendes', 'Gerente'),
(6, 'Fernanda Azevedo', 'Vendedora'),
(7, 'Luiz Fernando', 'Gerente'),
(8, 'Joana Almeida', 'Vendedora'),
(9, 'Paulo Santos', 'Atendente'),
(10, 'Rita Oliveira', 'Gerente'),
(11, 'Antônio Braga', 'Atendente'),
(12, 'Patrícia Vieira', 'Assistente'),
(13, 'Jorge Souza', 'Vendedor'),
(14, 'Marta Faria', 'Atendente'),
(15, 'Renato Costa', 'Gerente'),
(16, 'Isabela Silva', 'Vendedora'),
(17, 'Rodrigo Siqueira', 'Gerente'),
(18, 'Sofia Carvalho', 'Atendente'),
(19, 'Victor Freitas', 'Assistente'),
(20, 'Gustavo Almeida', 'Vendedor');

-- Tabela cliente
INSERT INTO cliente (codigo, nome, dataNas, telefone, rua, bairro, numero) VALUES 
(1, 'Alice Costa', '1990-05-21', '1111111111', 'Rua 1', 'Bairro A', 101),
(2, 'Bruno Lima', '1985-04-12', '2222222222', 'Rua 2', 'Bairro B', 102),
(3, 'Carlos Silva', '1979-08-03', '3333333333', 'Rua 3', 'Bairro C', 103),
(4, 'Daniel Souza', '1992-07-11', '4444444444', 'Rua 4', 'Bairro D', 104),
(5, 'Eduardo Ribeiro', '1988-02-28', '5555555555', 'Rua 5', 'Bairro E', 105),
(6, 'Fernanda Gomes', '1991-09-15', '6666666666', 'Rua 6', 'Bairro F', 106),
(7, 'Gabriel Oliveira', '1983-11-20', '7777777777', 'Rua 7', 'Bairro G', 107),
(8, 'Helena Costa', '1994-03-14', '8888888888', 'Rua 8', 'Bairro H', 108),
(9, 'Igor Santos', '1987-10-22', '9999999999', 'Rua 9', 'Bairro I', 109),
(10, 'Julia Almeida', '1995-12-05', '1010101010', 'Rua 10', 'Bairro J', 110),
(11, 'Lucas Lima', '1989-01-07', '1212121212', 'Rua 11', 'Bairro K', 111),
(12, 'Mariana Rocha', '1993-06-23', '1313131313', 'Rua 12', 'Bairro L', 112),
(13, 'Natália Silva', '1986-04-30', '1414141414', 'Rua 13', 'Bairro M', 113),
(14, 'Otávio Mendes', '1982-08-16', '1515151515', 'Rua 14', 'Bairro N', 114),
(15, 'Patrícia Carvalho', '1996-11-29', '1616161616', 'Rua 15', 'Bairro O', 115),
(16, 'Ricardo Freitas', '1990-02-10', '1717171717', 'Rua 16', 'Bairro P', 116),
(17, 'Simone Gonçalves', '1981-09-25', '1818181818', 'Rua 17', 'Bairro Q', 117),
(18, 'Thiago Martins', '1984-03-19', '1919191919', 'Rua 18', 'Bairro R', 118),
(19, 'Valéria Nunes', '1992-12-31', '2020202020', 'Rua 19', 'Bairro S', 119),
(20, 'William Costa', '1997-05-09', '2121212121', 'Rua 20', 'Bairro T', 120);

-- Tabela aluguel
INSERT INTO aluguel (codigofuncionario, numerocopia, codigocliente, datainicio, datapdev, datadev) VALUES 
(1, 1, 1, '2011-04-01', '2011-04-08', NULL), -- José, cópia 1, Alice
(2, 2, 2, '2011-04-02', '2011-04-09', NULL), -- Maria, cópia 2, Bruno
(3, 3, 3, '2011-04-03', '2011-04-10', NULL), -- Pedro, cópia 3, Carlos
(4, 4, 4, '2011-04-04', '2011-04-11', '2011-04-10'), -- Ana, cópia 4, Daniel
(5, 5, 5, '2011-04-05', '2011-04-12', NULL), -- Carlos, cópia 5, Eduardo
(6, 6, 6, '2011-04-06', '2011-04-13', '2011-04-12'), -- Fernanda, cópia 6, Fernanda
(7, 7, 7, '2011-04-07', '2011-04-14', NULL), -- Luiz, cópia 7, Gabriel
(8, 8, 8, '2011-04-08', '2011-04-15', NULL), -- Joana, cópia 8, Helena
(9, 9, 9, '2011-04-09', '2011-04-16', NULL), -- Paulo, cópia 9, Igor
(10, 10, 10, '2011-04-10', '2011-04-17', NULL), -- Rita, cópia 10, Julia
(1, 11, 11, '2011-04-11', '2011-04-18', NULL), -- José, cópia 11, Lucas
(2, 12, 12, '2011-04-12', '2011-04-19', NULL), -- Maria, cópia 12, Mariana
(3, 13, 13, '2011-04-13', '2011-04-20', NULL), -- Pedro, cópia 13, Natália
(4, 14, 14, '2011-04-14', '2011-04-21', NULL), -- Ana, cópia 14, Otávio
(5, 15, 15, '2011-04-15', '2011-04-22', NULL), -- Carlos, cópia 15, Patrícia
(6, 16, 16, '2011-04-16', '2011-04-23', NULL), -- Fernanda, cópia 16, Ricardo
(7, 17, 17, '2011-04-17', '2011-04-24', NULL), -- Luiz, cópia 17, Simone
(8, 18, 18, '2011-04-18', '2011-04-25', NULL), -- Joana, cópia 18, Thiago
(9, 19, 19, '2011-04-19', '2011-04-26', NULL), -- Paulo, cópia 19, Valéria
(10, 20, 20, '2011-04-20', '2011-04-27', NULL); -- Rita, cópia 20, William

-- Tabela compra
INSERT INTO compra (cnpjfornecedor, codigofuncionario, numerocopia) VALUES 
('12345678901234', 1, 1), -- Filme do fornecedor 1, funcionário 1, cópia 1
('23456789012345', 2, 2), -- Filme do fornecedor 2, funcionário 2, cópia 2
('34567890123456', 3, 3), -- Filme do fornecedor 3, funcionário 3, cópia 3
('45678901234567', 4, 4), -- Filme do fornecedor 4, funcionário 4, cópia 4
('56789012345678', 5, 5), -- Filme do fornecedor 5, funcionário 5, cópia 5
('67890123456789', 6, 6), -- Filme do fornecedor 6, funcionário 6, cópia 6
('78901234567890', 7, 7), -- Filme do fornecedor 7, funcionário 7, cópia 7
('89012345678901', 8, 8), -- Filme do fornecedor 8, funcionário 8, cópia 8
('90123456789012', 9, 9), -- Filme do fornecedor 9, funcionário 9, cópia 9
('01234567890123', 10, 10); -- Filme do fornecedor 10, funcionário 10, cópia 10
