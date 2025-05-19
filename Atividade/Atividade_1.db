USE sakila;
DESCRIBE film;
-- Número 1
SELECT 
    title, rental_duration
FROM
    film AS F
WHERE
    F.rental_duration = (SELECT 
            MAX(rental_duration)
        FROM
            film);
SELECT 
    rental_duration
FROM
    film;
