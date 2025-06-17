DELIMITER //
CREATE PROCEDURE sp_hello()
BEGIN
	SELECT "o famoso Hello World!";
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_lista_contas_cliente ()
BEGIN
	SELECT cliente.nome, cliente.cpf, cliente.telefone, conta.idconta, conta.tipo, conta.saldo 
	FROM cliente, conta, contavinculada
	WHERE contavinculada.conta_idconta = conta.idconta
	AND contavinculada.cliente_idcliente = cliente.idcliente;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_inserir_cliente (
	IN p_nome VARCHAR(150),
    IN p_cpf VARCHAR(45),
    IN p_nascimento DATE)
BEGIN
	INSERT INTO cliente (nome, cpf, dataNascimento) VALUES (p_nome, p_cpf, p_nascimento);
END//
DELIMITER ;

