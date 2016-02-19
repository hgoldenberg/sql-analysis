#count and group by

select count(title),rental_rate
from film
group by ANY_VALUE(rental_rate)
;