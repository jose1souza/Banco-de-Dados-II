-- Aula 19/03

-- mostra todos os bancos
SHOW DATABASES;

-- apagando um banco de dados
DROP DATABASE sakila;

-- usando o banco do sakila
USE sakila;

-- mostra tabelas do sakila
SHOW TABLES;

-- selecionando todos os dados da tabela actor
SELECT * FROM actor;

-- motrando os dados da tabela por um atributo
SELECT first_name FROM actor;

-- mostra como a tabela foi criada
DESCRIBE actor;

-- Selecionar diversos campos
SELECT first_name, last_name FROM actor;

-- Por ordem alfabetica ascendente
SELECT first_name, last_name
FROM actor
ORDER BY first_name ASC;

-- Por ordem alfabetica descendente
SELECT first_name, last_name
FROM actor
ORDER BY first_name DESC;

-- Contando quantos atores estão inseridos no banco
SELECT COUNT(*) FROM actor;

-- Mostrando quantos Adams tem
SELECT first_name
FROM actor
WHERE first_name = "ADAM";

-- Mostrando a quantidade de Adams em número
SELECT COUNT(*) 
FROM actor
WHERE first_name = "ADAM";

-- Mostrando os Adams com o sobrenome em ordem descendente
SELECT first_name, last_name
FROM actor
WHERE first_name = "ADAM"
ORDER BY last_name DESC;

SHOW TABLES;
SELECT * FROM customer;
SELECT * FROM payment;
DESCRIBE payment;

-- Selecionando coluna amount da tabela payment
SELECT amount 
FROM payment;

-- Vendo o maior valor da tabela
SELECT amount
FROM payment
ORDER BY amount DESC;

-- Vendo o maior valor da tabela retirando ás repetições
SELECT distinct(amount)
FROM payment
ORDER BY amount DESC;

-- Total de 11,99 da tabela payment
SELECT COUNT(amount) AS "total_11,99"
FROM payment
WHERE amount = 11.99;

-- SELECIONE os menores que 11.99
SELECT COUNT(amount) AS "menores_11,99"
FROM payment 
WHERE amount < 11.99;

-- SELECIONE os maiores que 5
SELECT COUNT(amount) AS "maiores_11,99"
FROM payment
WHERE amount > 5;

-- SELECIONE entre 5 e 10
SELECT COUNT(*) AS "entre5e10"
FROM payment
WHERE amount > 5 AND amount < 10;

-- SELECIONE entre 5 e 10 usando Between
SELECT COUNT(*) AS "entre5e10"
FROM payment
WHERE amount BETWEEN 5 AND 10;
