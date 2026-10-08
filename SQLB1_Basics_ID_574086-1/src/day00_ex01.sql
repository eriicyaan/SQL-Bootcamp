-- Теперь напиши запрос SELECT, который выведет имена и возраст всех женщин
-- из города «Казань». И, конечно же, отсортируй результат по имени.

select name, age from person
where address = 'Kazan' and gender = 'female'
order by name;