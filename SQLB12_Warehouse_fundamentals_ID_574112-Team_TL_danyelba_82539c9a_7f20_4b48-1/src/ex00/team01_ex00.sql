WITH last_rate AS(
	SELECT DISTINCT ON(id) id, rate_to_usd,name,updated
	FROM currency
	ORDER BY id, updated DESC
), prerelease AS(
	SELECT coalesce(u.name,'not defined') name,
			COALESCE(u.lastname,'not defined') lastname,
			b."type" "type", 
			sum(money) volume,
			COALESCE(c.name,'not defined') currency_name,
			coalesce(rate_to_usd,1) last_rate_to_usd
	FROM "user" u
	FULL JOIN balance b ON u.id= b.user_id
	FULL JOIN last_rate c ON c.id = b.currency_id
	GROUP BY 1,2,3,5,6
	ORDER BY name DESC,lastname, b.type
)



SELECT name, lastname, "type",volume, currency_name,last_rate_to_usd, volume*last_rate_to_usd total_volume_in_usd
FROM prerelease;