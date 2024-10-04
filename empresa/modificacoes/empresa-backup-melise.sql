-- Consultas aula 3 de outubro

-- Retorne o nome e o CPF dos funcionários cujo email possui @unifei no endereço
SELECT nome, identidade, email FROM funcionario
WHERE email LIKE '%@unifei%';

-- Retorne o código dos projetos que o funcionário com um determinado código foi alocado
SELECT codp FROM alocacao
WHERE codf = '7';

-- Retorne o código dos projetos e dos funcionários de todas as alocações que iniciaram depois de uma determinada data
SELECT codp, codf, datai FROM alocacao
WHERE datai > '2017-01-01'
ORDER BY datai ASC;
