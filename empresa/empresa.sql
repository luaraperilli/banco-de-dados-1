CREATE TABLE departamento (
    codigo INT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE funcionario (
    codigo INT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    identidade CHAR(20) NOT NULL UNIQUE,
    cpf CHAR(14) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL,
    coddept INT NOT NULL,
    FOREIGN KEY (coddept) REFERENCES departamento(codigo)
);

CREATE TABLE projeto (
    codigo INT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    descricao VARCHAR(120),
    datainicial DATE NOT NULL,
    datafim DATE NOT NULL,
    CONSTRAINT chk_datafim CHECK (datafim > datainicial)
);

CREATE TABLE alocacao (
    codp INT,
    codf INT,
    datai DATE NOT NULL,
    PRIMARY KEY (codp, codf),
    FOREIGN KEY (codp) REFERENCES projeto(codigo),
    FOREIGN KEY (codf) REFERENCES funcionario(codigo)
);

CREATE TABLE telefone (
    numtel VARCHAR(15) PRIMARY KEY,
    codf INT,
    FOREIGN KEY (codf) REFERENCES funcionario(codigo)
);

ALTER TABLE alocacao
ADD COLUMN qtd_horas INT NOT NULL CHECK (qtd_horas > 0);

ALTER TABLE projeto
ADD COLUMN custo_estimado FLOAT NOT NULL,
ADD COLUMN gasto_real FLOAT;
