use company;

select * from job_history;


use mavenmovies;


-- create view


select first_name,count(first_name) from actor
group by first_name
having count(first_name) > 1;


desc actor;

use company3;

alter table employees
rename column joining_date to HIRE_DATE;

alter table countries
rename column name to COUNTRY_NAME;

alter table departments
rename column ID to DEPARTMENT_ID;


create table countries2 as (select country_id,country_name from countries);

select * from countries2;

drop table countries2;

alter table countries2 rename countries;

select * from countries;

desc countries;


	-- REGION_ID	decimal(10,0)	YES		
	

alter table countries
modify region_id decimal(10,0);


delimiter //

CREATE PROCEDURE customer_info(country varchar(45))
BEGIN

SELECT * FROM customer c
JOIN address ad
ON c.address_id = ad.address_id
JOIN city ci
ON ad.city_id = ci.city_id
JOIN country co 
ON co.country_id = ci.country_id
WHERE co.country = country;
END //
delimiter ;

CALL customer_info("japan");

DROP PROCEDURE CUSTOMER_INFO;


with cte as
(select * from country where country = "Brazil")
SELECT * FROM customer c
JOIN address ad
ON c.address_id = ad.address_id
JOIN city ci
ON ad.city_id = ci.city_id
join cte on cte.country_id = ci.country_id;


create view  actor_info as
select a.actor_id, concat(a.first_name," ",a.last_name) as actor_name,aw.awards,f.title,c.name from actor a
join actor_award aw on a.actor_id = aw.actor_id
join film_actor fa on fa.actor_id = a.actor_id
join film f on f.film_id = fa.film_id
join film_category fc 
on fc.film_id = f.film_id
join category c
on c.category_id = fc.category_id;



select * from actor_info;


use company1;

select * from bonus;

alter table bonus
add hourly_pay decimal(10,2);

select * from bonus;

update bonus
set hourly_pay = 8000 where emp_id = 3;

alter table bonus
add holi_bonus decimal(10,2);

update bonus
set holi_bonus = hourly_pay * 1040;

drop trigger before_hourly_pay_update;
create trigger before_hourly_pay_update
before update on bonus
for each row
set new.holi_bonus = new.hourly_pay * 2080;


select * from bonus;
use company1;

update bonus
set hourly_pay = 120
where emp_id = 4;


create trigger before_hourly_pay_insert
before insert on bonus
for each row
set new.holi_bonus = horuly_pay * 2080;
  
  
insert into bonus values (5,200,0); 

select * from bonus;

alter table bonus 
modify column hourly_pay int;

use company3;

select * from employees;

create trigger before_hourly_pay_insert
before insert on employees
for each row
set new.salary = employee_id * 2080;




use mavenmovies;
create database apple;
use apple;

create table apple_info(emp_id int primary key,name varchar(20) not null,age int not null,work_exp int not null);

desc apple_info;

insert into apple_info values(1,"steve jobs",25,2),
							 (2,"jobs steve",25,2),
                             (3,"steve does the job",25,2),
                             (4,"steve left the job",25,2);

select * from apple_info;

drop database apple;     

use mavenmovies;

select * from actor where first_name like "%e%" and length(last_name) > 2;

use covid_analysis;

desc covid_cases;


select * from covid_cases;


select * from covid_cases where country_region like "a%";


create view europe_info as
select country_region as Country, Confirmed_cases as Total_cases,Deaths,Recovered,Active_cases as Active from covid_cases where
 who_region = "europe" and confirmed_cases > 15000;
 
 
 select * from covid_cases;
 
 drop view europe_info;
 
 
alter table covid_cases
rename column recovered_per_100_cases to Recovery_Rate;
                        
select count(who_region),who_region from covid_cases
group by who_region;

use mavenmovies;
select * from country;

with cte as
(select * from country where country ="Argentina")
select * from customer c
join address ad
using(address_id)
join city ci
using(city_id)
join cte 
using(country_id);


delimiter //

create procedure countrywise(country varchar(45))
begin
select * from customer c
join address ad
using(address_id)
join city ci 
using(city_id)
join country co
using(country_id)
where co.country = country;

end //
delimiter ; 


call countrywise("argentina");
               
drop procedure countrywise;               
               
delimiter //

CREATE PROCEDURE customer_info(country varchar(45))
BEGIN

SELECT * FROM customer c
JOIN address ad
ON c.address_id = ad.address_id
JOIN city ci
ON ad.city_id = ci.city_id
JOIN country co 
ON co.country_id = ci.country_id
WHERE co.country = country;
END //
delimiter ;




                        
                             













