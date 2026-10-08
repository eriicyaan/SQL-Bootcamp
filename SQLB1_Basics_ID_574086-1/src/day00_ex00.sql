-- Давай приступим к первому заданию. Напиши запрос SELECT,
-- который вернет имена и возраст всех людей из города «Казань».

select name, age from person
where address = 'Kazan';