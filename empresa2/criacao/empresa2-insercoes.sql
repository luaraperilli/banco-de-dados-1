-- Populando as tabelas para realizar consultas
INSERT INTO departamento (dnome, dnumero, dgerssn) VALUES
('Recursos Humanos', 1, 'E00234'), -- Ana Oliveira
('Tecnologia da Informação', 2, 'E00120'), -- Carlos Silva
('Gerência de Qualidade de Dados', 3, 'E00345'); -- Maria Souza

INSERT INTO empregado (ssn, datanasc, endereco, dnumero, enome) VALUES
('E00120', '1990-06-15', 'Rua Teldomiro Santiago, 123', 2, 'Carlos Silva'),
('E00234', '1985-02-25', 'Rua Antônio Augusto, 456', 1, 'Ana Oliveira'),
('E00345', '2003-08-05', 'Rua Teldomiro Santiago, 789', 3, 'Maria Souza'),
('E00456', '1978-12-30', 'Rua Santos Dumont, 321', 2, 'João Pereira');

INSERT INTO dept_localizacoes (dnumero, dlocalizacao) VALUES
(1, 'Bloco A'),
(2, 'Bloco B'),
(3, 'Bloco C');

INSERT INTO projeto (pnome, pnumero, plocalizacao, dnum) VALUES
('Desenvolvimento de Sistemas', 101, 'São Paulo', 2),
('Gerência de Qualidade de Dados', 102, 'Rio de Janeiro', 3),
('Implementação de Redes', 103, 'Belo Horizonte', 1);

INSERT INTO trabalha_em (ssn, pnumero, horas) VALUES
('E00120', 101, 6),
('E00120', 102, 3),
('E00120', 103, 8),
('E00234', 101, 5),
('E00345', 102, 7),
('E00456', 103, 2);

INSERT INTO departamento (dnome, dnumero, dgerssn) VALUES
    ('PRP - Desenvolvimento de Software', 4, 'E00789'),
    ('PRP - Pesquisa em Inovação', 5, 'E00790'),
    ('PRP - Gestão de Projetos', 6, 'E00791');


INSERT INTO empregado (ssn, datanasc, endereco, dnumero, enome) VALUES
    ('E00701', '1985-03-01', 'Rua Nova, 100', 4, 'Lucas Mendes'),
    ('E00702', '1992-04-12', 'Rua Verde, 200', 4, 'Patrícia Gomes'),
    ('E00703', '1988-05-23', 'Rua Azul, 300', 4, 'Ricardo Alves'),
    ('E00704', '1991-06-30', 'Rua Laranja, 400', 5, 'Gabriela Martins'),
    ('E00705', '1987-07-15', 'Rua Amarela, 500', 5, 'Felipe Costa'),
    ('E00706', '1990-08-29', 'Rua Rosa, 600', 5, 'Bruna Lima'),
    ('E00707', '1989-09-11', 'Rua Marrom, 700', 6, 'Thiago Pereira'),
    ('E00708', '1986-10-22', 'Rua Cinza, 800', 6, 'Natália Souza'),
    ('E00709', '1993-11-05', 'Rua Prata, 900', 6, 'Juliano Silva'),
    ('E00710', '1992-05-01', 'Rua Beta, 100', 4, 'Alice Santos'),
    ('E00711', '1990-03-15', 'Rua Gama, 200', 4, 'Bruno Torres'),
    ('E00712', '1988-08-30', 'Rua Delta, 300', 4, 'Carlos Alberto'),
    ('E00713', '1985-11-22', 'Rua Sigma, 400', 5, 'Elena Rodrigues'),
    ('E00714', '1991-12-15', 'Rua Theta, 500', 5, 'Fábio Nascimento'),
    ('E00715', '1994-01-10', 'Rua Zeta, 600', 5, 'Gustavo Rocha'),
    ('E00716', '1987-04-17', 'Rua Kappa, 700', 6, 'Henrique Alves'),
    ('E00717', '1993-02-20', 'Rua Lambda, 800', 6, 'Juliana Almeida'),
    ('E00718', '1995-09-05', 'Rua Mu, 900', 6, 'Ricardo Lima');
