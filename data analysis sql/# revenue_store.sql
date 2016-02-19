# revenue by store

SELECT
	i.store_id as "Store ID", SUM(p.amount) as "Revenue"
FROM
	inventory i, payment p, rental r
WHERE
	p.rental_id = r.rental_id
	AND
	r.inventory_id = i.inventory_id
GROUP BY
	1
ORDER BY
	2 desc
;