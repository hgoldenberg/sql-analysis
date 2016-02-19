# left(), MIN(), MAX()

LEFT()
MIN()
MAX()

# How many rentals we had each month

SELECT
	left(r.rental_date,7), count(r.rental_id)
FROM
	rental r, 
GROUP BY
	1
ORDER BY
	2 desc
;

#customers who have been inactive

SELECT
	f.title as "Film Title", max(r.rental_date) as "Last Rental Date", min(r.rental_date) as "First Rental Date"
FROM
	rental r, inventory i, film f
WHERE
	r.inventory_id = i.inventory_id
	AND
	i.film_id = f.film_id
GROUP BY
	f.film_id
;


#Every customer´s last rental Date 

SELECT
	concat(c.first_name," ",c.last_name) as Name, c.email as email, max(r.rental_date) as last_rental_date
FROM
	customer c, rental r
WHERE
	r.customer_id = c.customer_id
GROUP BY
	c.customer_id
;

#revenue by month 

SELECT
	left (p.payment_date,7) as Month, sum(p.amount) as Monthly_Revenue
FROM
	payment p
GROUP BY
	1
;