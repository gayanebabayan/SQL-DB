-- ***********************
-- Name: Gayane Babayan
-- ID: 107-061-160
-- Date: 27-Sept-2018
-- Purpose: Lab 3 DBS301
-- *********************** 

/* Q1:
Write a query to display the tomorrow’s date in the following format:
 September 28th of year 2016
Your result will depend on the day when you RUN/EXECUTE this query. Label the
column Tomorrow.
*/
/* Q1: Answer */
select TO_CHAR(SYSDATE+1, 'Month fmddth" of year "YYYY')
from DUAL;


/* Q2:
For each employee in departments 20, 50 and 60 display last name, first name, salary,
and salary increased by 5% and expressed as a whole number. Label the column Good
Salary.
Also add a column that subtracts the old salary from the new salary and multiplies by
12. Label the column "Annual Pay Increase". 
*/
/* Q2: Answer */
select last_name, first_name, to_char(salary, '$999,999.99') as salary, 
       to_char((salary +(salary * 0.05)), '$999,999.99') AS "Good Salary",
       to_char((((salary +(salary * 0.05)) - salary)*12), '$999,999.99') AS "Annual Pay Increase"
from employees
where department_id in (20, 50, 60);


/* Q3:
Write a query that displays the employee’s Full Name and Job Title in the following
format:
 DAVIES, CURTIS is ST_CLERK
Only employees whose last name ends with S and first name starts with C or K. Give this
column an appropriate label like Person and Job. Sort the result by the employees’ last
names. 
*/
/* Q3: Answer */

select UPPER(first_name)  ||  ', ' || UPPER(last_name) || ' is ' || job_id as "Person and Job"
from employees
where UPPER(SUBSTR(last_name, -1, 1)) = 'S'
and   UPPER(SUBSTR(first_name, 1, 1)) = 'C'
or   UPPER(SUBSTR(first_name, 1, 1)) = 'K'
order by last_name;


/* Q4:
For each employee hired before 1992, display the employee’s last name, hire date and
calculate the number of YEARS between TODAY and the date the employee was hired.
a. Label the column Years worked. 
b. Order your results by the number of years employed. Round the number of
years employed up to the closest whole number.  
*/
/* Q4: Answer */
SELECT  last_name, round((sysdate-hire_date)/365) "Years worked"
FROM    employees
where hire_date < '01-Jan-92'
order by 2;


/* Q5:
Create a query that displays the city names, country codes and state province names,
but only for those cities that starts with S and has at least 8 characters in their name. If
city does not have a province name assigned, then put Unknown Province. Be cautious
of case sensitivity!  
*/
/* Q5: Answer */
select city, country_id, NVL(state_province,'Unknown Province')
from locations
where UPPER(SUBSTR(city, 1, 1)) = 'S'
and length(city) >= 8;


/* Q6:
Display each employee’s last name, hire date, and salary review date, which is the first
Thursday after a year of service, but only for those hired after 1997.
a. Label the column REVIEW DAY.
b. Format the dates to appear in the format like:
 THURSDAY, August the Thirty-First of year 1998
c. Sort by review date 
*/
/* Q6: Answer */
select last_name, hire_date, 
       To_char(NEXT_DAY(hire_date +365,'THURSDAY'), 'DAY, Month "the" fmDdspth "of year" YYYY' ) AS "REVIEW DAY"
from employees
where hire_date > '01-Jan-97'
order by NEXT_DAY(hire_date +365,'THURSDAY');




