CREATE TABLE empregado (
	enome varchar(80) unique not null,
	ssn varchar(11) primary key,
	datanasc date check (datanasc > '01/01/1900'),
	endereco varchar(250) not null,
	dnumero int not null
);

CREATE TABLE departamento (
	dnome varchar(80) not null, 
	dnumero int primary key,
	dgerssn varchar(11) not null
);

ALTER TABLE empregado  
add foreign key (dnumero) references departamento(dnumero);

CREATE TABLE dept_localizacoes (
	dnumero int not null,
	dlocalizacao varchar(250) not null,
	primary key(dnumero, dlocalizacao),
	foreign key (dnumero) references departamento(dnumero)
);

CREATE TABLE projeto (
	pnome varchar(80) not null,
	pnumero int primary key,
	plocalizacao varchar(250) not null,
	dnum int not null,
	foreign key (dnum) references departamento(dnumero)
);

CREATE TABLE trabalha_em (
	ssn varchar(11) not null,
	pnumero int not null,
	horas int not null,
	primary key(ssn, pnumero),
	foreign key (ssn) references empregado(ssn),
	foreign key (pnumero) references projeto(pnumero)
);

ALTER TABLE trabalha_em
add constraint minimo_horas check (horas > 0);

ALTER TABLE empregado 
DROP COLUMN enome;

ALTER TABLE empregado
ADD COLUMN pnome VARCHAR(200) NOT NULL;

ALTER TABLE empregado
ADD COLUMN mnome VARCHAR(200) NOT NULL;

ALTER TABLE empregado
ADD COLUMN unome VARCHAR(200) NOT NULL;

# Alterações no banco para realizar os exercícios de modificação
ALTER TABLE empregado 
DROP COLUMN IF EXISTS pnome,
DROP COLUMN IF EXISTS mnome,
DROP COLUMN IF EXISTS unome;

ALTER TABLE empregado 
ADD COLUMN enome VARCHAR(200);

ALTER TABLE Departamento 
ALTER COLUMN DGERSSN DROP NOT NULL;



