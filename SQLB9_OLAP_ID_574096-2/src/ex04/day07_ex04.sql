SELECT *
FROM (
    SELECT  p.name,
            COUNT(*) AS count
    FROM person_visits pv
    JOIN person p
        ON p.id = pv.person_id
    GROUP BY p.name
)
WHERE count > 3;