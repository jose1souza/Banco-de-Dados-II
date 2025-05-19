USE world;

-- Número 4
SHOW tables;
SELECT 
    Name, Continent, Code, MAX(Population)
FROM
    country;
