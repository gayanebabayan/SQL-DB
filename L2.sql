-- Q1: TASK --
/*
Display the employee_id, last name and salary of employees earning in the range of
$9,000 to $11,000. Sort the output by top salaries first and then by last name. 
*/
--Q1: SOLUTION --

select employee_id, last_name, to_char(salary, '$999,999.99') as salary 
from employees
where salary between 9000 and 11000
order by salary desc, last_name;



--Q2: TASK --
/*
Modify previous query (#1) so that additional condition is to display only if they work as
Programmers or Sales Representatives. Use same sorting as before
*/
--Q2: SOLUTION --
select employee_id, last_name, to_char(salary, '$999,999.99') as salary
from employees
where salary between 9000 and 11000 
and job_id IN ('SA_REP', 'IT_PROG')
order by salary desc, last_name;



--Q3: TASK --
/*
The Human Resources department wants to find high salary and low salary employees.
Modify previous query (#2) so that it displays the same job titles but for people who
earn outside the given salary range from question 1. Use same sorting as before. 
*/
--Q3: SOLUTION --
select employee_id, last_name, to_char(salary, '$999,999.99') as salary
from employees
where salary < 9000 or salary > 11000 
and job_id IN ('SA_REP', 'IT_PROG')
order by salary desc, last_name;



--Q4: TASK --
/*
The company needs a list of long term employees, in order to give them a thank you
dinner. Display the last name, job_id and salary of employees hired before 1998. List the
most recently hired employees first. 
*/
--Q4: SOLUTION --
select last_name, job_id, to_char(salary, '$999,999.99') as salary, to_char(hire_date, 'YYYY-MM-DD')as hire_date
from employees
where hire_date < '01-Jan-98'
order by hire_date desc;



--Q5: TASK --
/*
Modify previous query (#4) so that it displays only employees earning more than
$10,000. List the output by job title alphabetically and then by highest paid employees.
*/
--Q5: SOLUTION --
select last_name, job_id, to_char(salary, '$999,999.99') as salary, to_char(hire_date, 'YYYY-MM-DD')as hire_date
from employees
where hire_date < '01-Jan-98'
  and salary > 10000
order by hire_date desc, 
         job_id, 
         salary desc;



--Q6: TASK --
/*
Display the job titles and full names of employees whose first name contains an ‘e’ or ‘E’
anywhere. The output should look like: (BONUS MARK FOR NOT using the OR keyword
in the solution but obtaining the same results)
*/
--Q6: SOLUTION --
select job_id, first_name || ' ' || last_name as name
from employees
where lower(first_name) like '%e%';



--Q7: TASK --
/*
Create a report to display last name, salary, and commission percent for all employees
that earn a commission. 
*/
--Q7: SOLUTION --
select last_name, to_char(salary, '$999,999.99') as salary, commission_pct
from employees
where commission_pct is not null;



--Q8: TASK --
/*
Do the same as question 7, but put the report in order of descending salaries. 
*/
--Q8: SOLUTION --
select last_name, to_char(salary, '$999,999.99') as salary, commission_pct
from employees
where commission_pct is not null
order by salary desc;



--Q9: TASK --
/*
Do the same as 8, but use a numeric value instead of a column name to do the sorting. 
*/
--Q9: SOLUTION --
select last_name, to_char(salary, '$999,999.99') as salary, commission_pct
from employees
where commission_pct is not null
order by 2 desc;


   
