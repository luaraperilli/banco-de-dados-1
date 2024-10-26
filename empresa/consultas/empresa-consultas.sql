-- Retorne o nome e o CPF dos funcionários cujo email possui @unifei no endereço
SELECT nome, identidade, email
FROM funcionario
WHERE email LIKE '%@unifei%';

-- Retorne o código dos projetos que o funcionário com um determinado código foi alocado
SELECT codp FROM alocacao WHERE codf = '7';

-- Retorne o código dos projetos e dos funcionários de todas as alocações que iniciaram depois de uma determinada data
SELECT codp, codf, datai
FROM alocacao
WHERE datai > '2017-01-01'
ORDER BY datai ASC;

-- Retorne o nome dos funcionários com os nomes do seu respectivo departamento
SELECT f.nome AS nome_funcionario, 
       d.nome AS nome_departamento
FROM funcionario f
JOIN departamento d ON f.codept = d.codigo;

-- Retorne o nome do projeto e o nome dos funcionários alocados no projeto
SELECT p.nome AS nome_projeto, 
       f.nome AS nome_funcionario
FROM projeto p
JOIN alocacao a ON p.codigo = a.codp
JOIN funcionario f ON a.codf = f.codigo;

-- Retorne o nome do funcionário com seus respectivos números de telefone
SELECT f.nome AS nome_funcionario,
       t.numtel AS numero_telefone
FROM funcionario f
JOIN telefone t ON f.codigo = t.codf;

-- Retorne o nome do departamento e o nome dos seus respectivos funcionários incluindo os departamentos que não possuem funcionário
SELECT d.nome AS nome_departamento, f.nome AS nome_funcionario
FROM departamento d
LEFT JOIN funcionario f ON d.codigo = f.codept;

-- Retorne o nome do projeto e o código dos funcionários alocados incluindo os projetos que não possuem funcionários alocados
SELECT p.nome AS nome_projeto, a.codf AS codigo_funcionario
FROM projeto p
LEFT JOIN alocacao a ON p.codigo = a.codp
LEFT JOIN funcionario f ON a.codf = f.codigo;

-- Retorne a quantidade de funcionários que possuem @unifei no email
SELECT COUNT(email)
FROM funcionario
WHERE email LIKE '%@unifei%';

-- Retorne a soma de horas trabalhadas em todos os projetos
SELECT SUM(horas)
FROM alocacao;

-- Retorne a soma de horas trabalhadas em todos os projetos no ano de 2017
-- EXTRACT pode não ser utilizado em qualquer SGBD
SELECT SUM(horas)
FROM alocacao
WHERE EXTRACT(YEAR FROM datai) = 2017;

-- SQL padrão:
SELECT SUM(horas)
FROM alocacao
WHERE datai BETWEEN '2017-01-01' AND '2017-12-31';

-- Retorne a quantidade de funcionários por departamento
SELECT nome, SUM(qtde)
FROM departamento
GROUP BY nome;

-- Retorne a soma da quantidade de horas por projeto
SELECT p.nome, SUM(a.horas) AS total_horas
FROM projeto p JOIN alocacao a ON p.codigo = a.codp
GROUP BY p.nome;

-- Retorne a soma da quantidade de horas por projetos, somente para aqueles cuja soma > 40
SELECT p.nome, SUM(a.horas) AS total_horas
FROM projeto p JOIN alocacao a ON p.codigo = a.codp
GROUP BY p.nome
HAVING SUM(a.horas) > 40;

-- Retorne a soma da quantidade de horas por projetos, somente para aqueles que iniciaram em 2017 e cuja soma > 40
SELECT p.nome, SUM(a.horas) AS total_horas
FROM projeto p JOIN alocacao a ON p.codigo = a.codp
WHERE EXTRACT(YEAR FROM a.datai) = 2016
GROUP BY p.nome
HAVING SUM(a.horas) > 4;