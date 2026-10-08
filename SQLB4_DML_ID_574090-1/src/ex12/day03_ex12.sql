INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT  (SELECT MAX(id) FROM person_order) + gs id,
        p.id person_id,
        (SELECT id FROM menu WHERE pizza_name = 'greek pizza') menu_id,
        '2022-02-25'
FROM person p
JOIN generate_series(1, (SELECT count(*) FROM person)) as gs
    ON gs = p.id;


SELECT count(*) = 9 AS CHECK
 FROM person_order
 WHERE order_date = '2022-02-25'
   AND menu_id =
     (SELECT id
     FROM menu
     WHERE pizza_name = 'greek pizza');