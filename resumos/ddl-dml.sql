-- Data Definition Language
-- Parte que define o esquema do banco de dados como tipos, informações, restrições de integridade e relacionamento das tabelas
-- Comandos como Create, Drop e Alter

-- Data Manipulation Language
-- Parte da linguagem para manipulação dos dados
-- Comandos como Select, Insert, Update e Delete

-- Criar tabela:
CREATE TABLE nomeTabela (
    nomeColuna1, tipoDaColuna
    codigo CHAR(5),
    ativo INT, 
    cidade VARCHAR(50)
);

-- Tipos:
-- CHAR(n): string de caracteres de tamanho fixo
-- VARCHAR(n): string de caracteres de tamanho variável 
-- INT: inteiro (geralmente utilizado para o código/id)
-- SMALLINT: números inteiros mas em um intervalo menor (como qtdes pequenas)
-- NUMERIC(p,d): armazena números decimais com uma precisão fixa (ideal para preços ou cálculos financeiros. NUMERIC(5,2) armazena um número com até 5 dígitos, com 2 após o ponto decimal, como 123.45)
-- REAL: armazena números com casas decimais, mas com uma precisão limitada
-- FLOAT(n): número de ponto flutuante e permite definir a precisão através de n
-- DATE: datas no formato Y-M-D
 
-- Restrição de Chave Primária:
CREATE TABLE agencia (
    codigo CHAR(5),
    nome VARCHAR(50),
    ativo INT,
    PRIMARY KEY (codigo)
);

-- Ou:
CREATE TABLE agencia (
    codigo CHAR(5) PRIMARY KEY,
    nome VARCHAR(50),
    ativo INT
);
-- Importante lembrar que PRIMARY KEY não precisa definir NOT NULL pois já é não nulo obrigatoriamente

-- Restrição de Vazio:
CREATE TABLE cliente (
    matricula CHAR(5) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Restrição de Chave Candidata:
CREATE TABLE cliente (
    matricula CHAR(5) PRIMARY KEY,
    identidade CHAR(7) NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL
);

-- Se as chaves forem compostas:
CREATE TABLE cliente (
    codigoLetra CHAR(2) NOT NULL,
    codigoNum CHAR(5) NOT NULL,
    identidade CHAR(7) NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100),
    PRIMARY KEY(codigoLetra, codigoNum), -- Chave Composta
    UNIQUE(nome, sobrenome) -- Combinação dos dois é única
);

-- Restrições de Domínio:
CREATE TABLE cliente (
    matricula CHAR(5) PRIMARY KEY,
    identidade CHAR(7) NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) DEFAULT 'desconhecido' -- Valor padrão caso o email não seja passado é 'desconhecido'
);

CREATE TABLE cliente (
    matricula CHAR(5) PRIMARY KEY,
    identidade CHAR(7) NOT NULL UNIQUE,
    idade INT NOT NULL CHECK (idade > 0), -- Restrição de Domínio para idade > 0
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE cliente (
    matricula CHAR(5) PRIMARY KEY,
    identidade CHAR(7) NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL
    tipo ENUM('Especial', 'Ouro', 'Premium') -- Nesse caso não é preciso definir o tipo da coluna
);

-- Restrição de Integridade Referencial (Chave Estrangeira):
CREATE TABLE conta (
    numero CHAR(5) PRIMARY KEY,
    saldo NUMERIC(2,1) NOT NULL,
    nome_agencia CHAR(15) NOT NULL,
    FOREIGN KEY (nome_agencia) REFERENCES agencia(nome_agencia)
)

-- Em caso de chave estrangeira numa entidade fraca deve-se implementar com cascata:
CREATE TABLE conta (
    numero CHAR(5),
    saldo NUMERIC(2,1) NOT NULL,
    nome_agencia CHAR(15) NOT NULL,
    PRIMARY KEY (nome_agencia, numero),
    FOREIGN KEY (nome_agencia) REFERENCES agencia(nome) ON DELETE CASCADE ON UPDATE CASCADE -- Se na tabela agência eu tentar mudar o nome de uma agência que tem conta, o nome será alterado em todas as contas (cascata)
)

-- Modificações de Tabela (ALTER TABLE):
-- Alterar, adicionar ou remover atributos ou restrições

-- Adicionar Atributo:
ALTER TABLE nomeTabela ADD COLUMN nomeAtributo tipoAtributo;
ALTER TABLE agencia ADD telefone VARCHAR(15);

-- Remover Atributo:
ALTER TABLE nomeTabela DROP COLUMN nomeAtributo;
ALTER TABLE agencia DROP cidade;

-- Alterar Atributo:
ALTER TABLE nomeTabela ALTER COLUMN nomeAtributo novaDefinição;
ALTER TABLE agencia ALTER COLUMN telefone VARCHAR(30) NOT NULL;

-- Modificar Tabelas:
-- Criar ou remover restrição de not null:
ALTER TABLE nomeTabela ALTER nomeAtributo SET/DROP NOT NULL;
ALTER TABLE agencia ALTER COLUMN telefone DROP NOT NULL; -- Apaga restrição de não nulo

-- Modificar Restrições:
ALTER TABLE nomeTabela ADD CONSTRAINT nomeDaRestrição RESTRIÇÃO;
ALTER TABLE conta ADD CONSTRAINT conta_pkey PRIMARY KEY(numero);

-- Adicionar Restrição:
CREATE TABLE conta (
    numero CHAR(5) PRIMARY KEY,
    saldo NUMERIC(2,1) NOT NULL,
    nome_agencia CHAR(15) NOT NULL,
);
ALTER TABLE conta ADD CONSTRAINT conta_saldo_check check(saldo > 0);

-- Apagar Restrições:
ALTER TABLE nomeTabela DROP CONSTRAINT nomeDaRestrição;
ALTER TABLE conta DROP CONSTRAINT conta_saldo_check;

-- Remover Tabela:
DROP TABLE agencia;

-- Inclusão de Tupla:
INSERT INTO nomeTabela VALUES(valores); -- Valores devem seguir a ordem da tabela
CREATE TABLE cliente (
    no_cliente VARCHAR(50),
    nome VARCHAR(50),
    cnpj CHAR(14)
)
INSERT INTO cliente VALUES (1, 'Maria', '11111111111111'),
    (2, 'João', '22222222222222');

-- Exclusão de Tupla:
DELETE FROM cliente; -- Apaga toda as tuplas

-- Cláusula Where (condicional):
DELETE FROM cliente WHERE nome = 'Maria'; -- Exclui a tupla com o nome Maria
DELETE FROM cliente WHERE nome = 'Maria' AND cnpj = '11111111111111';
DELETE FROM cliente WHERE nome = 'Maria' OR cnpj = '11111111111111';
DELETE FROM cliente WHERE no_cliente BETWEEN 1 AND 10;

-- Alteração Update:
UPDATE nomeTabela SET coluna1 = valorNovo, coluna2 = valorNovo;
UPDATE cliente SET cnpj = '00000000000000'
