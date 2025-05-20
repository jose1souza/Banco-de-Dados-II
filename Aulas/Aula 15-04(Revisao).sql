-- Aula 15/04/2025
USE sakila;

-- Selecionando os clientes e seus pagamentos acima da média geral de valores pagos.
SELECT 
    CONCAT(C.first_name, " ", C.last_name) AS Nome, -- Concatena o primeiro e o último nome do cliente.
    P.amount AS Valor -- Seleciona o valor do pagamento efetuado.
FROM
    customer AS C, 
    payment AS P
WHERE
    C.customer_id = P.customer_id -- Junta as tabelas usando o ID do cliente.
    AND P.amount > (SELECT AVG(amount) FROM payment) -- Filtra pagamentos acima da média geral.
ORDER BY Valor DESC; -- Ordena os resultados do maior para o menor pagamento.

-- Selecionando atores que participaram de filmes mais longos que a média de duração.
SELECT 
    *
FROM
    film_actor -- Tabela que relaciona atores e filmes.
WHERE
    film_id IN (
        SELECT 
            film_id
        FROM
            film -- Consulta a tabela de filmes.
        WHERE
            length > (SELECT AVG(length) FROM film) -- Filtra filmes com duração acima da média.
    );

-- Selecionando nomes de atores e títulos de filmes onde a duração do filme é acima da média.
SELECT 
    CONCAT(actor.first_name, " ", actor.last_name) AS Nome, -- Concatena o primeiro e o último nome do ator.
    film.title -- Seleciona o título do filme.
FROM
    film_actor, -- Tabela que relaciona filmes e atores.
    actor, -- Tabela de atores.
    film -- Tabela de filmes.
WHERE
    actor.actor_id = film_actor.actor_id -- Relaciona os atores aos filmes que participaram.
    AND film.film_id = film_actor.film_id -- Relaciona os filmes corretamente com seus atores.
    AND film_actor.film_id IN ( -- Filtra apenas filmes com duração acima da média.
        SELECT 
            film_id
        FROM
            film
        WHERE
            length > (SELECT AVG(length) FROM film)
    )
ORDER BY film.length DESC; -- Ordena os filmes por duração, do maior para o menor.
