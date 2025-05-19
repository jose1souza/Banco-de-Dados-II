-- Aula 26/03

USE sakila;

-- Buscando os registros na tabela payment
--  onde os valores seja de 5 a 7.99
SELECT * FROM payment
WHERE amount BETWEEN 5 AND 7.99
ORDER BY amount;

-- Operador Like, Letra L no começo
SELECT * FROM actor
WHERE first_name LIKE "L%";

-- Letra L no final
SELECT * FROM actor
WHERE first_name LIKE "%L";

-- Letra L em qualquer lugar
SELECT * FROM actor
WHERE first_name LIKE "%L%";

-- Pessoas com J e mais algumas letras, definindo um limite
SELECT * FROM actor
WHERE first_name LIKE "J__";

-- Operador Null e Vazio
-- Nulo não tem espaço na memória e vazio ocupa memória
SELECT * FROM address
WHERE address2 = ""; -- vazio

SELECT * FROM address
WHERE address2 IS NULL; -- nulo

-- Páginação usando Limit
SELECT * FROM actor
WHERE actor_id LIMIT 10;

-- começando no 10 e aumentando de 10
SELECT * FROM actor
WHERE actor_id LIMIT 10 ,10; -- começo, quanto vai percorrer
