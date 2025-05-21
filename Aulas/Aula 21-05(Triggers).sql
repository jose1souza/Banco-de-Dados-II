CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    ano_nascimento INT NOT NULL
);
INSERT INTO Cliente(nome,idade) VALUES ("José",19),("Brian",19),("Lucas",19),("Ana",19),("Luis",19);
-- Criando Triggers
CREATE 
    TRIGGER  tr_atualiza_ano_nascimento
 BEFORE INSERT ON Cliente FOR EACH ROW 
    SET NEW . ano_nascimento = YEAR(NOW()) - NEW.idade;
-- Criando Tabela
CREATE TABLE Auditoria (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_item_estoque VARCHAR(45) NOT NULL,
    preco_item DECIMAL(10 , 2 ) NOT NULL,
    preco_desconto DECIMAL(10 , 2 ) NOT NULL,
    data_insercao DATETIME
);
-- Criando Triggers
CREATE 
    TRIGGER  tr_auditoria
 AFTER INSERT ON Estoque FOR EACH ROW 
    INSERT INTO Auditoria (id_auditoria , nome_item_estoque , preco_item , preco_desconto , data_insercao) 
		VALUES 
            (NULL , NEW.nome_item_estoque , NEW.preco_item , NEW.preco_desconto , NOW());
-- Inserindo e testando a Trigger
INSERT INTO Estoque(nome_item_estoque,preco_item) 
	VALUES 
		("Hub USB", 46.00);
SELECT * FROM Auditoria;
-- usando outro banco
USE bancobd22025;
CREATE 
    TRIGGER  tr_nome_maiusculo
 BEFORE INSERT ON cliente FOR EACH ROW 
    SET NEW . nome = UPPER(NEW.nome);
INSERT INTO cliente(nome,cpf,rg,dataNascimento,telefone)
	VALUES
		('Ana', '456-456,444-36',NULL,'1989-03-05','35999744457');
SELECT * FROM cliente WHERE nome = "Ana";
