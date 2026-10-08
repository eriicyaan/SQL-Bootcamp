-- 5 числа: balance
-- 4 числа: currency
-- 3 числа: currency


-- 5 числа: currency
-- 4 числа: currency
-- 3 числа: balance

WITH currency_names AS (
    SELECT  id,
            MAX(name) currency_name
    FROM currency
    GROUP BY id
)
SELECT  COALESCE(u.name, 'not defined') name,
        COALESCE(u.lastname, 'not defined') lastname,
        cn.currency_name,
        b.money *
        COALESCE(
            CASE 
                WHEN EXISTS (
                    SELECT c.rate_to_usd
                    FROM currency c
                    WHERE   c.id = b.currency_id
                            AND c.updated <= b.updated
                )
                THEN (
                    SELECT c.rate_to_usd
                    FROM currency c
                    WHERE   c.id = b.currency_id
                            AND c.updated <= b.updated
                    ORDER BY c.updated DESC
                    LIMIT 1
                )   
                ELSE (
                    SELECT c.rate_to_usd
                    FROM currency c
                    WHERE   c.id = b.currency_id
                            AND c.updated > b.updated
                    ORDER BY c.updated ASC
                    LIMIT 1
                )
            END,
            1
        ) currency_in_usd
FROM "user" u
RIGHT JOIN balance b
    ON b.user_id = u.id
JOIN currency_names cn
    ON cn.id = b.currency_id
ORDER BY
    name DESC,
    lastname ASC,
    currency_name ASC;