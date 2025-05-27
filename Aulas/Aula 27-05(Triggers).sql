/*DELIMITER //
CREATE TRIGGER tr_rg_maiusculo
BEFORE INSERT ON cliente
FOR EACH ROW 
BEGIN SET NEW.nome = UPPER(NEW.nome);
END //
DELIMITER ; */

DELIMITER //
CREATE TRIGGER tr_atualiza_data_alteracao_cpf
BEFORE UPDATE ON cliente
FOR EACH ROW
BEGIN 
    IF (NEW.cpf != OLD.cpf) THEN
        UPDATE contavinculada 
        SET dataAbertura = NOW()
        WHERE OLD.idCLIENTE = CLIENTE_idCLIENTE;
    END IF;
END//
DELIMITER ;
DROP TRIGGER tr_atualiza_data_alteracao_cpf;
UPDATE cliente SET cpf = "111.111.111-00" WHERE idCLIENTE = 1;
SELECT * FROM cliente;
