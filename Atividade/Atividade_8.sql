-- Número 8
SELECT 
    country.Name, country.Continent
FROM
    country
WHERE
    country.Code = (SELECT 
            CountryCode
        FROM
            countrylanguage
        GROUP BY CountryCode
        ORDER BY COUNT(Language) DESC
        LIMIT 1)
ORDER BY country.Name ASC;
            
DESCRIBE countrylanguage;
