SET enable_seqscan = off;


CREATE UNIQUE INDEX IF NOT EXISTS idx_person_order_order_date 
ON person_order(person_id, menu_id)
WHERE order_date = '2022-01-01';


EXPLAIN ANALYSE
SELECT person_id, menu_id
FROM person_order
WHERE person_id = 1 AND order_date='2022-01-02';

SET enable_seqscan = on;

