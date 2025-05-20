-- aula 01/04
USE sakila;
SHOW databases;
USE mysql;
SHOW tables;

SELECT 
    *
FROM
    user;
SELECT 
    *
FROM
    mysql.user;
    
SELECT 
    *
FROM
    sakila.actor;

-- criando um usúario
CREATE USER jose IDENTIFIED BY '1234';
CREATE USER jose@localhost IDENTIFIED BY '123';
CREATE USER jose@10.0.24.13 IDENTIFIED BY '123';
-- trocando a senha de um usúario
SET PASSWORD FOR jose = '321';
SET PASSWORD FOR jose@localhost = '321';
-- Trocando a senha apenas do seu usuario
SET PASSWORD = '321';
-- Removendo um usuario
DROP USER jose;
-- Verificando o que um usuario pode fazer
SHOW GRANTS FOR jose;
-- Permitindo privilegios para um usuario
GRANT SELECT ON sakila.actor TO jose;
GRANT SELECT ON sakila.* TO jose;
GRANT ALL ON sakila.* TO jose;
