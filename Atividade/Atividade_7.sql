-- Número 7
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
                    MAX(LifeExpectancy)
                FROM
                    country));
