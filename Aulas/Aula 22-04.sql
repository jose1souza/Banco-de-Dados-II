-- Estudo de View
USE sakila;
/* uma view que mostre todos o id
 e o nome completo de todos os clientes */
CREATE VIEW vw_lista_clientes AS
    SELECT 
        customer_id, 
        CONCAT(first_name, ' ', last_name) AS Nome
    FROM
        customer;
-- consultando a view criada
SELECT 
    *
FROM
    vw_lista_clientes;
-- Criação de uma view que mostra todos o ID e o nome completo de todos os atores
CREATE VIEW vw_lista_atores AS
    SELECT 
        actor_id AS ID,
        CONCAT(first_name, ' ', last_name) AS Nome
    FROM
        actor;
-- usando a view
SELECT 
    *
FROM
    vw_lista_atores;
-- Uma view que mostre quais os tempos de empréstimos (rental_duration) dos filmes
CREATE VIEW vw_lista_duracao_aluguel AS
    SELECT DISTINCT
        (rental_duration) AS "Tempo de Empréstimos"
    FROM
        film
    ORDER BY rental_duration DESC;
-- Usando a view lista de alugueis
SELECT 
    *
FROM
    vw_lista_duracao_aluguel;
-- Drop de views
DROP VIEW vw_lista_emprestimos;
-- Crie uma view que mostre quantos filmes foram alugados em cada uma dos tempos de empréstimos apresentado na consulta anterior
CREATE VIEW vw_filmes_tempo_de_aluguel AS
    SELECT 
        COUNT(title) AS "Total de Filmes",
        rental_duration AS "Tempo de Aluguel"
    FROM
        film
    GROUP BY rental_duration;
    SELECT * FROM vw_filmes_tempo_de_aluguel;
/* Criação de uma view que mostre o id docliente, 
o nome completo dele, o nome do distritito que ele pertence e o nome da cidade */
SELECT * FROM customer;
SELECT * FROM address;
SELECT  * FROM city;
CREATE VIEW vw_distrito_cidade_dos_clientes AS 
SELECT 
    customer.customer_id AS ID,
    CONCAT(customer.first_name,
            " ",
            customer.last_name) AS "Nome do cliente",
    A.district AS Distrito,
    city.city
FROM
    customer,
    address AS A,
    city
WHERE
    customer.address_id = A.address_id
        AND A.city_id = city.city_id;
SELECT * FROM vw_distrito_cidade_dos_clientes;
-- Usando inner join
/*SELECT 
    customer.customer_id AS ID,
    CONCAT(customer.first_name, " ", customer.last_name) AS "Nome do Cliente",
    address.district AS Distrito,
    city.city AS Cidade
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
ORDER BY customer.customer_id;
*/
