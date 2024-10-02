-- Criar 4 registros em cada tabela
INSERT INTO professor VALUES
(1, 'Dr. João Silva'),
(2, 'Profa. Maria Oliveira'),
(3, 'Dr. Carlos Pereira'),
(4, 'Profa. Ana Santos');

INSERT INTO disciplina VALUES
(1, 'Matemática', 1), 
(2, 'Física', 2),      
(3, 'Química', 3),     
(4, 'Biologia', 4);    

-- Alterar o nome de um professor
UPDATE professor 
SET nome = 'Dr. João Alves' 
WHERE id = 1;

-- Alterar o professor de todas as disciplinas em uma determinada faixa de código
UPDATE disciplina 
SET professor_id = 4 
WHERE id BETWEEN 1 AND 2;

-- Criar um atributo na tabela disciplina que deve armazenar a quantidade de créditos
ALTER TABLE Disciplina 
ADD COLUMN creditos INT CHECK (creditos > 0);
