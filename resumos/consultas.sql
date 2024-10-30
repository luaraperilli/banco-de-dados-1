-- Consultas Select:
SELECT enome
FROM empregado;

-- Remove duplicatas (resultados com o mesmo nome, por exemplo):
SELECT DISTINCT enome
FROM empregado;

-- Selecionar o número dos empregados que tenham o primeiro nome João e data de nascimento maior que 15/05/1975:
SELECT ssn 
FROM empregado
WHERE enome = 'João' AND datanasc > '15/05/1975';

-- Inclui BETWEEN:
SELECT ssn
FROM empregado
WHERE salario BETWEEN 1500 AND 10000;

-- Operadores Coringa (utilizados com LIKE):
-- % substitui qualquer sequência de caracteres. 'M%' significa qualquer nome que inicia com M
SELECT enome
FROM empregado
WHERE enome LIKE 'M%';

-- _ substitui apenas um caractere. 'C_' retorna aqueles que começam com C e tem 1 caractere depois
SELECT ssn
FROM empregado
WHERE ssn LIKE 'C_';

-- Ordenação:
-- Listar os empregados em ordem alfabética:
SELECT * 
FROM empregado
ORDER BY enome;
-- Também é possível ordenar com ASC (crescente) e DESC (decrescente);
SELECT ssn
FROM empregado
ORDER BY ssn DESC;

-- Renomear/Alias:
SELECT dnome AS nome_depto
FROM departamento;

-- Produto Cartesiano:
Retornar a combinação de funcionário com cargo (todas as tuplas de funcionário combinadas com as tuplas de cargo):
SELECT * 
FROM funcionario f, cargo c;

-- Associação do produto cartesiano com um critério de seleção é a junção
-- Critério pode ser definido com where
-- Junções podem ser feitas com where ou com join

-- JOIN:
-- Retorne o nome e o cargo do funcionário:
SELECT f.NmFunc, c.Salario
FROM funcionario f JOIN cargo c ON f.CdCargo = c.CdCargo; -- Condição de junção
-- Join é mais simples de ser entendido pois separa o que é junção do que é seleção;

-- Tipos de Join:
-- Natural Join:
-- Não é necessário especificar o critério de junção. É realizada comparando os atributos iguais das relações especificadas no join 
SELECT f.NmFunc, c.Salario
FROM funcionario f JOIN cargo c; 
-- Junta as tabelas em atributos com mesmo nome, se não tiver o mesmo nome vai fazer o produto cartesiano (apenas igualar os atributos das tabelas selecionadas)

-- Left Join:
-- Tabela de prioridade à esquerda, ou seja, todas as linhas da tabela à esquerda são mantidas no resultado, mesmo se não houver correspondência na tabela da direita (prenchidos com NULL nesse caso)
SELECT f.NmFunc, c.Salario
FROM funcionario f LEFT JOIN cargo c ON f.CdCargo = c.CdCargo; 
-- Tabela Funcionário:
-- Coluna NrMatric | Coluna NmFunc | Coluna DtAdm     | Coluna Sexo | Coluna CdCargo | Coluna CdDepto
-- Linha 1: 0001   | Maria         | 11/02/2002       | F           | C1             | D1
-- Linha 2: 0002   | Joao          | 15/04/2007       | M           | C2             | D2
-- Linha 3: 0003   | Paulo         | 12/08/2005       | M           | C3             | D1
-- Linha 4: 0004   | Fábio         | 04/06/2006       | M           | C3             | D1
-- Linha 5: 0005   | Lúcia         | 05/08/2007       | F           | NULL           | NULL

-- Tabela Cargo:
-- Coluna CdCargo  | Coluna NmCargo                | Coluna Salario
-- Linha 1: C1     | Gerente                       | 10000
-- Linha 2: C2     | Auxiliar de escritório        | 1500
-- Linha 3: C3     | Analista de Sistemas          | 6000

-- Resultado:
-- Coluna NmFunc      | Coluna Salario
-- Linha 1: Maria     | 10000
-- Linha 2: Joao      | 1500
-- Linha 3: Paulo     | 6000
-- Linha 4: Fábio     | 6000
-- Linha 5: Lúcia     | NULL

-- Right Join:
-- Tabela de prioridade à direita, ou seja, todas as linhas da tabela à direita são mantidas no resultado, mesmo se não houver correspondência na tabela da esquerda (prenchidos com NULL nesse caso)
SELECT f.NmFunc, c.Salario
FROM funcionario f RIGHT JOIN cargo c ON f.CdCargo = c.CdCargo; 
-- Tabela Funcionário:
-- Coluna NrMatric | Coluna NmFunc | Coluna DtAdm     | Coluna Sexo | Coluna CdCargo | Coluna CdDepto
-- Linha 1: 0001   | Maria         | 11/02/2002       | F           | C1             | D1
-- Linha 2: 0002   | Joao          | 15/04/2007       | M           | C2             | D2
-- Linha 3: 0003   | Paulo         | 12/08/2005       | M           | C3             | D1
-- Linha 4: 0004   | Fábio         | 04/06/2006       | M           | C3             | D1
-- Linha 5: 0005   | Lúcia         | 05/08/2007       | F           | NULL           | NULL

