-- SELECT COUNT(DISTINCT amount) FROM payment;

-- SELECT * FROM film
-- WHERE rental_rate > 4 AND replacement_cost >= 19.99
-- AND rating='R';

-- SELECT store_id, first_name, last_name FROM customer
-- ORDER BY store_id DESC, first_name ASC

-- SELECT * FROM payment
-- WHERE amount !=0.00
-- ORDER BY payment_date DESC
-- LIMIT 5;

-- SELECT title, length FROM film
-- ORDER BY length ASC
-- LIMIT 5;

-- SELECT COUNT(title) FROM film
-- WHERE length <=50

-- SELECT * FROM payment
-- WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15'

-- SELECT * FROM customer
-- WHERE first_name IN ('John', 'Jake', 'Julie')
-- 	Returns any of these values if present

-- SELECT * FROM customer
-- WHERE first_name LIKE '%er%'
-- 	Before and after can be or not be any number of characters

-- SELECT * FROM customer
-- WHERE first_name LIKE '_er%'
-- 	Before can be only one character

-- SELECT * FROM customer
-- WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
-- 	Select values where name starts with A, but last name
-- 	doesn't start with B
-- ORDER BY last_name

-- SELECT customer_id, SUM(amount) FROM payment
-- WHERE customer_id NOT IN (184, 87, 477)
-- GROUP BY customer_id

-- SELECT customer_id, SUM(amount) FROM payment
-- GROUP BY customer_id
-- HAVING SUM(amount) > 100

-- SELECT store_id, COUNT(customer_id) FROM customer
-- GROUP BY store_id
-- having COUNT(*) >300
-- -- 	Performs a filter after group by

-- SELECT * FROM customer
-- FULL OUTER JOIN payment
-- ON customer.customer_id = payment.customer_id
-- -- 	Because this is a full outer join it will join all together
-- WHERE customer.customer_id IS null
-- OR payment.payment_id IS null
-- -- 	Join only those rows that have customer without payments
-- -- 	or haven't any payment information
-- 	Thus we make sure that there aren't any customer entries with
-- 	no payments and no payments without assigned customers

-- SELECT film.film_id, title, inventory_id, store_id
-- FROM film
-- LEFT JOIN inventory ON
-- -- LEFT OUTER JOIN - is the same command
-- inventory.film_id = film.film_id
-- WHERE inventory.film_id IS null

-- SHOW ALL
	-- Shows all avaiable variables

-- SELECT NOW()
	-- Gives you info about your date and time

-- SELECT EXTRACT (MONTH FROM payment_date) AS pay_month
-- FROM payment

-- SELECT TO_CHAR(payment_date, 'YYYY')
-- -- 	Shows only year of the date
-- FROM payment

-- SELECT upper(first_name) || ' ' || upper(last_name) AS full_name
-- -- 	Gets both values in one column using string concatenation
-- FROM customer

-- SELECT left(lower(first_name),1) || lower(last_name) || '@gmail.com'
-- AS custom_email
-- FROM customer

-- SELECT title, rental_rate
-- FROM film
-- WHERE rental_rate >
-- (SELECT AVG(rental_rate) FROM film)
-- -- 	Select avg is runed first

-- SELECT film_id, title
-- FROM film
-- WHERE film_id IN
-- (SELECT inventory.film_id
-- FROM rental
-- INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
-- WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
-- -- 	This subquery returns multiple results (film_id)

-- SELECT first_name, last_name
-- FROM customer AS c
-- WHERE NOT EXISTS
-- (SELECT * FROM payment as p 
--  WHERE p.customer_id = c.customer_id
-- AND amount >11)

---- SELF JOIN ----
-- SELECT f1.title, f2.title, F1.length length
-- FROM film AS f1
-- INNER JOIN film AS f2 ON 
-- f1.film_id != f2.film_id 
-- AND f1.length = f2.length

-- SELECT customer_id,
-- CASE
-- 	WHEN (customer_id <= 100) THEN 'Premium'
-- 	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
-- 	ELSE 'Normal'
-- END AS customer_class
-- FROM customer

-- SELECT customer_id,
-- CASE customer_id
-- 	WHEN 2 THEN 'Winer'
-- 	WHEN 5 THEN 'Second Place'
-- 	ELSE 'Normal'
-- END AS raffle_results
-- FROM customer

-- SELECT
-- -- SELECT rental_rate,
-- -- Shows another column
-- CASE  rental_rate
-- 	WHEN 0.99 THEN 1
-- 	ELSE 0
-- END
-- FROM film

-- SELECT
-- SUM(CASE rental_rate
-- 	WHEN 0.99 THEN 1
-- 	ELSE 0
-- END) AS bargains,
-- SUM(CASE rental_rate
--    WHEN 2.99 THEN 1
--    ELSE 0
-- END) AS regular,
-- SUM(CASE rental_rate
--    WHEN 4.99 THEN 1
--    ELSE 0
-- END) AS premium
-- -- Counts the number of bargains, regular and premium dvd's
-- FROM film

-- SELECT CAST('5' AS INTEGER)

-- SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental

-- SELECT CHAR_LENGTH(inventory_id) FROM rental
-- Brings error so CAST have to be used (previous query)

-- CREATE TABLE depts(
-- -- For departments
-- first_name VARCHAR(50),
-- department VARCHAR(50)
-- )

-- INSERT INTO depts(
-- 	first_name,
-- 	department
-- )
-- VALUES
-- ('Vinton', 'A'),
-- ('Lauren', 'A'),
-- ('Claire', 'B');

-- SELECT (
-- SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
-- -- Counts how many people are in the apartment
-- SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
-- -- Dividing results in department ratio
-- ) AS department_ratio
-- FROM depts

-- DELETE FROM depts
-- WHERE department = 'B'
-- -- Let's pretend that Claire left her apartment

-- SELECT (
-- SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
-- -- Counts how many people are in the apartment
-- 	NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END), 0)
-- 	-- In case 0 people in department B then return Null
-- -- 	else return the number
-- ) AS department_ratio
-- FROM depts

-- SELECT * FROM customer
-- -- address_id correspodends to address table

-- SELECT
-- 	first_name,
-- 	last_name,
-- 	address
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id
-- -- This is already kind of sophisticated query so
-- -- instead of this query we can create a view to access
-- -- this data more easily

-- CREATE VIEW customer_info AS
-- SELECT
-- 	first_name,
-- 	last_name,
-- 	address
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id

-- SELECT * FROM customer_info
-- -- Returns the same input as the long, sophisticated query

-- CREATE OR REPLACE VIEW customer_info AS 
-- SELECT
-- 	first_name,
-- 	last_name,
-- 	address,
-- 	district
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id
-- Modifies view

-- DROP VIEW IF EXISTS customer_info
-- -- Removes the view

-- ALTER VIEW customer_info RENAME TO c_info
-- -- Renames view

-- SELECT * FROM c_info

-- Docs about compatible file types:
-- https://www.postgresql.org/docs/12/sql-copy.html

-- Import doesn't create table! PostgreSQL thinks that table already exists



