use burger;
SELECT * FROM nascimentoclientes;
--------------------------------------------------------------- 
/*1  Criar uma Stored Procedure que, passando o código do cliente e o e-mail, atualize o e-mail de um cliente na tabela cliente.*/
DELIMITER //
CREATE PROCEDURE sp_atualiza_email_por_codigo (
	IN p_codigo INT,
	IN p_email VARCHAR(200))
BEGIN
	UPDATE cliente SET email = p_email 
	WHERE codCliente = p_codigo;
END //
DELIMITER ;
/*2 Criar uma Stored Procedure que, passando um nome novo, insira uma nova marca na tabela marca.*/
DELIMITER //
CREATE PROCEDURE sp_insere_marca(
	IN m_nome VARCHAR(200))
    BEGIN 
		INSERT INTO marca (nome) VALUES (m_nome);
END //
DELIMITER ;
/*3 Criar uma Stored Procedure que, passando o código e um nome novo, atualize o nome da marca na tabela marca.*/
DELIMITER ;
CREATE PROCEDURE sp_atualiza_marca(
	IN m_codMarca int(11),
    IN m_nome VARCHAR(200))
		BEGIN
			UPDATE marca SET nome = m_nome WHERE codMarca = m_codMarca
END //
DELIMITER ;
/*4. Criar uma Stored Procedure que, passando o código de uma marca, apague uma marca na tabela marca.*/
DELIMITER //
CREATE PROCEDURE sp_apaga_marca(
	IN m_codMarca int(11))
		BEGIN
			DELETE FROM marca WHERE codMarca = m_codMarca;
END //
DELIMITER ;
DESCRIBE categoria;
/*5.Criar uma Stored Procedure que, passando um nome novo, insira uma nova categoria na tabela categoria.*/
DELIMITER //
CREATE PROCEDURE sp_insere_categoria(
	IN c_nome VARCHAR(100))
    BEGIN 
		INSERT INTO categoria (nome) VALUES (c_nome);
	END //
DELIMITER ;
DESCRIBE cliente;
/*6 Criar uma Stored Procedure que, passando o nome do cliente e a data de nascimento, insira um novo cliente na tabela cliente.*/
DELIMITER //
CREATE PROCEDURE sp_insere_novo_cliente(
	c_nome VARCHAR(200),
    c_dataNascimento DATE)
	BEGIN
		INSERT INTO cliente (nome,endereco,bairro,cidade,cep,uf,dataNascimento,cpf,email)
			VALUES
				(c_nome,NULL,NULL,NULL,NULL,NULL,c_dataNascimento,NULL,NULL);
END //
DELIMITER ;
DESCRIBE produto;
/* 7.Criar uma Stored Procedure que, passando o código e uma nova margem de lucro,
 atualize a margem de lucro de um produto na tabela produto.
 Caso o código não corresponda a um produto, retornar a mensagem de “Produto não encontrado”.*/
 DELIMITER //
 CREATE PROCEDURE sp_atualiza_margem_lucro(
	IN p_codProduto INT(11),
	IN p_margemLucro DECIMAL(5,2))
	BEGIN 
	IF(p_codProduto = codProduto) THEN
		UPDATE produto SET margemLucro = p_margemLucro WHERE codProduto = p_codProduto;
	END IF;
    IF(p_codProduto != codProduto) THEN
		SELECT "Produto não encontrado";
	END IF;
END //
DELIMITER ;
DESCRIBE produto;
/*8.Criar uma Stored Procedure que, passando os campos obrigatórios, insira um novo produto na tabela produto.*/
DELIMITER //
CREATE PROCEDURE sp_insere_produto(
    IN p_nome VARCHAR(200),
    IN p_precoCusto DECIMAL(10,2),
    IN p_precoVenda DECIMAL(10,2),
    IN p_CATEGORIA_codCategoria INT(11),
    IN p_MARCA_codMarca INT(11))
    BEGIN
		INSERT INTO produto (nome,precoCusto,precoVenda,margemLucro,dataValidade,quantidadeEstoque,quantidadeMinima,CATEGORIA_codCategoria,MARCA_codMarca)
        VALUES (p_nome,p_precoCusto,p_precoVenda,NULL,NULL,NULL,p_CATEGORIA_codCategoria,p_MARCA_codMarca);
END //
DELIMITER ;
DESCRIBE cliente;
/* 9.Criar uma Stored Procedure que, passando parte do nome do cliente, 
seja possível consultar os clientes que possuem esta informação em qualquer parte do seu nome. */
DELIMITER //
CREATE PROCEDURE sp_procura_cliente(
	IN c_nome VARCHAR(200))
    BEGIN
    SELECT * FROM cliente WHERE nome LIKE concat("%",c_nome,"%");
END //
DELIMITER ;
