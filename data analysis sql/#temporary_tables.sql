# RENTALS PER USER

drop temporary table if exists rentals_per_customer;
create temporary table rentals_per_customer
SELECT
	r.customer_id as customer_id, count(r.rental_id) as num_rentals, sum(p.amount) as customer_revenue
FROM
	rental r, payment p
WHERE
	p.rental_id = r.rental_id
GROUP BY
	1

;

# REVENUE BY USERS WHO RENTED X NUMBER OF VIDEOS

SELECT
	rpc.num_rentals, sum(rpc.customer_revenue) as total_revenue, count(rpc.customer_id) as num_customers
FROM
	rentals_per_customer rpc
GROUP BY
	1

;


# Revenue by Actor / Actress - actor´s name, amount of revenue they produced

# Revenue per film

create temporary table rev_per_film
SELECT
	f.film_id as film_id, f.rental_rate*count(r.rental_id) as film_revenue
FROM
	rental r, inventory i, film f
WHERE
	r.inventory_id = i.inventory_id
	and i.film_id = f.film_id
GROUP BY 1

;

# Actor to Film Revenue

SELECT
	a.actor_id, concat(a.first_name, " ", a.last_name), sum(rpf.film_revenue)
FROM
	rev_per_film rpf, actor a, film_actor fa
WHERE
	a.actor_id = fa.actor_id
	and fa.film_id = rpf.film_id
GROUP BY
	1
;

