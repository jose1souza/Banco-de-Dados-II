-- Monitoria Ana
DELIMITER //
CREATE TRIGGER tr_alteracao_senha_aumenta_poupanca
BEFORE UPDATE ON conta
FOR EACH ROW
BEGIN
IF(NEW.tipo = "Poupança") then
	IF(NEW.senha != OLD.senha) then
		SET NEW.saldo = OLD.saldo + 0.10;
    END IF;
END IF;
END //
DELIMITER ;
USE bancobd22025;
describe contavinculada;
UPDATE conta SET senha = "teste123" WHERE idCONTA = 1;
SELECT * FROM conta;

describe cliente;
DELIMITER //
CREATE TRIGGER tr_cliente_poupanca
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
	INSERT INTO conta (tipo,saldo,senha) VALUES ("Poupança",0.01,"ABC");
    INSERT INTO contavinculada (CLIENTE_idCLIENTE,CONTA_idCONTA,dataAbertura) VALUES (NEW.idCLIENTE,LAST_INSERT_ID(),NOW());
END //
DELIMITER ;
-- DROP TRIGGER tr_cliente_poupanca;
INSERT INTO cliente(nome,cpf,dataNascimento) VALUES ("Teste","Teste",NOW());

-- 3
DELIMITER //
CREATE TRIGGER tr_apaga_vinculos
BEFORE DELETE ON conta
FOR EACH ROW
BEGIN 
	DELETE FROM contavinculada WHERE OLD.idCONTA = contavinculada.CONTA_idCONTA;
END //
DELIMITER ;

START TRANSACTION;
DELETE FROM conta
WHERE idCONTA = 1;
ROLLBACK;
SELECT * FROM conta;
SELECT * FROM contavinculada;

-- 4
CREATE TABLE Au
