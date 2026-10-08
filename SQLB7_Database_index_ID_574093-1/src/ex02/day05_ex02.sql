SET enable_seqscan = off;

CREATE INDEX IF NOT EXISTS idx_person_name ON person(upper(name));


EXPLAIN ANALYSE
SELECT * 
FROM person
WHERE upper(name) = 'ANDREY';


SET enable_seqscan = on;