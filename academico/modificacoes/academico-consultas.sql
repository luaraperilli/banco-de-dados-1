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

-- Retorne o nome das turmas com o nome dos seus respectivos professores
SELECT t.nome AS nome_turma,
       p.nome AS nome_professor
FROM turma t
JOIN professor p ON t.professor = p.codigo;

-- Retorne o nome das turmas do professor cujo CPF é igual a um determinado valor
SELECT t.nome AS nome_turma
FROM turma t
JOIN professor p ON t.professor = p.codigo
WHERE p.cpf = '123.123.123-12';

-- Retorne o nome dos alunos e código das turmas somente para as matrículas com status reprovado
SELECT a.nome AS nome_aluno,
       m.codt AS codigo_turma
FROM aluno a
JOIN matricula m ON a.mat = m.coda
WHERE m.status = 'R';

-- Retorne o nome do aluno e o código das turmas que está matriculado considerando incluindo os alunos que não estão matriculados em turmas
SELECT a.nome AS nome_aluno, t.codigo AS codigo_turma
FROM aluno a
LEFT JOIN matricula m ON a.mat = m.coda -- Relaciona alunos com matrículas
LEFT JOIN turma t ON m.codt = t.codigo; -- Relaciona matrículas com turmas

-- Retorne o nome da disciplina e o código das turmas associadas incluindo as disciplinas que não possuem turma
SELECT d.nome AS nome_disciplina, t.codigo AS codigo_turma
FROM disciplina d
LEFT JOIN turma t ON d.codigo = t.disciplina;