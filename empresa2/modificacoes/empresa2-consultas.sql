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

-- Retorne o nome dos empregados e o nome do departamento onde trabalham ordenados pelo nome do empregado (crescente) e nome do departamento (decrescente)
SELECT e.enome AS nome_empregado, d.dnome AS nome_departamento
FROM empregado e
JOIN departamento d ON e.dnumero = d.dnumero
ORDER BY e.enome ASC, d.dnome DESC;

-- Retorne o nome do departamento e o nome do seu gerente
SELECT d.dnome AS nome_departamento,
       e.enome AS nome_gerente
FROM departamento d
JOIN empregado e ON d.dgerssn = e.ssn; 

-- Retorne o nome do gerente do departamento RH
SELECT e.enome AS nome_gerente
FROM departamento d 
JOIN empregado e ON d.dgerssn = e.ssn
WHERE d.dnome = 'Recursos Humanos';

-- Retorne o nome dos projetos nos quais o funcionário com SSN = E00120 trabalhou mais de 5 
SELECT p.pnome AS nome_projeto
FROM trabalha_em t
JOIN projeto p ON t.pnumero = p.pnumero
WHERE t.ssn = 'E00120'
  AND t.horas > 5;