-- Aula 25/03

-- usando o banco de dados sakila
USE sakila;

-- mostra todos os bancos
SHOW databases;

-- mostra as tabelas
SHOW tables;

-- mostra os campos da tabela staff
DESCRIBE staff;

-- selecionando todos os dados da tabela ator
SELECT * FROM actor;

-- contando quantos atores existem no total
SELECT COUNT(*) FROM actor;

-- seleciona todos os atores, ordenados por primeiro nome de forma descendente
SELECT * FROM actor
ORDER BY first_name DESC;

-- Cálculos no banco
/* Apresente da tabela payment o customer_id,
   o valor original (amount) e o valor com 10% de desconto */

DESCRIBE payment;

-- selecionando o id do cliente, valor e valor com desconto (10%)
SELECT customer_id AS "ID Cliente", 
amount AS Valor,
FORMAT(amount * 0.90 ,2) AS valorComDesconto
FROM payment
WHERE customer_id = 1;

-- mostrando cálculo com soma de valores e 10% de desconto adicional
SELECT customer_id AS "ID Cliente",
amount AS Valor,
FORMAT(amount * 0.90 ,2) AS valorComDesconto,
SUM(amount * 0.90) * 0.9 AS valorTotal,
FORMAT(SUM(amount * 0.90) * 0.9, 2) AS ValorTotal
FROM payment
WHERE customer_id = 1;

-- exemplo do professor: soma do valor e desconto direto
SELECT 
    SUM(amount) AS Divida,
    SUM(amount) * 0.9 AS ValorComDesconto
FROM payment
WHERE customer_id = 1;

-- mostra todos os endereços no distrito "Alberta"
DESCRIBE address;
SELECT * FROM address;
SELECT * FROM address
WHERE district = "Alberta";

-- mostra quantos distritos são diferentes de "Alberta"
SELECT COUNT(*) AS total
FROM address
WHERE district != "Alberta";

-- quantidade de distritos únicos
SELECT 
    COUNT(DISTINCT(district)) AS totalDeDistritos
FROM address;

-- busca por clientes
SELECT * FROM customer;
SELECT * FROM customer
WHERE store_id = 1;

-- seleciona clientes cuja loja não é a número 1
SELECT * FROM customer
WHERE store_id != 1;

-- clientes ativos apenas na loja 1
SELECT * FROM customer 
WHERE store_id = 1 AND active = 1;

-- total de clientes inativos na loja 1
SELECT COUNT(*) AS total
FROM customer
WHERE store_id = 1 AND active != 1;

-- endereços nos distritos Alberta, Texas, ou Califórnia
SELECT * FROM address
WHERE district IN ("Alberta", "Texas", "California");

-- pagamentos em valores específicos
SELECT * FROM payment
WHERE amount IN (2.99, 3.99, 5.99);
