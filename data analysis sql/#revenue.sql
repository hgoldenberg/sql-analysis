#revenue per video title


SELECT
	f.title as "Film Title", count(r.rental_id) as "Number of Rentals", f.rental_rate as "Rental Price", count(r.rental_id)* f.rental_rate as "Revenue"
FROM
	film f, rental r, inventory i
WHERE
	f.film_id = i.film_id
	and
	i.inventory_id = r.inventory_id
GROUP BY
	1,3
ORDER BY
	4 desc
;

# revenue = price * number of rentals

SUM()
# what customer has paid us the most money

SELECT
	p.customer_id, SUM(p.amount)
FROM
	payment p
GROUP BY
	1
ORDER BY
	2 desc
;

