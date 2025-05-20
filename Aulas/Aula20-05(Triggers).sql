-- triggers = gatilhos
/* toda vez que uma condição for acionada uma ação será executada
foco é nas tabelas
não consigo acessar remoto
são armazenados dentro do banco de dados
*/
/*CREATE TRIGGER tr_nome timing operação
ON tabela FOR EACH ROW 
declaração/tarefas que serão executadas*/
CREATE DATABASE TesteTrigger;
USE TesteTrigger;
CREATE TABLE Estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    nome_item_estoque VARCHAR(45) NOT NULL,
    preco_item DECIMAL(10 , 2 ) NOT NULL,
    preco_desconto DECIMAL(10 , 2 ) NOT NULL
);
/*
Criar uma Trigger que alimente o campo de preco_desconto
 com o valor do item subtraido de 10%
*/
CREATE 
    TRIGGER  tr_preco_desconto
 BEFORE INSERT ON Estoque FOR EACH ROW 
    SET NEW . preco_desconto = (NEW.preco_item * 0.9);
-- Calcula automaticamente o preço com desconto ao inserir um novo item no estoque
SHOW TRIGGERS;


