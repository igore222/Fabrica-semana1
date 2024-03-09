create database Green_Oficina_bike;
use Green_Oficina_bike;

/* modelo-logico: */

CREATE TABLE Cliente (
    cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cpf VARCHAR(14),
    telefone VARCHAR(15),
    email VARCHAR(255)
);

ALTER TABLE Cliente
ADD endereco VARCHAR(255);

INSERT INTO Cliente (nome, cpf, telefone, email, endereco)
VALUES ('João da Silva', '123.456.789-00', '(11) 9999-8888', 'joao@gmail.com', 'Rua das Flores, 123, Bairro Central'), 
('Maria Oliveira', '987.654.321-00', '(22) 7777-6666', 'maria@gmail.com', 'Avenida Principal, 456, Bairro Sul'),
('Pedro Santos', '456.789.123-00', '(33) 5555-4444', 'pedro@gmail.com', 'Travessa da Paz, 789, Bairro Norte'),
('Ana Souza', '321.654.987-00', '(44) 3333-2222', 'ana@gmail.com', 'Rua das Palmeiras, 321, Bairro Leste'),
('Carlos Pereira', '789.123.456-00', '(55) 1111-9999', 'carlos@gmail.com', 'Praça do Sol, 654, Bairro Oeste'),
('Laura Ferreira', '654.321.987-00', '(66) 8888-7777', 'laura@gmail.com', 'Avenida das Estrelas, 987, Bairro Sudeste');

SELECT * FROM Cliente;


CREATE TABLE Bicicletas (
    bicicleta_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    ano INT,
    cliente_id INT
);

INSERT INTO Bicicletas (marca, modelo, ano, cliente_id)
VALUES ('Trek', 'X-Caliber', 2020, 1),
('Specialized', 'Rockhopper', 2019, 2),
('Cannondale', 'Trail', 2021, 3),
('Giant', 'Talon', 2018, 4),
('Scott', 'Aspect', 2022, 5);

ALTER TABLE Bicicletas
ADD cor VARCHAR(50);

ALTER TABLE Bicicletas
ADD FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id);

SELECT * FROM Bicicletas;

CREATE TABLE Pecas (
    peca_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    marca VARCHAR(255),
    preco DECIMAL(10,2),
    estoque INT
);

INSERT INTO Pecas (tipo, marca, preco, estoque)
VALUES ('Corrente', 'Shimano', 50.00, 10),
('Freio', 'Magura', 120.00, 5),
('Pedal', 'Wellgo', 30.00, 20),
('Pneu', 'Continental', 60.00, 15),
('Guidão', 'Ritchey', 80.00, 8);

SELECT * FROM Pecas;

CREATE TABLE Servicos (
    servico_id INT PRIMARY KEY AUTO_INCREMENT,
    data_servico DATE,
    descicao_servico VARCHAR(255),
    valor_servico DECIMAL(10,2),
    bicicleta_id INT,
    peca_id INT,
    cliente_id INT
);

INSERT INTO Servicos (data_servico, descicao_servico, valor_servico, bicicleta_id, peca_id, cliente_id)
VALUES ('2023-01-15', 'Troca de pneus e ajuste de freios', 80.00, 1, 4, 1),
('2023-02-10', 'Revisão geral e lubrificação', 120.00, 2, 2, 2),
('2023-03-20', 'Substituição da corrente', 50.00, 3, 1, 3),
('2023-04-05', 'Instalação de novo guidão', 60.00, 4, 5, 4),
('2023-05-15', 'Troca de pedais e ajuste de marchas', 40.00, 5, 3, 5);

ALTER TABLE Servicos
ADD FOREIGN KEY (bicicleta_id) REFERENCES Bicicletas (bicicleta_id);

ALTER TABLE Servicos
ADD FOREIGN KEY (peca_id) REFERENCES Pecas (peca_id);

ALTER TABLE Servicos
ADD FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id);

SELECT * FROM Servicos;

CREATE TABLE Pagamento (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    forma_pagamento INT,
    valor_pagamento DECIMAL(10,2),
    data_pagamento DATE,
    servico_id INT
);

INSERT INTO Pagamento (forma_pagamento, valor_pagamento, data_pagamento, servico_id)
VALUES (1, 50.00, '2023-01-20', 1),
(2, 80.00, '2023-02-15', 2),
(1, 30.00, '2023-03-25', 3),
(2, 60.00, '2023-04-10', 4),
(1, 40.00, '2023-05-20', 5);

SELECT * FROM Pagamento;

CREATE TABLE possui (
    fk_Cliente_cliente_id INTEGER,
    fk_Bicicletas_bicicleta_ID INTEGER
);
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_Cliente_cliente_id)
    REFERENCES Cliente (cliente_id)
    ON DELETE RESTRICT;
    
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_Bicicletas_bicicleta_ID)
    REFERENCES Bicicletas (bicicleta_ID)
    ON DELETE RESTRICT;


CREATE TABLE solicita (
    fk_Cliente_cliente_id INTEGER,
    fk_Servicos_servico_id INT
);
ALTER TABLE solicita ADD CONSTRAINT FK_solicita_1
    FOREIGN KEY (fk_Cliente_cliente_id)
    REFERENCES Cliente (cliente_id)
    ON DELETE RESTRICT;
 
ALTER TABLE solicita ADD CONSTRAINT FK_solicita_2
    FOREIGN KEY (fk_Servicos_servico_id)
    REFERENCES Servicos (servico_id)
    ON DELETE SET NULL;



CREATE TABLE Relacionamento_2 (
    fk_Cliente_cliente_id INTEGER,
    fk_Pagamento_pagamento_id INT
);
ALTER TABLE Relacionamento_2 ADD CONSTRAINT FK_Relacionamento_2_1
    FOREIGN KEY (fk_Cliente_cliente_id)
    REFERENCES Cliente (cliente_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento_2 ADD CONSTRAINT FK_Relacionamento_2_2
    FOREIGN KEY (fk_Pagamento_pagamento_id)
    REFERENCES Pagamento (pagamento_id)
    ON DELETE SET NULL;



CREATE TABLE Relacionamento_1 (
    fk_Bicicletas_bicicleta_ID INTEGER,
    fk_Servicos_servico_id INT
);
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_1
    FOREIGN KEY (fk_Bicicletas_bicicleta_ID)
    REFERENCES Bicicletas (bicicleta_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_2
    FOREIGN KEY (fk_Servicos_servico_id)
    REFERENCES Servicos (servico_id)
    ON DELETE RESTRICT;
   
   
    
CREATE TABLE Relacionamento_3 (
    fk_Servicos_servico_id INT,
    fk_Pecas_peca_id INT
);
ALTER TABLE Relacionamento_3 ADD CONSTRAINT FK_Relacionamento_3_1
    FOREIGN KEY (fk_Servicos_servico_id)
    REFERENCES Servicos (servico_id)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_3 ADD CONSTRAINT FK_Relacionamento_3_2
    FOREIGN KEY (fk_Pecas_peca_id)
    REFERENCES Pecas (peca_id)
    ON DELETE SET NULL;



CREATE TABLE Relacionamento_4 (
    fk_Servicos_servico_id INT,
    fk_Pagamento_pagamento_id INT
);
ALTER TABLE Relacionamento_4 ADD CONSTRAINT FK_Relacionamento_4_1
    FOREIGN KEY (fk_Servicos_servico_id)
    REFERENCES Servicos (servico_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento_4 ADD CONSTRAINT FK_Relacionamento_4_2
    FOREIGN KEY (fk_Pagamento_pagamento_id)
    REFERENCES Pagamento (pagamento_id)
    ON DELETE RESTRICT;
