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
CALL sp_desconto_total_cliente(1,@Total);
