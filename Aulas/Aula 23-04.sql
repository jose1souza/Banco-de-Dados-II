-- aula 23-04
USE sakila;
SELECT 
    customer.customer_id AS ID,
    CONCAT(customer.first_name,
            " ",
            customer.last_name) AS "Nome do Cliente",
    address.district AS Distrito,
    city.city AS Cidade
FROM
    customer
        INNER JOIN
    address ON customer.address_id = address.address_id
        INNER JOIN
    city ON address.city_id = city.city_id
ORDER BY customer.customer_id; 
DESCRIBE payment;
CREATE VIEW vw_valor_gasto_dos_clientes AS 
SELECT 
    customer.customer_id AS "ID do Cliente",
    CONCAT(customer.first_name,
            " ",
            customer.
            last_name) AS "Nome do Cliente",
    SUM(payment.amount) AS "Valor Gasto"
FROM
    customer
        INNER JOIN
    payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id;
SELECT 
    *
FROM
    vw_valor_gasto_dos_clientes;
    SHOW CREATE VIEW vw_valor_gasto_dos_clientes;
