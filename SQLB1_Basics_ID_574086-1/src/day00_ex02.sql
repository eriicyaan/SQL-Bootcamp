-- Составь два разных по синтаксису запроса SELECT,
-- которые вернут список пиццерий (название и рейтинг) с рейтингом от 3.5 до 5 включительно,
-- отсортированный по рейтингу.

-- В первом запросе используй операторы сравнения (<=, >=).
-- Во втором - ключевое слово BETWEEN.


select name, rating
from pizzeria
where rating >= 3.5 and rating <= 5
order by rating;

select name, rating
from pizzeria
where rating between 3.5 and 5
order by rating;
