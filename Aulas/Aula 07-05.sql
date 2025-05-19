SELECT @@transaction_isolation; -- vê se pode ou não entrar no caminho
SHOW ENGINES;
SHOW VARIABLES LIKE 'default_storage_engine';
-- SET transaction_isolation = 'REPEATABLE READ';
USE sakila;
SHOW TABLES;
SHOW CREATE TABLE actor; -- mostra toda a informação da criação de tabelas
SELECT * FROM information_schema.TABLES; -- filtrando informações dos esquemas
SHOW CREATE TABLE actor;
SELECT 
    table_schema, table_name, engine
FROM
    information_schema.tables
WHERE
    table_name = 'actor';
START TRANSACTION;
CREATE DATABASE thebank;
USE thebank;
CREATE TABLE conta(
	 id_conta int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    saldo_conta DECIMAL(10,2) CHECK(saldo_conta>=0)
);
INSERT INTO conta (saldo) VALUES(1,500.00),
 (2,200.00);
 -- truncate table nomedatabela; limpa dados da tabela
START TRANSACTION;

UPDATE conta 
SET 
    saldo_conta = saldo_conta - 100
WHERE
    id_conta = 1;-- tirando 100 dinheiros da conta 1
    
SELECT 
    saldo_conta
FROM
    conta
WHERE
    id_conta = 1;-- verificando o saldo
    
SELECT 
    *
FROM
    conta;

UPDATE conta 
SET 
    saldo_conta = saldo_conta + 200
WHERE
    id_conta = 2;
SELECT 
    *
FROM
    conta;
ROLLBACK; -- volta atrás de alterações
COMMIT; -- comita as alterações

UPDATE conta 
SET 
    saldo_conta = saldo_conta - 500;
-- Isolamento, não é possivel duas pessoas no servidor mexer ao mesmo tempo
-- Durabilidade, o sistema vai impedir que o commit seja perdido durante o crash do sistema
USE bancobd22025;
SHOW TABLES;
CREATE TABLE cliente2 (SELECT * FROM
    cliente); -- criando uma cópia da tabela
SELECT 
    *
FROM
    cliente2;
START TRANSACTION;
DELETE FROM cliente2 WHERE rg = "";
INSERT INTO cliente2(nome,cpf,rg,dataNascimento,telefone)VALUES ('Flávio', '456-456,456-56',NULL,'1985-03');
ROLLBACK;
