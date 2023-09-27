create database Covid_Analysis;

use covid_analysis;

select * from cases_countrywise;

select count(country_region)from cases_countrywise where who_Region = "Europe";

select sum(confirmed_cases) from cases_countrywise where who_region = "Europe";

select distinct who_region from cases_countrywise;

select count(country_region) from cases_countrywise;

select * from cases_countrywise where confirmed_cases > 1000000;

alter table cases_countrywise drop column 1_week_increase;
select * from cases_countrywise;

select *,concat(deaths_per_100_cases,"","%") as Death_Percentage from cases_countrywise;

select group_concat(country_region) from cases_countrywise; 

select distinct group_concat(who_region) from cases_countrywise;

select * from cases_countrywise where country_region is null;

alter table cases_countrywise
drop column 1_week_increase;

select distinct who_region from cases_countrywise;
select sum(Deaths) from cases_countrywise where who_region = "south-east Asia";

select * from cases_countrywise where who_region = "south-east asia";

select * from cases_countrywise;
select * from cases_countrywise where country_region = "india";

select * from cases_countrywise where recovered_per_100_cases > 90;

delimiter //
create procedure Region_wise(who_region text)
begin
select * from cases_countrywise cs
where cs.who_region = who_region;
end //
delimiter ;

call region_wise("africa");

drop procedure region_wise;


-- CREATE PROCEDURE customer_info(country varchar(45))
-- BEGIN

-- SELECT * FROM customer c
-- JOIN address ad
-- ON c.address_id = ad.address_id
-- JOIN city ci
-- ON ad.city_id = ci.city_id
-- JOIN country co 
-- ON co.country_id = ci.country_id
-- WHERE co.country = country;
-- END //
-- delimiter ;



select * from cases_countrywise where country_region like "%i";


select * from cases_countrywise where country_region like "%r";



select * from cases_countrywise;

alter table cases_countrywise modify column recovered_per_100_cases varchar(20);

update cases_countrywise set recovered_per_100_cases = concat(recovered_per_100_cases, "%");


alter table cases_countrywise modify column deaths_per_100_cases varchar(20);

update cases_countrywise set deaths_per_100_cases = concat(deaths_per_100_cases,"%");


select * from cases_countrywise;



select * from cases_countrywise;

select min(active_cases) from Covid_Cases;

alter table cases_countrywise rename to Covid_Cases;

select * from Covid_Cases where confirmed_cases> 1000000;

select * from Covid_Cases where confirmed_cases >= 300000 and confirmed_cases < 1000000 ;

select * from Covid_Cases where confirmed_cases >= 50000 and confirmed_cases < 300000 ;

select * from Covid_Cases where confirmed_cases >= 30000 and confirmed_cases < 1000000 ;


select * from Covid_Cases where confirmed_cases <= 20000;

select *, 
case 
when confirmed_cases <= 20000 then "Low"
when confirmed_cases <= 100000 then "Medium"
when confirmed_cases <= 500000 then "High"
else "Very high" 
end as Scale
from covid_cases;



 select * from covid_cases;
 

delimiter //
create procedure  Region(who_region text)
begin
select * from covid_cases c
where c.who_region = who_region;
end //
delimiter ;

drop procedure region;

call Region("Eastern Mediterranean");

select * from covid_cases;

update covid_cases set who_region = "Americas" where country_region = "argentina";

select * from covid_cases where country_region = "argentina";

create view Europe_region as 
select * from covid_cases where who_region = "Europe";

create view African_region as 
select * from covid_cases where who_region = "africa";

create view Eastern_Mediterranean_region as 
select * from covid_cases where who_region = "Eastern Mediterranean";

create view American_region as 
select * from covid_cases where who_region = "Americas";

create view Western_Pacific_region as 
select * from covid_cases where who_region = "Western Pacific";

create view South_East_Asian_region as 
select * from covid_cases where who_region = "South-East Asia";

drop view european_countries;

drop view Western_Pacific_region;
select * from european_countries;

select*from covid_cases;


select who_region,sum(deaths) from covid_cases
group by who_region
having sum(deaths)> 20000;

select count(country_region) from covid_cases;


delimiter //
create procedure region_very_high_cases(who_region text)
begin
select * from covid_cases c
where confirmed_cases >= 500000 and c.who_region = who_region;
end //
delimiter ;

call region_very_high_cases("Europe");


select distinct who_region from covid_cases;

drop procedure region_very_high_cases;

drop procedure region;

