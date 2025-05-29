-- Aula 28/05/2025
-- José Carlos Souza
USE bancobd22025;

DELIMITER //

CREATE TRIGGER tr_acrescenta_centavos
BEFORE UPDATE ON conta
FOR EACH ROW
BEGIN
IF(NEW.tipo = "Poupança") THEN
	IF(NEW.senha != OLD.senha) THEN
		SET NEW.saldo = OLD.saldo + 0.10;
	END IF;
END IF;
END //

DELIMITER ;
-- 
-- DROP TRIGGER tr_acrescenta_centavos;
SELECT * FROM conta;
UPDATE conta SET senha = 'no' WHERE tipo = "Poupança";

CREATE TRIGGER tr_cria_conta
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
	INSERT INTO conta (tipo,saldo,senha) VALUES ("Poupança",0.01,"ABC");
    INSERT INTO contavinculada (CLIENTE_idCLIENTE,CONTA_idCONTA,dataAbertura) VALUES (NEW.idCLIENTE,LAST_INSERT_ID(),NOW());

-- DROP TRIGGER tr_cria_conta;
INSERT INTO cliente(nome,cpf,rg,dataNascimento,telefone)
	VALUES
		('José', '456-456,444-36',NULL,'1989-03-05','35999744457');
SELECT * FROM cliente WHERE nome = "José";
SELECT * FROM conta;

CREATE TRIGGER tr_deleta_vinculo
BEFORE DELETE ON conta
FOR EACH ROW
	DELETE FROM contavinculada WHERE OLD.idCONTA = CONTA_idCONTA;

START TRANSACTION ;
DELETE FROM `bancobd22025`.`conta`
WHERE idCONTA = 3;
ROLLBACK;
SELECT * FROM contavinculada;
DROP TRIGGER tr_deleta_vinculo;

CREATE TABLE auditoria (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME DEFAULT NOW(),
    tabela_afetada VARCHAR(10)
);

CREATE TRIGGER tr_registra_log
AFTER DELETE ON contavinculada
FOR EACH ROW
INSERT INTO auditoria(data_hora,tabela_afetada) VALUES(NOW(),"contavinculada");

DELETE FROM contavinculada WHERE CONTA_idCONTA = 3;
SELECT * FROM auditoria;
