CREATE TABLE tipo (
 codigo SERIAL PRIMARY KEY,
 descricao VARCHAR(200) NOT NULL
);

CREATE TABLE produto (
 codigo SERIAL PRIMARY KEY,
 nome VARCHAR(200) NOT NULL,
 data DATE NOT NULL,
 valor REAL NOT NULL,
 qtdeestoque INT NOT NULL,
 tipo_codigo INT NOT NULL,
 FOREIGN KEY (tipo_codigo) REFERENCES tipo(codigo)
);

CREATE TABLE materiaprima (
 codigo SERIAL PRIMARY KEY,
 nome VARCHAR(200) NOT NULL
);

CREATE TABLE cliente (
 codigo SERIAL PRIMARY KEY,
 nome VARCHAR(200) NOT NULL
);

CREATE TABLE composicao (
 produto_codigo INT NOT NULL,
 materiaprima_codigo INT NOT NULL,
 quantidade INT NOT NULL,
 PRIMARY KEY (produto_codigo, materiaprima_codigo),
 FOREIGN KEY (produto_codigo) REFERENCES produto(codigo),
 FOREIGN KEY (materiaprima_codigo) REFERENCES materiaprima(codigo)
);

CREATE TABLE venda (
 cliente_codigo INT NOT NULL,
 produto_codigo INT NOT NULL,
 quantidade INT NOT NULL,
 valortotal REAL NOT NULL,
 PRIMARY KEY (cliente_codigo, produto_codigo),
 FOREIGN KEY (cliente_codigo) REFERENCES cliente(codigo),
 FOREIGN KEY (produto_codigo) REFERENCES produto(codigo)
);