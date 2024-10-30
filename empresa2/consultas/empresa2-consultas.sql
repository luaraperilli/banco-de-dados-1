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

-- Retorne a soma de todas as horas trabalhadas
SELECT SUM(horas)
FROM trabalha_em;

-- Retorne a soma de todas as horas trabalhadas por projeto (número do projeto)
-- "Por" alguma tabela/atributo usualmente significa que é preciso utilizar GROUP BY 
SELECT pnumero, SUM(horas) AS total_horas	-- Soma das horas por projeto
FROM trabalha_em
GROUP BY pnumero;

-- Retorne a soma de todas as horas trabalhadas por empregado (ssn do empregado)
SELECT ssn, SUM(horas) AS total_horas	-- Soma das horas trabalhadas
FROM trabalha_em
GROUP BY ssn;

-- Retorne a soma das horas trabalhadas por empregado (ssn) considerando somente aqueles que trabalharam mais de 5 horas
SELECT ssn, SUM(horas) AS total_horas
FROM trabalha_em 
GROUP BY ssn
HAVING SUM(horas) > 5;

-- Retorne o valor da quantidade máxima de horas trabalhadas
SELECT MAX (horas)
FROM trabalha_em;

-- Retorne o valor da quantidade máxima de horas trabalhadas por empregado
SELECT ssn, MAX(horas) AS max_horas
FROM trabalha_em
GROUP BY ssn;

-- Retorne o valor da quantidade máxima de horas trabalhadas no projeto de código 101
SELECT MAX(horas) AS max_horas
FROM trabalha_em
WHERE pnumero = 101;

-- Retorne o código do departamento e a quantidade de funcionários de cada um
SELECT dnumero AS codigo_departamento, COUNT(*) AS quantidade_funcionarios
FROM empregado 
GROUP BY dnumero;
 
-- Retorne o nome do departamento e a quantidade de funcionários de cada um
SELECT departamento.dnome, COUNT(empregado.ssn)
FROM departamento
LEFT JOIN empregado ON departamento.dnumero = empregado.dnumero
GROUP BY departamento.dnome;

-- Retorne o nome do departamento e a quantidade de funcionários de cada um considerando somente os departamentos que possuem a string PRP no nome
SELECT departamento.dnome, COUNT(empregado.ssn)
FROM departamento
LEFT JOIN empregado ON departamento.dnumero = empregado.dnumero
GROUP BY departamento.dnome
HAVING departamento.dnome LIKE '%PRP%';

-- Retorne o nome do departamento e a quantidade de funcionários de cada um considerando somente os departamentos que possuem a string PRP no nome e os departamentos que possuem mais de 5 empregados
SELECT departamento.dnome, COUNT(empregado.ssn) AS quantidade_funcionarios
FROM departamento
LEFT JOIN empregado ON departamento.dnumero = empregado.dnumero
WHERE departamento.dnome LIKE '%PRP%'
GROUP BY departamento.dnome
HAVING COUNT(empregado.ssn) > 5;

-- Retorne o ssn de todos os empregados que trabalham em algum projeto mais que algum empregado no projeto ‘101’
-- Subconsulta busca o máximo de horas que qualquer empregado trabalhou no projeto 101
SELECT DISTINCT t1.ssn 
FROM trabalha_em t1 
WHERE t1.horas > (
    SELECT MAX(t2.horas) 
    FROM trabalha_em t2 
    WHERE t2.pnumero = '101');

-- Retorne o ssn de todos os empregados que trabalham em algum projeto mais que todos os empregado no projeto ‘101’
SELECT DISTINCT t1.ssn 
FROM trabalha_em t1 
WHERE t1.horas > ALL (
    SELECT t2.horas 
    FROM trabalha_em t2 
    WHERE t2.pnumero = '101');

-- Retorne os nomes de todos os empregados que trabalham em algum projeto mais que algum empregado no projeto ‘101’
SELECT DISTINCT e.enome 
FROM empregado e 
JOIN trabalha_em t ON e.ssn = t.ssn 
WHERE t.horas > (
    SELECT MAX(t2.horas) 
    FROM trabalha_em t2 
    WHERE t2.pnumero = '101');

-- Encontre todos os empregados (ssn) que trabalham com a mesma combinação (projeto,horas) do empregado com código E001 no projeto ‘101’
SELECT t1.ssn 
FROM trabalha_em t1 
WHERE t1.pnumero = '101' 
AND t1.horas = (
    SELECT t2.horas 
    FROM trabalha_em t2 
    WHERE t2.ssn = 'E001' AND t2.pnumero = '101');

-- Retorne o ssn dos empregados que trabalham mais que a média de horas trabalhadas
-- Subconsulta calcula a média de horas trabalhadas
SELECT ssn 
FROM trabalha_em 
GROUP BY ssn 
HAVING SUM(horas) >	(
	SELECT AVG(horas) 
	FROM trabalha_em); 

-- Retorne o ssn dos empregados que trabalham em todos os projetos
-- Subconsulta calcula o total de projetos
SELECT ssn
FROM trabalha_em
GROUP BY ssn
HAVING COUNT(DISTINCT pnumero) = (
	SELECT COUNT(*) 
	FROM projeto);

-- Retorne o código dos projetos que possuem todos os empregados alocados
-- Subconsulta calcula o total de empregados
SELECT pnumero
FROM trabalha_em
GROUP BY pnumero
HAVING COUNT(DISTINCT ssn) = (
	SELECT COUNT(*) 
	FROM empregado);
	
-- Retorne o nome dos projetos que possuem todos os empregados alocados
SELECT p.pnome
FROM projeto p
JOIN trabalha_em t ON p.pnumero = t.pnumero
GROUP BY p.pnome
HAVING COUNT(DISTINCT t.ssn) = (
	SELECT COUNT(*) 
	FROM empregado);