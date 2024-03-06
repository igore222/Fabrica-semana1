create database AcquaEscola;
use AcquaEscola;

/* Lógico_1: */

CREATE TABLE Aluno (
    Nome VARCHAR(200) PRIMARY KEY,
    Idade INTEGER,
    Endereco VARCHAR (100),
    Nivel VARCHAR(100));
      
insert into Aluno (Nome, Idade, Endereco, Nivel)
values ('Joao', '21', 'Av Epitacio Pessoa, 18', 'intermediário'),
('Maria', '50', 'Av Joao Machado, 1559', 'Avançado'),
('Lourdes', '42', 'Av Ranieri Mazzili, 562', 'intermediário'),
('Socorro', '51', 'Rua Ipojucan dos Anjos Seabra, 287', 'iniciante');
    
   
CREATE TABLE Instrutor (
    ID INTEGER PRIMARY KEY,
    Nome VARCHAR(200),
    EspecialidadeNado VARCHAR(100),
    Experiencia VARCHAR(50)
    );
    

insert into Instrutor (ID, Nome, EspecialidadeNado, Experiencia)
values ('001', 'Joana Maria', 'crawl', '3 anos'),
('002', 'Maciel Alves', 'borboleta', '2 anos'),
('003', 'Mariana Serrão', 'Peito', '5 anos'),
('004', 'Thalia Andrade', 'crawl', '3 anos'),
('005', 'Fernanda Silva', 'Costas', '4 anos'),
('006', 'Anderson Guedes', 'Borboleta', '2 anos');

SELECT ID FROM Instrutor;
SELECT * FROM Instrutor WHERE nome LIKE 'J%';
SELECT * FROM Instrutor WHERE nome LIKE '%ue%';
SELECT * FROM Instrutor WHERE nome LIKE 'P_ _ _ ';
SELECT * FROM Instrutor WHERE nome NOT LIKE 'J%';

  
CREATE TABLE Aula (
    Tipodeaula VARCHAR(100) PRIMARY KEY,
    DiasHorarios TIMESTAMP,
    Duracao INTEGER,
    Local VARCHAR(100)
);

insert into Aula (TipodeAula, DiasHorarios, Duracao, Local)
values ('001 particular', 'Segunda-feira, 13h', '50min', 'Pisc 01'),
 ('002 particular', 'Segunda-feira, 14h', '50min', 'Pisc 01'),
 ('003 particular', 'Terça-feira, 13h', '50min', 'Pisc 01'),
 ('004 grupo', 'Segunda-feira, 14h', '50min', 'Pisc 03'),
 ('005 grupo', 'quarta-feira 13h', '50min', 'Pisc 03'),
 ('006 grupo', 'terça-feira, 18h', '50min', 'Pisc 03');


CREATE TABLE Piscina (
    Nome VARCHAR(200) PRIMARY KEY,
    Metragem DECIMAL,
    Profundidade DECIMAL,
    CapacidadeAlunos INTEGER
);

insert into Piscina (Nome, Metragem, Profundidade, CapacidadeAlunos)
values('Pisc 001', '50', '2,5', '15'),
('Pisc 002', '50', '2,5', '15'),
('Pisc 003', '50', '2,5', '15'),
('Pisc 004', '50', '2,5', '15'),
('Pisc 005', '50', '2,5', '15'),
('Pisc 006', '100', '3,0', '20');

SELECT * FROM Piscina WHERE nome = 'Pisc 0001' LIMIT 0, 100;



CREATE TABLE Matricula (
    ID INTEGER PRIMARY KEY,
    Data_de_Matricula DATE,
    Valor DECIMAL,
    Status VARCHAR(100)
);

insert into Matricula (ID, Data_de_Matricula, Valor, Status)
values('123456', '01/02/2024', '120.00', 'Ativa'),
('123457', '01/02/2024', '120.00', 'Ativa'),
('123498', '01/07/2023', '120.00', 'Ativa'),
('123289', '01/01/2021', '120.00', 'Ativa'),
('123389', '01/09/2021', '120.00', 'Ativa'),
('123475', '01/02/2022', '120.00', 'Ativa');


