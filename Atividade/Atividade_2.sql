-- Número 2
SELECT 
    CONCAT(A.first_name, ' ', A.last_name) AS Nome, F.length
FROM
    actor AS A,
    film AS F,
    film_actor AS FA
WHERE
    A.actor_id = FA.actor_id
        AND FA.film_id IN (SELECT 
            film_id
        FROM
            film
        WHERE
            length > (SELECT 
                    AVG(length)
                FROM
                    film));
