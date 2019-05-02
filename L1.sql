--***************************************************************************************************************--
/*
--Q1: Which one of these tables appeared to be the widest? or longest?

a. SELECT * FROM EMPLOYEES;  	col: -12		row: -54
b. SELECT * FROM DEPARTMENTS; 	col: -5 		row: -8
c. SELECT * FROM JOB_HISTORY; 	col: - 6		row: -10
d. Which one of these tables appeared to be the widest? or longest? -> EMPLOYEES table is the longest and widest one.

--Q1: SOLUTION
EMPLOYEES table is the widest one
EMPLOYEES table is the longest one
*/



--***************************************************************************************************************--
/*
--Q2: Fix the following SELECT statement.

SELECT last_name “LName”, job_id “Job Title”, 
Hire Date “Job Start” 
FROM employees;
*/
--Q2: SOLUTION
SELECT last_name "LName", job_id "Job Title", Hire_Date "Job Start" 
FROM employees;



--***************************************************************************************************************--
/*
-- Q3: There are THREE coding errors in this statement. Can you identify them? 
SELECT employee_id, last name, commission_pct Emp Comm, 
FROM employees;
*/

--Q3: SOLUTION
SELECT employee_id, last_name, commission_pct "Emp Comm" 
FROM employees;



--***************************************************************************************************************--
-- Q4: What command would show the structure of the LOCATIONS table?

/*Name           Null?    Type         
-------------- -------- ------------ 
LOCATION_ID    NOT NULL NUMBER(4)    
STREET_ADDRESS          VARCHAR2(40) 
POSTAL_CODE             VARCHAR2(12) 
CITY           NOT NULL VARCHAR2(30) 
STATE_PROVINCE          VARCHAR2(25) 
COUNTRY_ID              CHAR(2)      
*/
--Q4: SOLUTION
DESCRIBE LOCATIONS;



--***************************************************************************************************************--
-- Q5:
/* 
Create a query to display the output shown below. 

City# 	City 		Province with Country Code
 --------------------------------------------------------------------------------- 
1000 	Roma 		IN THE IT
1100 	Venice 		IN THE IT
*/

SELECT location_id "City#", city "City", 'IN THE ' || country_id AS "Province with Country Code"  
FROM LOCATIONS
WHERE country_id = 'IT';




