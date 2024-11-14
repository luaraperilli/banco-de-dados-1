-- Inserindo dados na tabela tipo
INSERT INTO tipo (codigo, descricao) VALUES (1, 'Eletrônicos');
INSERT INTO tipo (codigo, descricao) VALUES (2, 'Alimentos');
INSERT INTO tipo (codigo, descricao) VALUES (3, 'Bebidas');
INSERT INTO tipo (codigo, descricao) VALUES (4, 'Móveis');
INSERT INTO tipo (codigo, descricao) VALUES (5, 'Roupas');

-- Inserindo dados na tabela produto
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto A',
'2023-01-01', 10.0, 50, 1);
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto B',
'2023-01-02', 20.0, 30, 2);
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto C',
'2023-01-03', 30.0, 20, 3);
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto D',
'2023-01-04', 40.0, 10, 4);
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto E',
'2023-01-05', 50.0, 5, 5);
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto F',
'2023-02-01', 15.0, 40, 1);
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto G',
'2023-02-02', 25.0, 35, 2);
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto H',
'2023-02-03', 35.0, 25, 3);
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto I', '2023-
02-04', 45.0, 15, 4);
INSERT INTO produto (nome, data, valor, qtdeestoque, tipo_codigo) VALUES ('Produto J', '2023-
02-05', 55.0, 10, 5);

-- Inserindo dados na tabela materiaprima
INSERT INTO materiaprima (nome) VALUES ('Matéria-Prima X');
INSERT INTO materiaprima (nome) VALUES ('Matéria-Prima Y');
INSERT INTO materiaprima (nome) VALUES ('Matéria-Prima Z');
INSERT INTO materiaprima (nome) VALUES ('Matéria-Prima W');
INSERT INTO materiaprima (nome) VALUES ('Matéria-Prima V');
-- Inserindo dados na tabela cliente
INSERT INTO cliente (nome) VALUES ('Cliente 1');
INSERT INTO cliente (nome) VALUES ('Cliente 2');
INSERT INTO cliente (nome) VALUES ('Cliente 3');
INSERT INTO cliente (nome) VALUES ('Cliente 4');
INSERT INTO cliente (nome) VALUES ('Cliente 5');

-- Inserindo dados na tabela composicao
INSERT INTO composicao (produto_codigo, materiaprima_codigo, quantidade) VALUES (1, 1,
10);
INSERT INTO composicao (produto_codigo, materiaprima_codigo, quantidade) VALUES (1, 2,
15);
INSERT INTO composicao (produto_codigo, materiaprima_codigo, quantidade) VALUES (1, 3,
15);
INSERT INTO composicao (produto_codigo, materiaprima_codigo, quantidade) VALUES (1, 4,
15);
INSERT INTO composicao (produto_codigo, materiaprima_codigo, quantidade) VALUES (1, 5,
15);
INSERT INTO composicao (produto_codigo, materiaprima_codigo, quantidade) VALUES (2, 2,
15);
INSERT INTO composicao (produto_codigo, materiaprima_codigo, quantidade) VALUES (3, 3,
20);
INSERT INTO composicao (produto_codigo, materiaprima_codigo, quantidade) VALUES (4, 4,
25);
INSERT INTO composicao (produto_codigo, materiaprima_codigo, quantidade) VALUES (5, 5,
30);

-- Inserindo dados na tabela venda
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (1, 1, 5,
50.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (1, 2, 3,
60.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (1, 3, 2,
60.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (4, 4, 1,
40.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (2, 5, 4,
200.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (2, 6, 2,
30.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (2, 7, 3,
75.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (3, 8, 1,
35.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (4, 9, 4,
180.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (5, 10, 2,
110.0);
INSERT INTO venda (cliente_codigo, produto_codigo, quantidade, valortotal) VALUES (1, 6, 1,
15.0);