-- Tabela Departamento:
-- Coluna CdDepto  | Coluna NmDepto         | Coluna Ramal
-- Linha 1: D1     | Informática            | 1301
-- Linha 2: D2     | Recursos Humanos       | 1302
-- Linha 3: D3     | Contabilidade          | 1303
-- Linha 4: D4     | Vendas                 | 1304

-- Resultado:
-- Coluna NmFunc      | Coluna NmDepto
-- Linha 1: Maria     | Informática
-- Linha 2: Paulo     | Informática
-- Linha 3: Fábio     | Informática
-- Linha 4: Joao      | Recursos Humanos
-- Linha 5: NULL      | Contabilidade
-- Linha 6: NULL      | Vendas

-- Full Join:
-- Retorna todos os registros de ambas as tabelas, combinando-os onde houver correspondências, e NULL quando não houver
SELECT f.NmFunc, c.Salario
FROM funcionario f FULL JOIN cargo c ON f.CdCargo = c.CdCargo; 
-- Tabela Funcionário:
-- Coluna NrMatric | Coluna NmFunc | Coluna DtAdm     | Coluna Sexo | Coluna CdCargo | Coluna CdDepto
-- Linha 1: 0001   | Maria         | 11/02/2002       | F           | C1             | D1
-- Linha 2: 0002   | Joao          | 15/04/2007       | M           | C2             | D2
-- Linha 3: 0003   | Paulo         | 12/08/2005       | M           | C3             | D1
-- Linha 4: 0004   | Fábio         | 04/06/2006       | M           | C3             | D1
-- Linha 5: 0005   | Lúcia         | 05/08/2007       | F           | NULL           | NULL

-- Tabela Departamento:
-- Coluna CdDepto  | Coluna NmDepto         | Coluna Ramal
-- Linha 1: D1     | Informática            | 1301
-- Linha 2: D2     | Recursos Humanos       | 1302
-- Linha 3: D3     | Contabilidade          | 1303
-- Linha 4: D4     | Vendas                 | 1304

-- Resultado:
-- Coluna NmFunc      | Coluna NmDepto
-- Linha 1: Maria     | Informática
-- Linha 2: Paulo     | Informática
-- Linha 3: Fábio     | Informática
-- Linha 4: Joao      | Recursos Humanos
-- Linha 5: Lúcia     | NULL
-- Linha 6: NULL      | Contabilidade
-- Linha 7: NULL      | Vendas

-- Intersecção:
-- Encontre todos os clientes do banco que possuem um empréstimo E uma conta no banco:
-- depositante(nome_cliente, numero_conta)
-- tomador(nome_cliente, numero_emprestimo)
(SELECT DISTINC nome_cliente FROM depositante) INTERSECT
(SELECT DISTINC nome_cliente FROM tomador);

-- União: 
-- Encontre todos os clientes do banco que possuem um empréstimo, uma conta no banco OU as duas coisas no banco:
(SELECT DISTINC nome_cliente FROM depositante) UNION
(SELECT DISTINC nome_cliente FROM tomador);

-- Subtração:
-- Encontre todos os clientes do banco que possuem uma conta no banco e não possuem empréstimo:
(SELECT DISTINC nome_cliente FROM depositante) EXCEPT
(SELECT DISTINC nome_cliente FROM tomador);

-- Operações com Nulos:
SELECT numero_emprestimo
FROM emprestimo
WHERE quantia IS NULL;
SELECT numero_emprestimo
FROM emprestimo
WHERE quantia IS NOT NULL;
-- Qualquer expressão aritmética envolvendo um valor nulo é nula:
-- NULL + 1000 = NULL

-- Funções Agregadas:
-- AVG: valor médio
-- MIN: valor mínimo
-- MAX: valor máximo
-- SUM: soma dos valores
-- COUNT: quantidade de valores

-- Tabela Conta:
-- Coluna nome_agencia  | Coluna numero_conta  | Coluna saldo
-- Linha 1: Centro      | A-102                | 400
-- Linha 2: Centro      | A-201                | 900
-- Linha 3: Alvorada    | A-217                | 750
-- Linha 3: Alvorada    | A-215                | 750
-- Linha 3: Planalto    | A-222                | 700

-- Média dos saldos das agências do Centro:
SELECT AVG(saldo)
FROM conta 
WHERE nome_agencia = 'Centro';

-- Soma dos saldos das agências do Centro:
SELECT SUM(saldo)
FROM conta 
WHERE nome_agencia = 'Centro';

-- Quantidade de contas das agências do Centro:
SELECT COUNT(*)
FROM conta 
WHERE nome_agencia = 'Centro';

-- Count pode ser utilizado com DISTINCT:
SELECT COUNT DISTINCT(nome)
FROM cliente;

