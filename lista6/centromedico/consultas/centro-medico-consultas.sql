-- A. Retorne o nome do médico das consultas realizadas em fevereiro de 2020
SELECT m.nomemedico, c.data
FROM consulta c 
JOIN medico m ON c.idMedico = m.idMedico
WHERE c.data BETWEEN '2020-02-01' AND '2020-02-29';

-- B. Retorne o nome dos pacientes que moram em Itajubá
SELECT nomepaciente, cidade
FROM paciente
WHERE cidade = 'Itajubá';

-- C. Retorne o nome dos pacientes que moram em Itajubá e a data de suas consultas
SELECT p.nomepaciente, c.data
FROM paciente p
JOIN consulta c ON p.idpaciente = c.idpaciente
WHERE p.cidade = 'Itajubá';

-- D. Retorne o nome dos médicos e a data das suas consultas incluindo os médicos que não fizeram consultas
SELECT m.nomemedico, c.data
FROM medico m
LEFT JOIN consulta c ON m.idmedico = c.idmedico;

-- E. Retorne todos os medicamentos que foram receitados nas consultas realizadas entre 01/04/2013 e 15/04/2013
SELECT r.nomemedicamento, c.data
FROM receita r
JOIN consulta c ON r.idconsulta = c.idconsulta
WHERE c.data BETWEEN '2013-04-01' AND '2013-04-15';

-- F. Retorne as datas das consultas do paciente José Maria da Silva que mora em São João Del Rei cujo médico foi Lucio da Silva Andrade
SELECT c.data, p.nomepaciente
FROM consulta c 
JOIN paciente p ON c.idpaciente = p.idpaciente
JOIN medico m ON c.idmedico = m.idmedico
WHERE p.nomepaciente = 'José Maria Silva'
AND p.cidade = 'São João Del Rei'
AND m.nomemedico = 'Lúcio Andrade';

-- G. Retorne o nome do médico, o nome do paciente e o nome dos medicamentos das consultas realizadas em abril de 2013
SELECT m.nomemedico, p.nomepaciente, r.nomemedicamento
FROM consulta c
JOIN medico m ON c.idmedico = m.idmedico
JOIN paciente p ON c.idpaciente = p.idpaciente
JOIN receita r ON c.idconsulta = r.idconsulta
WHERE c.data BETWEEN '2013-04-01' AND '2013-04-30';

-- H. Retorne o nome dos médicos que também são pacientes
SELECT m.nomemedico 
FROM medico m
JOIN paciente p ON m.nomemedico = p.nomepaciente;

-- I. Retorne o nome dos pacientes que não são médicos
SELECT p.nomepaciente
FROM paciente p 
LEFT JOIN medico m ON p.nomepaciente = m.nomemedico	-- Lembrar qual valor não pode ser null e colocar no FROM 
WHERE m.nomeMedico IS NULL; 

-- J. Retorne o nome dos médicos que não são pacientes
SELECT m.nomemedico 
FROM medico m
LEFT JOIN paciente p ON m.nomemedico = p.nomepaciente
WHERE p.nomepaciente IS NULL;

-- K. Retorne o nome das pessoas que são médicos e/ou paciente
SELECT nomemedico AS nomepessoa FROM medico
UNION
SELECT nomepaciente AS nomepessoa FROM paciente;

-- L. Retorne o código do médico que consultou todos os pacientes
SELECT idmedico
FROM consulta
GROUP BY idmedico
HAVING COUNT(DISTINCT idpaciente) = (SELECT COUNT(*) FROM paciente);

-- M. Retorne o nome do paciente que consultou com todos os médicos
SELECT nomepaciente 
FROM paciente p
JOIN consulta c ON p.idpaciente = c.idpaciente
GROUP BY p.idpaciente, p.nomepaciente -- Agrupa o resultado pelo paciente para contar as consultas únicas de cada médico
HAVING COUNT(DISTINCT c.idmedico) = (SELECT COUNT(*) FROM medico); -- A contagem de médicos para cada paciente deve ser igual ao total de médicos na tabela médico

-- N. Retorne o nome e o hospital de todos os médicos que consultaram todos os pacientes, considerando somente as consultas realizadas depois do dia 01/01/2002
SELECT m.nomemedico, m.hospital
FROM medico m
JOIN consulta c ON m.idmedico = c.idmedico
WHERE c.data > '2002-01-01'
GROUP BY m.idmedico, m.nomemedico, m.hospital -- Agrupa por cada médico e seu hospital
HAVING COUNT(DISTINCT c.idpaciente) = (SELECT COUNT(*) FROM paciente); 

-- O. Retorne o nome dos pacientes que foram consultados pelos médicos que receitaram os medicamentos que possuem ‘Omeprazol’ no nome
SELECT DISTINCT p.nomepaciente, r.nomemedicamento
FROM paciente p
JOIN consulta c ON p.idpaciente = c.idpaciente
JOIN receita r ON c.idconsulta = r.idconsulta
JOIN medico m ON c.idmedico = m.idmedico
WHERE r.nomemedicamento LIKE '%Omeprazol%';

-- P. Retorne o nome dos médicos que fizeram a mesma quantidade de consultas do médico João José da Silva Braga
-- Primeiro descobrir quantas consultas João José fez
-- Consulta aninhada
-- A consulta externa agrupa os médicos pelo nome e conta suas consultas
SELECT nomemedico
FROM medico m
JOIN consulta c2 ON m.idmedico = c2.idmedico
GROUP BY nomemedico
HAVING COUNT(c2.idconsulta) = 
	(SELECT COUNT (c.idconsulta)
	FROM consulta c
	JOIN medico m ON c.idmedico = m.idmedico
	WHERE m.nomemedico = 'João José da Silva Braga');
								
-- Q. Retorne o nome dos pacientes que moram na mesma cidade da paciente ‘Maria Antônia Vieira’
SELECT nomepaciente
FROM paciente
WHERE cidade = (
	SELECT cidade
	FROM paciente
	WHERE nomepaciente = 'Maria Antônia Vieira')
AND nomepaciente != 'Maria Antônia Vieira';