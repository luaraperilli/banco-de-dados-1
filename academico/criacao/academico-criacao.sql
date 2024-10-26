CREATE TABLE aluno (
    mat INT PRIMARY KEY,
    cpf CHAR(14) NOT NULL UNIQUE,
    identidade CHAR(20) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE professor (
    codigo INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(14) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE disciplina (
    codigo INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    ementa VARCHAR(255)
);

CREATE TABLE turma (
    codigo INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    disciplina INT NOT NULL,
    professor INT NOT NULL,
    FOREIGN KEY (disciplina) REFERENCES disciplina(codigo),
    FOREIGN KEY (professor) REFERENCES professor(codigo)
);

CREATE TABLE matricula (
    coda INT NOT NULL,
    codt INT NOT NULL,
    ano INT NOT NULL,
    semestre SMALLINT NOT NULL CHECK (semestre IN (1, 2)),
    nota FLOAT,
    status CHAR(1) NOT NULL CHECK (status IN ('A', 'R', 'C')),
    PRIMARY KEY (coda, codt, ano, semestre),
    FOREIGN KEY (coda) REFERENCES aluno(mat),
    FOREIGN KEY (codt) REFERENCES turma(codigo)
);
