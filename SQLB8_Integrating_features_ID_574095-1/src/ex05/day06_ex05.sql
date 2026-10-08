COMMENT ON TABLE person_discounts IS 'Таблица персональных скидок';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор';
COMMENT ON COLUMN person_discounts.person_id IS 'Внешний ключ на таблицу person на поле id';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Внешний ключ на таблицу pizzeria на поле id';
COMMENT ON COLUMN person_discounts.discount IS 'Скидка пользователя в процентах';



SELECT count(*) = 5 AS check
FROM pg_description
WHERE objoid = 'person_discounts'::regclass;