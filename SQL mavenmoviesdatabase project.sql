

# Q1 || Write an sql query to count the number of characters except the spaces for each actor. Return the first 10 actors name length along with their name. ||

select concat(first_name,' ',last_name) as actor,
length(concat(first_name,' ',last_name)) as name_length from actor limit 10;




# Q2 || List all the oscar awardees(actors who received oscar award)with their full names and length of their names. ||

select actor_id,concat(actor.first_name,' ',actor.last_name) as actor_fullname,
length(concat(actor.first_name,' ',actor.last_name) ) as length_name ,awards from actor
join actor_award
using (actor_id)
where awards = 'oscar';




# Q3 || Find the actors who have acted in the film 'Frost Head'. ||

select actor_id,concat(first_name,' ',last_name) as actor,title as film from actor
join film_actor
using (actor_id)
join film
using(film_id)
having title ='frost head';




# Q4 || Pull all the film acted by actor 'Will Wilson'. ||

select film_id,title as film,actor_id, concat(first_name,' ',last_name) as 'actor_name' from film
join film_actor
using(film_id)
join actor     
using(actor_id)
where first_name = 'will'; 






# Q5 || Pull all the films which were rented and return in the month of may. ||

select  film.film_id,film.title as film,customer.customer_id,concat(rental_date,'    ',return_date) as rented_and_return from film
join inventory 
using(film_id)
join rental
using (inventory_id)
join customer
using(customer_id)
where rental_date and return_date between '2005-05-01' and '2005-05-31'
group by title;





# Q6 || Pull all the films with 'Comedy' category. ||

select film_id, title as film, category.name as 'category' from film
join film_category
using(film_id)
join category
using (category_id)
having category.name ='comedy';















