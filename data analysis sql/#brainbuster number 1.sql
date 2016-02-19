#brainbuster number 1
#first and last name, email address for customers from store 2
#maybe for e-mail campaign

SELECT
	first_name, last_name, email
FROM
	customer 
WHERE
	store_id = 2
;

