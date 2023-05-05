-- SELECT COUNT(amount) FROM payment
-- WHERE amount >5;

-- SELECT COUNT(*) FROM actor
-- WHERE first_name LIKE 'P%';

-- SELECT COUNT(DISTINCT(district))
-- FROM address;

-- SELECT DISTINCT(district)
-- FROM address;

-- SELECT COUNT(*) FROM film
-- WHERE rating = 'R'
-- AND replacement_cost BETWEEN 5 AND 15

-- SELECT COUNT(*) FROM film
-- WHERE title LIKE '%Truman%';

-- SELECT staff_id, COUNT(staff_id) FROM payment
-- GROUP BY staff_id
-- ORDER BY COUNT(staff_id) DESC
-- LIMIT 1

-- SELECT rating, ROUND(AVG(replacement_cost),2) FROM film
-- GROUP BY rating

-- SELECT customer_id, SUM(amount) FROM payment
-- GROUP BY customer_id
-- ORDER BY SUM(amount) DESC
-- LIMIT 5

-- SELECT customer_id, COUNT(*) FROM payment
-- GROUP BY customer_id
-- HAVING COUNT(*) >=40

-- SELECT staff_id, customer_id, SUM(amount)
-- FROM payment
-- WHERE staff_id = 2
-- GROUP BY customer_id, staff_id
-- HAVING SUM(amount) >100
-- ORDER BY SUM(amount) DESC

-- SELECT COUNT(*) FROM film
-- WHERE title LIKE 'J%'
 
-- SELECT * FROM customer
-- WHERE first_name LIKE 'E%'
-- AND address_id <500
-- ORDER BY customer_id DESC
-- LIMIT 1

-- SELECT customer.email, district FROM address
-- INNER JOIN customer
-- -- 	Works also with RIGHT JOIN
-- ON address.address_id = customer.address_id
-- WHERE address.district = 'California'

-- SELECT film.title FROM actor
-- INNER JOIN film_actor
-- -- 	Left join also works
-- ON actor.actor_id = film_actor.actor_id
-- INNER JOIN film
-- -- 	Left join also works
-- ON film.film_id = film_actor.film_id
-- WHERE first_name = 'Nick'
-- AND last_name = 'Wahlberg'

-- SELECT DISTINCT(TO_CHAR(payment_date, 'month')) FROM payment

-- SELECT COUNT(*) FROM payment
-- WHERE TO_CHAR(payment_date, 'DAY') = 'MONDAY   '

-- SELECT count(*)
-- FROM payment
-- WHERE EXTRACT(dow FROM payment_date) = 1

-- SELECT * FROM cd.facilities
-- WHERE membercost > 0
-- AND membercost < monthlymaintenance/50

-- SELECT * FROM cd.facilities
-- WHERE facid IN (1,5)

-- SELECT DISTINCT surname FROM cd.members
-- ORDER BY surname
-- LIMIT 10

-- SELECT facid, SUM(slots) AS "Total Slots" FROM cd.bookings
-- WHERE TO_CHAR(starttime, 'month') = 'september'
-- GROUP BY facid

-- SELECT facid, SUM(slots) FROM cd.bookings
-- GROUP BY facid
-- HAVING SUM(slots) > 1000
-- ORDER BY facid

-- SELECT starttime as start, name FROM cd.bookings
-- LEFT JOIN cd.facilities
-- ON cd.facilities.facid = cd.bookings.facid
-- WHERE TO_CHAR(starttime, 'YYYY-MM-DD') = '2012-09-21'
-- AND name LIKE 'Tennis Court%'
-- ORDER BY starttime

-- SELECT starttime FROM cd.bookings
-- WHERE memid = (
-- 	SELECT memid FROM cd.members
-- 	WHERE firstname = 'David'
-- 	AND surname = 'Farrell'
-- )

-- CREATE TABLE students(
-- 	student_id serial PRIMARY KEY,
-- 	first_name VARCHAR(45) NOT NULL,
-- 	last_name VARCHAR(45) NOT NULL, 
-- 	homeroom_number integer,
-- 	phone VARCHAR(20) UNIQUE NOT NULL,
-- 	email VARCHAR(115) UNIQUE,
-- 	grad_year integer
-- );

-- CREATE TABLE teachers(
-- 	teacher_id serial PRIMARY KEY,
-- 	first_name VARCHAR(45) NOT NULL,
-- 	last_name VARCHAR(45) NOT NULL, 
-- 	homeroom_number integer,
-- 	department VARCHAR(45),
-- 	email VARCHAR(20) UNIQUE,
-- 	phone VARCHAR(20) UNIQUE
-- );

-- INSERT INTO students(first_name, last_name, homeroom_number, phone, grad_year)
-- 	VALUES ('Mark', 'Watney', 5, '7755551234', 2035);

-- INSERT INTO teachers(first_name, last_name, homeroom_number, department, email,phone)
-- 	VALUES ('Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', '7755554321');

-- SELECT
-- SUM(CASE rating
-- 	WHEN 'R' THEN 1
-- 	ELSE 0
-- END) AS r,
-- SUM(CASE rating
-- 	WHEN 'PG' THEN 1
-- 	ELSE 0
-- END) AS pg,
-- SUM(CASE rating
-- 	WHEN 'PG-13' THEN 1
-- 	ELSE 0
-- END) AS pg
-- -- Counts the number of bargains, regular and premium dvd's
-- FROM film

