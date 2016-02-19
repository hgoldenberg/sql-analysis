# how many times each movie has been rent out

SELECT
	f.title, count(r.rental_id)
FROM
	film f, rent r
WHERE
	f.film_id = i.film_id
	and
	i.inventory_id = r.inven_id
GROUP BY
	1
;