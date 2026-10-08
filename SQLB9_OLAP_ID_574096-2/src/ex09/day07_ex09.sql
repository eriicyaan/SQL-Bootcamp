
SELECT  *, formula > average
FROM (
    SELECT  address,
            MAX(age) - ROUND(MIN(age)::numeric / MAX(age)::numeric, 2) formula,
            ROUND(AVG(age), 2) average
    FROM person
    GROUP BY address
    ORDER BY address
);