-- Número 5
SELECT 
    Name, Continent, Population
FROM
    country
WHERE
    Population > (SELECT 
            AVG(Population)
        FROM
            country);