ALTER TABLE Matricula ADD COLUMN  Salario DECIMAL DEFAULT NULL;

ALTER TABLE Matricula DROP COLUMN Status;

SELECT SUM(Valor) AS total FROM Matricula;

SELECT AVG(Valor) AS 'média de mensalidades' FROM Matricula;

SELECT * FROM Matricula;

SELECT * FROM Matricula WHERE Valor IS NULL;

SELECT * FROM Matricula WHERE Valor BETWEEN 100 AND 150 ORDER BY Valor ASC;

SELECT COUNT(*) AS ID FROM Matricula;

SELECT SUM(Valor) AS Valor FROM Matricula;

SELECT MAX(valor) AS 'Maior preço' FROM Matricula;

SELECT ID, COUNT(*) as Status FROM Matricula GROUP BY ID;


CREATE TABLE Avaliacao (
    Peso DECIMAL,
    Altura DECIMAL,
    IMC DECIMAL
);

insert into Avaliacao (Peso, Altura, IMC)
values ('82.9', '1.75', '27.7'),
('78.5', '1.60', '23'),
('69.0', '1.80', '30'),
('56', '1.50', '25'),
('70.0', '1.65', '22'),
('67.0', '1.69', '32');

SELECT AVG(Altura) AS 'Média de Altura' FROM Avaliacao;

SELECT MAX(IMC) AS 'Maior Altura' FROM Avaliacao;

SELECT MIN(IMC) AS 'Menor Altura' FROM Avaliacao;



CREATE TABLE Relacionamento_1 (
    fk_Matricula_ID INTEGER,
    fk_Aluno_Nome VARCHAR(100)
);

DROP TABLE Relacionamento_1;

CREATE TABLE Relacionamento_4 (
    fk_Aula_Tipodeaula VARCHAR(100),
    fk_Piscina_Nome VARCHAR(100)
);

DROP TABLE Relacionamento_4;

CREATE TABLE Relacionamento_2 (
    fk_Matricula_ID INTEGER,
    fk_Aula_Tipodeaula VARCHAR(100)
);

DROP TABLE Relacionamento_2;


CREATE TABLE Relacionamento_3 (
    fk_Aula_Tipodeaula VARCHAR(100),
    fk_Instrutor_ID INTEGER
);

DROP TABLE Relacionamento_3;

CREATE TABLE Relacionamento_5 (
    fk_Aluno_Nome VARCHAR(100)
);

DROP TABLE Relacionamento_5;
 
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_1
    FOREIGN KEY (fk_Matricula_ID)
    REFERENCES Matricula (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_2
    FOREIGN KEY (fk_Aluno_Nome)
    REFERENCES Aluno (Nome)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_4 ADD CONSTRAINT FK_Relacionamento_4_1
    FOREIGN KEY (fk_Aula_Tipodeaula)
    REFERENCES Aula (Tipodeaula)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_4 ADD CONSTRAINT FK_Relacionamento_4_2
    FOREIGN KEY (fk_Piscina_Nome)
    REFERENCES Piscina (Nome)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_2 ADD CONSTRAINT FK_Relacionamento_2_1
    FOREIGN KEY (fk_Matricula_ID)
    REFERENCES Matricula (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_2 ADD CONSTRAINT FK_Relacionamento_2_2
    FOREIGN KEY (fk_Aula_Tipodeaula)
    REFERENCES Aula (Tipodeaula)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_3 ADD CONSTRAINT FK_Relacionamento_3_1
    FOREIGN KEY (fk_Aula_Tipodeaula)
    REFERENCES Aula (Tipodeaula)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_3 ADD CONSTRAINT FK_Relacionamento_3_2
    FOREIGN KEY (fk_Instrutor_ID)
    REFERENCES Instrutor (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_5 ADD CONSTRAINT FK_Relacionamento_5_1
    FOREIGN KEY (fk_Aluno_Nome)
    REFERENCES Aluno (Nome)
    ON DELETE SET NULL;