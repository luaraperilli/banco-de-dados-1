CREATE TABLE fornecedor (
	cnpj CHAR(14) PRIMARY KEY, 
	razaosocial VARCHAR(255) NOT NULL,
	endereco VARCHAR(255) NOT NULL
);

CREATE TABLE filme (
	codigo INT PRIMARY KEY, 
	nome VARCHAR(255) NOT NULL,
	duracao INT NOT NULL,
	diretor VARCHAR(255) NOT NULL
);

CREATE TABLE atorfilme (
    codigofilme INT,
    ator VARCHAR(255) NOT NULL,
    PRIMARY KEY (codigofilme, ator),
    FOREIGN KEY (codigofilme) REFERENCES filme(codigo)
);

CREATE TABLE estilofilme (
    codigofilme INT,
    estilo VARCHAR(255) NOT NULL,
    PRIMARY KEY (codigofilme, estilo),
    FOREIGN KEY (codigofilme) REFERENCES filme(codigo)
);

-- Criação do tipo ENUM para o status
CREATE TYPE enum_status AS ENUM ('Alugado', 'Disponível');

CREATE TABLE copia (
    numero INT PRIMARY KEY,
    status enum_status DEFAULT 'Disponível',
    codigofilme INT,
    FOREIGN KEY (codigofilme) REFERENCES filme(codigo)
);

CREATE TABLE funcionario (
	codigo INT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cargo VARCHAR(255) NOT NULL
);

CREATE TABLE cliente (
	codigo INT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	dataNas DATE NOT NULL,
	telefone VARCHAR(255) NOT NULL,
	rua VARCHAR(255) NOT NULL,
	bairro VARCHAR(255) NOT NULL,
	numero INT NOT NULL
);

CREATE TABLE aluguel (
    codigofuncionario INT,
    numerocopia INT,
    codigocliente INT,
    datainicio DATE NOT NULL,
    datapdev DATE NOT NULL,
    datadev DATE DEFAULT NULL,
    PRIMARY KEY (codigofuncionario, numerocopia, codigocliente, datainicio),
    FOREIGN KEY (codigofuncionario) REFERENCES funcionario(codigo),
    FOREIGN KEY (numerocopia) REFERENCES copia(numero),
	FOREIGN KEY (codigocliente) REFERENCES cliente(codigo),
   	CHECK (datapdev > datainicio),
    CHECK (datadev IS NULL OR datadev >= datainicio)
);

CREATE TABLE compra (
    cnpjfornecedor CHAR(14),
    codigofuncionario INT,
    numerocopia INT,
    PRIMARY KEY (cnpjfornecedor, codigofuncionario, numerocopia),
    FOREIGN KEY (cnpjfornecedor) REFERENCES fornecedor(cnpj),
    FOREIGN KEY (codigofuncionario) REFERENCES funcionario(codigo),
    FOREIGN KEY (numerocopia) REFERENCES copia(numero)
);

