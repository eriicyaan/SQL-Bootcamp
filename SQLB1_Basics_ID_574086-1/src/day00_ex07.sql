-- Напиши SQL-запрос, который вернет идентификаторы людей, их имена и интервал
-- по возрасту в виде нового вычисляемого столбца с именем interval_info,

-- согласно следующему псевдокоду:

-- if (age >= 10 and age <= 20) - вернуть «interval #1»
-- else if (age > 20 and age < 24) - вернуть «interval #2»
-- во всех остальных случаях - вернуть «interval #3»

select id, name,
	case
		when age between 10 and 20 then 'interval #1'
		when age > 20 and age < 24 then 'interval #2'
		else 'interval #3'
	end
	as interval_info
from person
order by interval_info;