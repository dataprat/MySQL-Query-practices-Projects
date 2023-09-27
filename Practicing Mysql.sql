CREATE DATABASE Mobile_store;
USE Mobile_store;

create table customer (customer_id int primary key auto_increment,first_name varchar (255),last_name varchar (255), email varchar (255),mobile_no varchar(255));

insert into customer values (1,"vikram","singh","vikramsingh@gmail.com","1234567890"),
							(23,"aditya","shrivastav","adityashrivastav@gmail.com","8437283745"),
                            (45,"ravikant","mishra","ravikantmishra@gmail.com","7372827465"),
                            (32,"sandeep","dubey","sandeepdubey@gmail.com","2728393746"),
                            (67,"aditya","pancholi","adityapancholi@gmail.com","6483747562"),
                            (876,"karan","virsingh","karanvirsingh@gmail.com","2837373392"),
                            (46,"abhinash","sharma","abhinashsharma@gmail.com","7593728473"),
                            (69,"vijay","salgavkar","vijaysalgavkar@gmail.com","3758908712"),
                            (8,"yogi","adityanath","yogiadityanath@gmail.com","9237400178"),
                            (34,"rachna","prasad","rachnaprasad@gmail.com","5647290194");
                            
                            
                            
create table payment (payment_id int primary key,customer_id int, amount float ,payment_date date,payment_type varchar(255),foreign key (customer_id) references customer(customer_id));                            

drop table payment;

insert into payment values (1,876,257.20,"2022-12-10","cash"),
                           (2,69, 300,"2022-11-09","card"),
                           (3,67, 400,"2022-10-09","card"),
                           (4,32,150,"2022-09-10","cash"),
                           (5,45,490.01,"2022-09-12","emi"),
                           (6,8,233,"2022-08-12","cash"),
                           (7,34,650.04,"2022-1-11","card"),
                           (8,46,290.20,"2022-7-10","cash"),
                           (9,23,200,"2022-8-12","cash"),
                           (10,1, 512.40,"2022-12-12","emi");
                           
create table mobile (mobile_id int ,mobile_type varchar (255),payment_id int,store_id int,foreign key (payment_id) references payment(payment_id), foreign key (store_id) references store(store_id));  



insert into mobile values (3,"android","3",1),
                          (3,"android","2",1),
                          (4,"iphone","5",1),
                          (3,"android","8",2),
                          (1,"keypad","1",2),
                          (3,"android","9",1),
                          (2,"blackberry","7",2),
                          (3,"android","6",1),
                          (4,"iphone","4",2),
                          (1,"keypad","10",2);
                          
                          
                          
create table store (store_id int primary key ); 


insert into store values (1),
						 (2);
                         
                         
                         
select c.customer_id,concat(first_name,' ',last_name) as customer,p.amount as payment,m.mobile_type,s.store_id from customer c
join payment p
on c.customer_id = p.customer_id
join mobile m 
on m.payment_id = p.payment_id
join store s
on s.store_id = m.store_id;

use mavenmovies;

select * from customer where customer_id = 10 and not customer_id = 20;

select * from customer where customer_id not in (1,2,3,4);

select * from customer where customer_id in(10,30,45,97);

use company3;

select * from employees order by salary desc;  

select * from employees order by salary desc limit 1 offset 2;

alter table employees
add area varchar(20);

select * from employees where salary is not null;

update employees set salary = null where employee_id = 105;

update employees
set last_name = "Queen" , job_id = "SA_REP" where employee_id = 100;

delete from employees where employee_id = 100;

select * from employees order by employee_id limit 3 offset 5 ;

select * from employees order by salary desc ;

select *,max(salary) from employees;

update employees
set salary = 25000 where employee_id = 101;

select sum(salary) from employees;


select * from employees where first_name like 'a%' and salary >= 12000;


select * from employees e
join departments d
on d.department_id = e.department_id
join locations l
on l.location_id = d.location_id
join countries c
on c.country_id = l.country_id
where not country_name = "united states of america";


select * from employees where employee_id > 120
having salary> avg(salary);

select * from locations l where exists
(select * from countries c  where l.country_id = c.country_id and not country_name = "united states of america" );


select * from employees;

select country_name from countries where country_id = any(select country_id from locations where city = "mexico city");


create trigger area_info
before update on employees
for each row
set new.area = upper(new.area);

create trigger area_info
before update on employees
for each row
set new.area = upper(new.area);
show triggers;
drop trigger area_info;






select * from employees;

alter table employees
add area varchar(20);

update employees
set area = "follow your dreams" ;


use company3;
show tables;
select * from employees;

create trigger country_copy
after delete on countries for each row
insert into country_info values("1",old.country_name);

alter table countries
drop column country_name;

select * from countries;



create table country_info (_id int ,country_name varchar(255));

select * from country_info;

drop table country_info;


create temporary table country_ig as select * from countries;

select * from country_ig;

select * from countries;

alter table countries
add country_name varchar(255);

insert into countries
select * from country_ig;

create table countries as select * from country_ig;

drop table countries;


use company3;

alter table countries
drop column locality ;


create table salaries_info (salary int primary key, last_updated timestamp );

select * from salaries_info;
DELIMITER $$  
  
CREATE TRIGGER after_delete_salary  
AFTER DELETE  
ON employees FOR EACH ROW  
BEGIN  
   insert into salaries_info(select salary from employees);  
END$$   
  
DELIMITER ; 

show triggers;

drop trigger after_delete_salary  ; 

select * from employees order by salary desc;

delete from employees where employee_id = 108;

use company3;


select max(salary) from employees where salary<(select max(salary) from employees);

select * from employees order by salary desc limit 1 offset 2;

select * from employees order by salary desc;

alter table employees
modify first_name varchar(30);

alter table employees
rename column first_name to FIRST_NAME;

select * from employees_copy;

create table employees as(select * from employees_copy);
update employees
set salary = salary + 1000;

select * from employees;
use company3;
drop table salaries_info;


select 17000*10/100;

select * from countries;
create trigger apple_info
after update on countries for each row
begin
if country_name= "Japan" 
then update countries set country_name = "Miyamoto Mushashi"  
end;

drop trigger apple_Info;

update countries
set country_name = "Argentina" where country_id = 'ar' ;

alter table countries
modify country_name varchar(200);

update countries 
join country_copy on countries.country_id = country_copy.country_id set countries.country_name = country_copy.country_name; 

use mavenmovies;
SELECT
    customer_id,
    CONCAT(UPPER(LEFT(first_name, 1)), LOWER(SUBSTRING(first_name, 2))) AS "name"
FROM
    customer
ORDER BY
    customer_id;
    
    
select * from customer;    





create table country_copy as select * from countries;

select * from country_copy;

drop table employee_info;
use company;

select * from employees e
join departments d
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
join countries c
on l.country_id = c.country_id
where country_name = "Brazil
";

select country_name from countries;


select * from locations;

update locations
     set city = (case when city = 'OX9 9ZB' then 'Munich'
                 end)
     where city in ('mumbai', 'pune');


# 2500	Magdalen Centre	 The Oxford 	OX9 9ZB	Oxford	Ox"
                 
select employee_id,first_name,country_name from employees e
join departments d
on e.department_id = d.department_id
join  locations l
on l.location_id = d.location_id
join countries c
on l.country_id = c.country_id
where c.country_id = "De";


select * from locations;

update locations
set country_id = "DE" where STATE_PROVINCE = "OXFORD";
use company;

select * from countries;

                         