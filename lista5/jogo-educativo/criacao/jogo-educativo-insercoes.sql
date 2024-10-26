INSERT INTO jogo (codigo, descricao, duracaoMaxima) VALUES
(1, 'Aventuras Matemáticas', 60),
(2, 'Memória Espacial', 45);

INSERT INTO etapa (codigoJogo, numero, descricao) VALUES
(1, 1, 'Missão na Floresta dos Números'),
(1, 2, 'Resgate na Caverna dos Cálculos'),
(2, 1, 'Exploração do Sistema Solar'),
(2, 2, 'Desafio da Galáxia Esquecida');

INSERT INTO jogador (codigo, login, senha, nome) VALUES
(1, 'explorador_julio', 'misterio123', 'Julio Bastos'),
(2, 'matematica_isa', 'calculando456', 'Isadora Monteiro');

INSERT INTO email (codigoJogador, email) VALUES
(1, 'julio.bastos@aventuraedu.com'),
(2, 'isadora.monteiro@calculandoedu.com');

INSERT INTO premio (codigo, gratificacoes) VALUES
(1, 'Medalha Mestre dos Cálculos'),
(2, 'Troféu Astro do Conhecimento');

INSERT INTO jogada (codigoJogo, codigoJogador, codigoPremio, resultados) VALUES
(1, 1, 1, 'Completou com 98% de acertos'),
(2, 2, 2, 'Terminou em tempo recorde');

INSERT INTO ganhos (codigoJogo, codigoJogador, codigoPremio, dataPremio) VALUES
(1, 1, 1, '2023-09-15'),
(2, 2, 2, '2023-10-10');

INSERT INTO mestre (codigoJogador, codigoMestre) VALUES
(1, 2), -- Julio é mestre de Isadora
(2, 1); -- Isadora também é mestre de Julio
