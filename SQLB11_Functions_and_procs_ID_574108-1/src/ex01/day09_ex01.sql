
CREATE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
    BEGIN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
        VALUES (now(), 'U', old.id, old.name, old.age, old.gender, old.address);
        RETURN NULL;
    END;
    $$;



CREATE TRIGGER trg_person_update_audit
AFTER UPDATE
ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();


UPDATE person SET name = 'Bulat' WHERE id = 10; 

UPDATE person SET name = 'Damir' WHERE id = 10;

SELECT * FROM person_audit;
