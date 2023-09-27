USE client_data;

SELECT * FROM customer_data;

#1 || Group the customers based on their income type and find the average of their annual income ||

SELECT UPPER(income_source) AS INCOME_SOURCE, COUNT(id)  AS CUSTOMERS,CONCAT("₹ ",AVG(annual_income)) AS AVERAGE_ANNUAL_INCOME
FROM customer_data
GROUP BY INCOME_SOURCE;


#2 || Find the female owners of cars and property. ||

SELECT * FROM customer_data WHERE gender = "F" AND car_owner = "Y" AND property_owner = "Y";


#3 || Find the male customers who are staying with their families. ||

SELECT * FROM customer_data WHERE house_type = "with parents" AND gender = "M";


#4 || Please list the top five people having the highest income. ||

SELECT * FROM customer_data ORDER BY annual_income DESC LIMIT 5;

#5 || How many married people are having bad credit? ||

SELECT UPPER(martial_status) AS MARTIAL_STATUS,COUNT(id) AS CUSTOMERS FROM customer_data 
WHERE martial_status = "civil marriage" OR martial_status = "Married" 
AND application = 1
GROUP BY martial_status;


#6 || What is the highest education level and what is the total count? ||

SELECT COUNT(id) AS CUSTOMERS,UPPER(education_level) AS EDUCATION_LEVEL FROM customer_data GROUP BY education_level;


#7 || Between married males and females, who is having more bad credit? || 

SELECT COUNT(id) AS CUSTOMERS,GENDER FROM customer_data WHERE martial_status = "civil marriage" OR martial_status = "married"
AND application = 1
GROUP BY gender;




