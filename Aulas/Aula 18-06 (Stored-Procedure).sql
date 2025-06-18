show databases;
DELIMITER //
CREATE PROCEDURE sp_desconto_total_cliente(
	IN p_idcliente INT,
    OUT p_desconto_total DECIMAL(7,2))
BEGIN
	SELECT SUM(venda.desconto) INTO p_desconto_total
	FROM venda, cliente
		WHERE venda.cliente_codCliente = p_idcliente AND
		venda.Cliente_codCliente = cliente.codCliente;
END //
DELIMITER ;
select * from venda;
SELECT SUM(desconto)
	FROM venda,cliente
		WHERE venda.cliente_codCliente = 6 AND
		venda.Cliente_codCliente = cliente.codCliente;
CALL sp_desconto_total_cliente(5,@desconto);
select @desconto;
SELECT * FROM marca;
DELIMITER //
CREATE PROCEDURE sp_guarda_marca(
	IN p_nome VARCHAR(100),
    OUT p_nome_guardado VARCHAR(100))
    BEGIN
		SELECT nome INTO p_nome_guardado
        FROM marca WHERE nome = p_nome LIMIT 1;
END //
DELIMITER ;
CALL sp_guarda_marca("Garoto",@nomeRecebido);
-----------------------------------------------------
-- Usando outro banco
use bancobd22025;
DELIMITER //
CREATE PROCEDURE sp_inserir_cliente(
	IN p_nome_cliente VARCHAR(150),
    IN p_cpf_cliente VARCHAR(45),
    IN p_nascimento_cliente DATE
)
BEGIN 
	IF (
    p_nome_cliente IS NULL OR 
    TRIM(p_nome_cliente) = '' OR
    p_cpf_cliente IS NULL OR 
    TRIM(p_cpf_cliente) = '' OR
    p_nascimento_cliente IS NULL OR 
    TRIM(p_nascimento_cliente) = ''
    ) THEN
		SELECT "Campos obrigatórios!" AS msg;
	ELSE 
		INSERT INTO cliente (nome, cpf, dataNascimento)
			VALUES
				(p_nome_cliente,p_cpf_cliente,p_nascimento_cliente);
    END IF;
END //
DELIMITER ;
CALL sp_inserir_cliente("José","156.788.123-54",NULL);
SELECT * FROM cliente;
