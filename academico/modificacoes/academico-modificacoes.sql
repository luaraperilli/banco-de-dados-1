-- Criar um atributo na tabela disciplina que deve armazenar a quantidade de créditos
ALTER TABLE Disciplina 
ADD COLUMN creditos INT CHECK (creditos > 0);

-- Populando as tabelas para realizar consultas
INSERT INTO aluno (mat, cpf, identidade, nome, email) VALUES
(1001, '123.456.789-00', 'ID12345678', 'João Silva', 'joao.silva@unifei.com'),
(1002, '987.654.321-00', 'ID87654321', 'Maria Oliveira', 'maria.oliveira@unifei.com'),
(1003, '321.654.987-00', 'ID65432198', 'Ana Souza', 'ana.souza@ufla.com'),
(1004, '456.789.123-00', 'ID78912345', 'Carlos Pereira', 'carlos.pereira@ufrj.com');

INSERT INTO professor (codigo, nome, cpf, email) VALUES
(2001, 'Melise', '123.123.123-12', 'melise@unifei.edu.br'),
(2002, 'Rafael', '321.321.321-32', 'rafael@unifei.edu.br'),
(2003, 'Luiz', '456.456.456-45', 'luiz@unifei.edu.br');

INSERT INTO disciplina (codigo, nome, ementa, creditos) VALUES
(3001, 'Banco de Dados', 'Conceitos e práticas de modelagem, normalização e SQL', 4),
(3002, 'Grafos', 'Teoria dos Grafos: algoritmos, árvores e aplicações em redes', 3),
(3003, 'Arquitetura de Computadores', 'Estudo dos componentes e funcionamento do hardware', 5);

INSERT INTO turma (codigo, nome, disciplina, professor) VALUES
(4001, 'Banco de Dados - Turma A', 3001, 2001),
(4002, 'Grafos - Turma B', 3002, 2002),
(4003, 'Arquitetura de Computadores - Turma C', 3003, 2003);

INSERT INTO matricula (coda, codt, ano, semestre, nota, status) VALUES
(1001, 4001, 2024, 1, 8.5, 'A'),
(1002, 4002, 2024, 1, 7.0, 'A'),
(1003, 4003, 2024, 1, 6.0, 'A'),
(1001, 4002, 2024, 1, 9.0, 'A'),
(1004, 4003, 2024, 1, 5.5, 'R');