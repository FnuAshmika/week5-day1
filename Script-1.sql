--1. How many actors are there with the last name ‘Wahlberg’?
SELECT count(*)
FROM actor 
WHERE last_name = 'Wahlberg';


--2. How many payments were made between $3.99 and $5.99?
SELECT count(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;


--3. What film does the store have the most of? (search in inventory)
SELECT film_id, count(*) 
FROM inventory
GROUP BY film_id 
ORDER BY count(*) DESC;  


--4. How many customers have the last name ‘William’?
SELECT count(*)
FROM customer
WHERE last_name = 'William';


--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, count(rental_id) 
FROM payment
GROUP BY staff_id  
ORDER BY count(rental_id) DESC; 
--OR 

SELECT staff_id, SUM(amount) 
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount) DESC;


--6. How many different district names are there?
SELECT DISTINCT (district)
FROM address
--OR

SELECT count(DISTINCT district)
FROM address

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, count(last_name)
FROM customer 
WHERE store_id = 1 AND last_name LIKE '%es'
GROUP BY store_id ;


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT amount, count(*)
FROM payment 
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING count(*) > 250;


--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
SELECT DISTINCT(rating)
FROM film;
--OR
SELECT count (DISTINCT rating)
FROM film;

SELECT COUNT(film_id), rating 
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;
