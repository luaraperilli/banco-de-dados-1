-- Populando as tabelas para realizar consultas
INSERT INTO departamento (dnome, dnumero, dgerssn) VALUES
('Recursos Humanos', 1, '123-45-6789'),
('Tecnologia da Informação', 2, '987-65-4321'),
('Gerência de Qualidade de Dados', 3, '456-78-1234');

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

-- Retorne todos os projetos cujo nome é Gerência de Qualidade de Dados
SELECT * FROM projeto
WHERE pnome = 'Gerência de Qualidade de Dados';

-- Retorne e todos os empregados que contém o nome da rua Teldomiro Santiago no endereço
SELECT * FROM empregado 
WHERE endereco LIKE '%Teldomiro Santiago%';

-- Retorne o nome completo de os empregados que nasceram antes de 10/01/2001
SELECT * FROM empregado
WHERE datanasc < '10/01/2001'
ORDER BY datanasc ASC;

-- Retorne o código dos projetos nos quais o funcionario com SSN = E00120 trabalhou mais de 5 horas
SELECT * FROM trabalha_em
WHERE ssn = 'E00120' AND horas > 5;
