SELECT m.id
FROM menu m
LEFT JOIN person_order po
    ON po.menu_id = m.id
WHERE po.person_id IS NULL
ORDER BY m.id;