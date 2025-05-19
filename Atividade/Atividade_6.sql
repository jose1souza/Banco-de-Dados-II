-- Número 6
SHOW TABLES;
DESCRIBE country;
DESCRIBE city;
SELECT 
    *
FROM
    city;
SELECT 
    city.Name, country.LifeExpectancy
FROM
    country,
    city
WHERE
    city.CountryCode = country.Code
        AND city.CountryCode IN (SELECT 
            Code
        FROM
            country
        WHERE
            LifeExpectancy = (SELECT 
                    MIN(LifeExpectancy)
                FROM
                    country));
    
SELECT MIN(LifeEXpectancy) FROM country;
