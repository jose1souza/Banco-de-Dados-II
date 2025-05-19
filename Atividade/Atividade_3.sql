-- Número 3
SELECT 
    CONCAT(C.first_name, ' ', C.last_name) AS Nome, P.amount
FROM
    customer AS C,
    payment AS P
WHERE
    C.customer_id IN (SELECT 
            customer_id
        FROM
            payment AS P
        WHERE
            amount > (SELECT 
                    AVG(amount)
                FROM
                    payment))
ORDER BY P.amount DESC;
