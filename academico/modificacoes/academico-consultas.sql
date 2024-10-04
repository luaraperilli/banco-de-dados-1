-- Retorne os dados de todos os alunos
SELECT * FROM aluno;

-- Retorne o nome e o CPF dos alunos cujo email possui @unifei
SELECT nome, cpf, email FROM aluno WHERE email LIKE '%unifei%';

-- Retorne o código das turmas que o professor com um determinado código foi alocado
SELECT codigo FROM turma WHERE professor = '2001'
-- Retorne o código das disciplinas cuja quantidade de créditos está em um determinado intervalo
SELECT codigo from disciplina WHERE creditos BETWEEN 3 AND 5;

-- Retorne os dados das matrículas que estão em curso
SELECT * FROM matricula;