INSERT INTO person_order
VALUES (
    (SELECT max(id) FROM person_visits) + 1, -- 22
    (SELECT id FROM person WHERE name='Denis'), -- 4
    (SELECT id FROM menu WHERE pizza_name='sicilian pizza'), -- 20
    '2022-02-24'
    ),
    (
    (SELECT max(id) FROM person_visits) + 2, -- 23
    (SELECT id FROM person WHERE name='Irina'), -- 6
    (SELECT id FROM menu WHERE pizza_name='sicilian pizza'), -- 20
    '2022-02-24'
    );



SELECT count(*) = 2 AS CHECK
 FROM person_order
 WHERE order_date = '2022-02-24'
   AND person_id IN (6,4)
   AND menu_id =
     (SELECT id
     FROM menu
     WHERE pizza_name = 'sicilian pizza');