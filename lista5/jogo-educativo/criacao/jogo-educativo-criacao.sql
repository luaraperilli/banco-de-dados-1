-- Partindo do MR:
-- Jogo (código, descrição, duraçãoMáxima)

-- Etapa (códigoJogo, número, descrição)
-- códigoJogo referencia código(Jogos)

-- Jogador (código, login, senha, nome)

-- Email (códigoJogador, email)
-- códigoJogador referencia código(Jogador)

-- Prêmio (código, gratificações)

-- Jogada (códigoJogo, códigoJogador, códigoPrêmios, resultados)
-- códigoJogo referencia código(Jogos)
-- códigoJogador referencia código(Jogador)
-- códigoPrêmios referencia código(Prêmios)

-- Ganhos (códigoJogo, códigoJogador, códigoPrêmio, dataPrêmio)
-- códigoJogo referencia código(Jogos)
-- códigoJogador referencia código(Jogador)
-- códigoPrêmios referencia código(Prêmios)

-- MestreJogador (códigoJogador, códigoMestre)
-- códigoJogador referencia código(Jogador)

CREATE TABLE jogo (
	codigo INT PRIMARY KEY,
	descricao VARCHAR(255),
	duracaoMaxima INT
);

CREATE TABLE etapa (
	codigoJogo INT NOT NULL,
	numero INT NOT NULL,
	descricao VARCHAR(255),
	PRIMARY KEY (codigoJogo, numero),
	FOREIGN KEY (codigoJogo) REFERENCES jogo(codigo)
);

CREATE TABLE jogador (
	codigo INT PRIMARY KEY,
	login VARCHAR(60) NOT NULL UNIQUE,
	senha VARCHAR(60) NOT NULL UNIQUE,
	nome VARCHAR(255) NOT NULL
);

CREATE TABLE email (
	codigoJogador INT PRIMARY KEY,
	email VARCHAR(255) NOT NULL,
	FOREIGN KEY (codigoJogador) REFERENCES jogador(codigo)
);

CREATE TABLE premio (
	codigo INT PRIMARY KEY,
	gratificacoes VARCHAR(255)
);

CREATE TABLE jogada (
	codigoJogo INT NOT NULL,
	codigoJogador INT NOT NULL,
	codigoPremio INT NOT NULL,
	resultados VARCHAR(255),
	PRIMARY KEY (codigoJogo, codigoJogador, codigoPremio),
	FOREIGN KEY (codigoJogo) REFERENCES jogo(codigo),
	FOREIGN KEY (codigoJogador) REFERENCES jogador(codigo),
	FOREIGN KEY (codigoPremio) REFERENCES premio(codigo)
);

CREATE TABLE ganhos (
	codigoJogo INT NOT NULL,
	codigoJogador INT NOT NULL,
	codigoPremio INT NOT NULL,
	dataPremio DATE NOT NULL,
	PRIMARY KEY (codigoJogo, codigoJogador, codigoPremio),
	FOREIGN KEY (codigoJogo) REFERENCES jogo(codigo),
	FOREIGN KEY (codigoJogador) REFERENCES jogador(codigo),
	FOREIGN KEY (codigoPremio) REFERENCES premio(codigo)
);

CREATE TABLE mestre (
	codigoJogador INT PRIMARY KEY,
	codigoMestre INT NOT NULL,
	FOREIGN KEY (codigoJogador) REFERENCES jogador(codigo),
	FOREIGN KEY (codigoMestre) REFERENCES jogador(codigo)
);
