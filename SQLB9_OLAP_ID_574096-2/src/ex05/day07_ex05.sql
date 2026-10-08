SELECT name
FROM (
    SELECT  p.name,
            COUNT(*) AS count
    FROM person_order po
    JOIN person p
        ON p.id = po.person_id
    GROUP BY p.name
)
WHERE count >= 1
ORDER BY name;
