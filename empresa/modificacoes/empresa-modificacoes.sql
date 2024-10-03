-- Inserir 2 departamentos
INSERT INTO departamento VALUES 
(1, 'Recursos Humanos'),
(2, 'Desenvolvimento');

-- Inserir 3 funcionários para cada departamento
INSERT INTO funcionario VALUES
-- Funcionários do departamento de Recursos Humanos
(1, 'Alice', '123.456.789-00', 1),
(2, 'José', '234.567.890-11', 1),
(3, 'Carlos', '345.678.901-22', 1),
-- Funcionários do departamento de Desenvolvimento
(4, 'Maria', '456.789.012-33', 2),
(5, 'Laura', '567.890.123-44', 2),
(6, 'João', '678.901.234-55', 2);

-- Inserir 4 projetos
INSERT INTO projeto VALUES
(1, 'Projeto A'),
(2, 'Projeto B'),
(3, 'Projeto C'),
(4, 'Projeto D');

-- Alocar funcionários nos projetos
INSERT INTO alocacao VALUES
-- Alocação para Projeto A
(1, 1, 1),
(2, 1, 2),
-- Alocação para Projeto B
(3, 2, 3),
(4, 2, 4),
-- Alocação para Projeto C
(5, 3, 5),
(6, 3, 6),
-- Alocação para Projeto D
(7, 4, 1),
(8, 4, 4);

-- Inserir 5 telefones
INSERT INTO telefone VALUES
(1, '(11) 91234-5678', 1),
(2, '(11) 92345-6789', 2),
(3, '(11) 93456-7890', 3),
(4, '(11) 94567-8901', 4),
(5, '(11) 95678-9012', 5);

-- Alterar o nome do funcionário com o CPF especificado
UPDATE empregado 
SET nome = 'Alicia'
WHERE cpf = '123.456.789-00';

-- Adicionar coluna horas_trabalhadas à tabela alocacao
ALTER TABLE alocacao 
ADD COLUMN horas_trabalhadas INT CHECK (horas_trabalhadas > 0);

-- Atualizar todas as alocações com 8 horas trabalhadas
UPDATE alocacao 
SET horas_trabalhadas = 8;

-- Consultas aula 03/10/2024
SELECT * FROM funcionario;

-- Retorne o nome e o CPF dos funcionários cujo email possui @unifei no endereço
SELECT nome, identidade, email FROM funcionario
WHERE email LIKE '%@unifei%';

SELECT * FROM alocacao;

-- Retorne o código dos projetos que o funcionário com um determinado código foi alocado
SELECT codp FROM alocacao
WHERE codf = '7';

-- Retorne o código dos projetos e dos funcionários de todas as alocações que iniciaram depois de uma determinada data
SELECT codp, codf, datai FROM alocacao
WHERE datai > '2017-01-01'
ORDER BY datai ASC;

