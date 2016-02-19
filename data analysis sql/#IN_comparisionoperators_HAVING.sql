#IN(), comparision operators, HAVING

#numbers of rentals in the Comedy, Sports and Family

SELECT
	c.name as category, count(r.rental_id) as num_rentals
FROM
	rental r, inventory i, film f, film_category fc, category c
WHERE
	r.inventory_id = i.inventory_id
	and i.film_id = f.film_id
	and f.film_id = fc.film_id
	and fc.category_id = c.category_id
	and c.name in ("comedy", "sports", "family")
GROUP BY
	1

;

#comparision operators (>, =)

=
>
<
>=
<=
<> not equal to
!= not equal to

SELECT
	c.name as category, count(r.rental_id) as num_rentals
FROM
	rental r, inventory i, film f, film_category fc, category c
WHERE
	r.inventory_id = i.inventory_id
	and i.film_id = f.film_id
	and f.film_id = fc.film_id
	and fc.category_id = c.category_id
	and c.name != "comedy"
GROUP BY
	1

;

# user´s who have rented at least 3 times

SELECT
	r.customer_id as customer, count(r.rental_id) as num_rentals
FROM
	rental r
GROUP BY
	1
HAVING
	count(r.rental_id) >= 3
;


# revenue for store 1 where film is rated R or PG_!3

SELECT
	i.store_id as Store, f.rating as movie_rating, sum(p.amount) as store_revenue
FROM
	film f, payment p, inventory i, rental r
WHERE
	p.rental_id = r.rental_id
	and r.inventory_id = i.inventory_id
	and i.film_id = f.film_id
	and i.store_id = 1
	and f.rating in ("R", "PG-13")
	and r.rental_date between "2005-06-08"and "2005-07-19"
GROUP BY
	1, 2
ORDER BY 3 desc
;


