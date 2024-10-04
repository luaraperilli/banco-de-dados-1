-- Retorne todos os projetos cujo nome é Gerência de Qualidade de Dados
SELECT * FROM projeto WHERE pnome = 'Gerência de Qualidade de Dados';

-- Retorne e todos os empregados que contém o nome da rua Teldomiro Santiago no endereço
SELECT * FROM empregado WHERE endereco LIKE '%Teldomiro Santiago%';

-- Retorne o nome completo de os empregados que nasceram antes de 10/01/2001
SELECT *
FROM empregado
WHERE
    datanasc < '10/01/2001'
ORDER BY datanasc ASC;

-- Retorne o código dos projetos nos quais o funcionario com SSN = E00120 trabalhou mais de 5 horas
SELECT * FROM trabalha_em WHERE ssn = 'E00120' AND horas > 5;