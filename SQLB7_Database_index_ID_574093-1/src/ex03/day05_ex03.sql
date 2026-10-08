SET enable_seqscan = off;


CREATE INDEX IF NOT EXISTS idx_person_order_multi ON person_order(person_id, menu_id, order_date);



EXPLAIN ANALYSE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 14;

EXPLAIN ANALYZE
SELECT person_id, menu_id
FROM person_order
WHERE person_id = 3;

SET enable_seqscan = on;
