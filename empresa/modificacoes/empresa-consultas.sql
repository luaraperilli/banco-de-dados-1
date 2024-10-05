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