-- Agrupamento:
-- Agrupa com base em algum atributo
SELECT nome_agencia, MAX(saldo) -- nome_agencia foi selecionado para mostrar na tabela de qual grupo pertence cada quantidade
FROM conta
GROUP BY(nome_agencia); -- Para cada grupo retorna o valor máximo do saldo agrupado pelo nome da agência
-- Grupo 1 - Agência do Centro
-- Grupo 2 - Agência do Alvorada
-- Grupo 3 - Agência do Planlato

-- Encontre o número de depositantes por agência:
SELECT c.nome_agencia, COUNT(DISTINCT d. nome_cliente)
FROM conta c JOIN depositante d ON c.numero_conta = d.numero=conta
GROUP BY c.nome_agencia;

-- Cláusula Having:
-- Só pode ser utilizada com GROUP BY. É como o WHERE mas para agrupamento
-- Retorne a média de saldo das agências considerando agências com médias maiores que 1200
SELECT nome_agencia, AVG(saldo)
FROM conta
GROUP BY nome_agencia
HAVING AVG(saldo) > 1200; -- Sempre vem após o GROUP BY

-- Aninhamento de Consultas ou Consultas Internas na Cláusula Where:
-- Subconsultas, subqueries, nested queries
-- Funções que retornam uma informação para ser usada em outra consulta externa
-- Consulta interna depende da consulta externa
-- O Sistema de Gerenciamento de Banco de Dados realiza primeiro a consulta interna

-- Com operador = retorna apenas um valor (não pode ser usado para operações em conjunto):
SELECT *
FROM conta
WHERE saldo = (SELECT saldo FROM conta WHERE numero_conta = 'C11');

-- Operadores IN e NOT IN:
-- Nomes das agências que possuem empréstimos com quantia maior que 20000:
SELECT *
FROM conta
WHERE nome_agencia IN (SELECT nome_agencia FROM emprestimo WHERE quantia > 20000);

-- Encontre todos os clientes do banco que possuem uma conta e um empréstimo:
SELECT nome_cliente
FROM depositante
WHERE nome_cliente IN (SELECT nome_cliente FROM tomador);

-- Encontre todos os clientes do banco que possuem uma conta e não possuem empréstimo:
SELECT nome_cliente
FROM depositante
WHERE nome_cliente NOT IN (SELECT nome_cliente FROM tomador); -- Consulta interna é realizada apenas uma vez

-- Operador Any:
-- Retorne as contas que possuem saldo igual a alguma conta da agência UNIFEI:
SELECT *
FROM conta
WHERE saldo = ANY (SELECT saldo FROM conta WHERE nome_agencia = 'UNIFEI');

-- Retorne as contas que possuem saldo maior a alguma conta da agência UNIFEI:
SELECT *
FROM conta
WHERE saldo > ANY (SELECT saldo FROM conta WHERE nome_agencia = 'UNIFEI');

-- Operador All:
-- Retorne as contas que possuem saldo maior que todas as contas da agência UNIFEI:
SELECT *
FROM conta
WHERE saldo > ALL (SELECT saldo FROM conta WHERE nome_agencia = 'UNIFEI');

-- empregado(ssn, nome, sexo)
-- dependente(essn, nome, sexo)
-- Retornar nome dos empregados que possuem o nome e sexo igual ao do dependente (para cada empregado retornar o essn do dependente):
SELECT e.nome
FROM empregado e
WHERE e.ssn IN (SELECT d.essn FROM dependente d WHERE d.nome = e.nome AND d.sexo = e.sexo); -- For dentro de um for pois verifica cada linha da tabela empregado para cada linha da tabela dependente, ou seja, a execução da subconsulta é feita para cada linha da consulta externa

-- Operador Exists ou Not Exists:
-- Verifica se o resultado da subconsulta é vazio
SELECT nome 
FROM empregado e 
WHERE EXISTS (SELECT d.essn FROM dependente d WHERE d.essn = e.ssn AND d.nome = e.nome AND d.sexo = e.sexo);

-- Operador de Divisão:
-- Usado para encontrar registros em uma tabela que tenham uma associação com todos os registros de outra tabela
-- Encontrar todos os empregados que trabalham em todos os projetos:
SELECT e.empregado_id, e.nome
FROM empregado e
JOIN trabalha_em t ON e.empregado_id = t.empregado_id
GROUP BY e.empregado_id, e.nome
HAVING COUNT(DISTINCT t.projeto_id) = (SELECT COUNT(*) FROM projeto);

-- Tabela Empregado
-- | empregado_id | nome      
-- | 1            | Alice     
-- | 2            | Bob      
-- | 3            | Carol 

-- Tabela Projeto
-- | projeto_id | nome_projeto    
-- | 101        | Projeto A       
-- | 102        | Projeto B       
-- | 103        | Projeto C       

-- Tabela Trabalha_em (associação entre empregados e projetos)
-- | empregado_id | projeto_id 
-- | 1            | 101        
-- | 1            | 102        
-- | 2            | 101        
-- | 2            | 102        
-- | 2            | 103        
-- | 3            | 101        
-- | 3            | 102        
-- | 3            | 103        

