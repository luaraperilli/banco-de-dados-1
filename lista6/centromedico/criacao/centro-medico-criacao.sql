CREATE TABLE paciente (
    idPaciente INT PRIMARY KEY,
    nomePaciente VARCHAR(20),
    cidade VARCHAR(20)
);

CREATE TABLE medico (
    idMedico INT PRIMARY KEY,
    nomeMedico VARCHAR(20),
    hospital VARCHAR(20)
);

CREATE TABLE consulta (
    idConsulta INT PRIMARY KEY,
    data DATE,
    idMedico INT,
    idPaciente INT,
    FOREIGN KEY (idMedico) REFERENCES medico (idMedico),
    FOREIGN KEY (idPaciente) REFERENCES paciente (idPaciente)
);

CREATE TABLE receita (
    idConsulta INT,
    idReceita INT,
    nomeMedicamento VARCHAR(20),
    PRIMARY KEY (idConsulta, idReceita),
    FOREIGN KEY (idConsulta) REFERENCES consulta (idConsulta)
);