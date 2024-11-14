SELECT m.nome, c.produto_codigo
FROM materiaprima m
JOIN composicao c ON m.codigo = c.materiaprima_codigo
WHERE m.nome LIKE '%PVC%';

SELECT p.nome, t.descricao, c.materiaprima_codigo
FROM produto p
JOIN tipo t ON p.tipo_codigo = t.codigo
JOIN composicao c ON p.codigo = c.produto_codigo;

SELECT p.codigo
FROM produto p 
WHERE (SELECT COUNT(codigo) FROM materiaprima) = 
(SELECT COUNT(c.produto_codigo)
FROM composicao c
WHERE c.produto_codigo = p.codigo);

SELECT c.nome AS nome_cliente, SUM(v.valortotal) AS valor_total
FROM cliente c
JOIN venda v ON c.codigo = v.cliente_codigo
GROUP BY c.nome
HAVING SUM(v.valortotal) > 150;