-- A. Retorne o nome de todos os clientes que alugaram filmes do diretor Woody Allen
SELECT cli.nome
FROM cliente cli
JOIN aluguel a ON cli.codigo = a.codigocliente
JOIN copia c ON a.numerocopia = c.numero
JOIN filme f ON c.codigofilme = f.codigo
WHERE f.diretor = 'Woody Allen';

-- B. Retorne o nome do cliente e do funcionário relacionados ao aluguel da cópia 10 do filme Julie & Julia antes do dia 11/04/2011
SELECT cli.nome AS nomecliente, f.nome AS nomefuncionario
FROM cliente cli
JOIN aluguel a ON cli.codigo = a.codigocliente
JOIN funcionario f ON a.codigofuncionario = f.codigo
WHERE a.numerocopia = 10 AND a.datainicio < '2011-04-11';

-- C. Retorne código do filme, o número da cópia e o status de todos os filmes do ator Philip Seymour Hoffman
SELECT f.codigo AS codigofilme, c.numero AS numerocopia, c.status
FROM filme f
JOIN copia c ON f.codigo = c.codigofilme
JOIN atorfilme af ON c.codigofilme = af.codigofilme
WHERE af.ator = 'Philip Seymour Hoffman'; 

-- D. Retorne o número e o status de todas as cópias dos filmes do estilo Aventura
SELECT c.numero AS numerocopia, c.status
FROM copia c 
JOIN filme f ON c.codigofilme = f.codigo
JOIN estilofilme ef ON f.codigo = ef.codigofilme
WHERE ef.estilo = 'Aventura';

-- E. Retorne o cnpj e a razão social de todos os fornecedores que venderam filmes para o funcionário José da Silva Xavier
SELECT f.cnpj, f.razaosocial
FROM fornecedor f
JOIN compra c ON f.cnpj = c.cnpjfornecedor
JOIN funcionario fu ON c.codigofuncionario = fu.codigo
WHERE fu.nome = 'José da Silva Xavier';

-- F. Retorne o cnpj e a razão social de todos os fornecedores de filme, o código, o nome do filme e o número da cópia fornecida incluindo aqueles fornecedores que não venderam para locadora
SELECT f.cnpj, f.razaosocial, co.numero AS codigocopia, fi.nome
FROM fornecedor f
LEFT JOIN compra c ON f.cnpj = c.cnpjfornecedor
LEFT JOIN copia co ON c.numerocopia = co.numero
LEFT JOIN filme fi ON co.codigofilme = fi.codigo;

-- G. Retorne o nome do funcionário, o número da cópia e o nome do filme de todos os funcionários envolvidos no aluguel de algum filme incluindo aqueles funcionários que nunca alugaram filme
SELECT f.nome AS nomefuncionario, a.numerocopia, fi.nome
FROM funcionario f
LEFT JOIN aluguel a ON f.codigo = a.codigofuncionario
LEFT JOIN copia co ON a.numerocopia = co.numero
LEFT JOIN filme fi ON co.codigofilme = fi.codigo;

