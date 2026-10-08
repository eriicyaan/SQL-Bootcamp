CREATE TABLE IF NOT EXISTS person_audit (
    created TIMESTAMP DEFAULT now() NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INT,
    gender VARCHAR,
    address VARCHAR

    CONSTRAINT ch_type_event CHECK(type_event in ('I', 'U', 'D'))
);


CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
    BEGIN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
        VALUES (now(), 'I', new.id, new.name, new.age, new.gender, new.address);
        RETURN NULL;
    END;
    $$;


CREATE TRIGGER trg_person_insert_audit
AFTER INSERT
ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();


INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');


SELECT * FROM person_audit;