-- Populando a tabela de Pacientes
INSERT INTO paciente (idPaciente, nomePaciente, cidade) VALUES
    (1, 'José Maria Silva', 'São João Del Rei'),
    (2, 'Maria Antônia Vieira', 'Itajubá'),
    (3, 'Carlos Souza', 'Itajubá'),
    (4, 'Ana P Ferreira', 'Pouso Alegre'),
    (5, 'Luciana Mendes', 'Belo Horizonte'),
    (6, 'João José Braga', 'São Lourenço'),
    (7, 'Mariana Silva', 'Itajubá'),
    (8, 'Pedro Almeida', 'São João Del Rei'),
    (9, 'Felipe Gonçalves', 'Alfenas'),
    (10, 'Sofia Carvalho', 'Lavras'),
    (11, 'Renato Batista', 'Itajubá'),
    (12, 'Fernanda Farias', 'Varginha'),
    (13, 'Cláudio Martins', 'Pouso Alegre'),
    (14, 'Beatriz Andrade', 'Três Corações'),
    (15, 'Thiago Pereira', 'Belo Horizonte');

-- Populando a tabela de Médicos
INSERT INTO medico (idMedico, nomeMedico, hospital) VALUES
    (1, 'Lúcio Andrade', 'Hospital São João'),
    (2, 'Carla Mendes', 'Hospital Itajubá'),
    (3, 'João Braga', 'Hospital Regional'),
    (4, 'Lucas Pereira', 'Hospital Central'),
    (5, 'Marcela Lima', 'Hospital Sul Minas'),
    (6, 'Rafael Teixeira', 'Hospital Regional'),
    (7, 'Bianca Rodrigues', 'Hospital Clínicas'),
    (8, 'Fernando Lima', 'Hospital São Paulo'),
    (9, 'Renata Castro', 'Hospital da Unimed'),
    (10, 'Clara Santos', 'Hospital de Alfenas'),
    (11, 'Luís Almeida', 'Hospital do Coração'),
    (12, 'Paulo Cesar', 'Hospital São João'),
    (13, 'Gabriela Nogueira', 'Hospital Itajubá'),
    (14, 'Roberta Silva', 'Hospital Central'),
    (15, 'Pedro Costa', 'Hospital São Paulo');

-- Populando a tabela de Consultas
INSERT INTO consulta (idConsulta, data, idMedico, idPaciente) VALUES
    (1, '2020-02-10', 1, 1),
    (2, '2020-02-15', 2, 2),
    (3, '2013-04-05', 3, 3),
    (4, '2013-04-12', 4, 4),
    (5, '2021-03-22', 5, 5),
    (6, '2021-07-30', 6, 6),
    (7, '2020-02-18', 1, 7),
    (8, '2013-04-10', 8, 8),
    (9, '2013-04-08', 3, 9),
    (10, '2022-08-15', 10, 10),
    (11, '2022-09-10', 11, 11),
    (12, '2022-10-20', 12, 12),
    (13, '2022-10-22', 13, 13),
    (14, '2022-11-15', 14, 14),
    (15, '2022-12-01', 15, 15),
    (16, '2021-06-12', 3, 2),  -- Consulta de João José da Silva Braga
    (17, '2021-06-14', 3, 3),  -- Consulta de João José da Silva Braga
    (18, '2021-06-16', 3, 4),  -- Consulta de João José da Silva Braga
    (19, '2021-06-20', 1, 5),
    (20, '2021-06-22', 1, 6),
    (21, '2021-06-25', 2, 1),
    (22, '2021-06-27', 2, 4),
    (23, '2021-07-02', 4, 6),
    (24, '2021-07-04', 4, 3);
    
-- Populando a tabela de Receitas
INSERT INTO receita (idConsulta, idReceita, nomeMedicamento) VALUES
    (1, 1, 'Omeprazol 20mg'),
    (1, 2, 'Paracetamol 500mg'),
    (2, 1, 'Amoxicilina'),
    (3, 1, 'Omeprazol 40mg'),
    (4, 1, 'Ibuprofeno'),
    (5, 1, 'Diclofenaco'),
    (6, 1, 'Cetirizina'),
    (7, 1, 'Loratadina'),
    (8, 1, 'Omeprazol 20mg'),
    (9, 1, 'Prednisona'),
    (10, 1, 'Aspirina 500mg'),
    (11, 1, 'Dipirona Sódica'),
    (12, 1, 'Losartana'),
    (13, 1, 'Atenolol'),
    (14, 1, 'Metformina');
