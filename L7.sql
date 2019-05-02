/* Q1:
The HR department needs a list of department IDs for departments that do not contain 
the job ID ST_CLERK. Use set operators to create this report. 
*/

/*Q1 - Answer*/
select a.department_id
from employees a
minus
select b.department_id
from employees b
where job_id = 'ST_CLERK' 
or department_id is null


/* Q2:
 The HR department needs a list of countries that have no departments located in them. 
Display the country ID and the name of the countries. Use set operators to create this 
report.  
*/
/*Q2 - Answer*/
select country_id, country_name 
from countries
minus
select c.country_id, c.country_name
from departments d join locations l
on (d.location_id = l.location_id)
join countries c
on (l.country_id = c.country_id)


/* Q3 
Produce a list of jobs for departments 10, 50, and 20, in that order. Display job ID and 
department ID using set operators.  (In your result, you will have first rows with 
Department ID 10 and then 50 and finally 20). 
*/

/*Q3 - Answer*/

(select a.job_id, a.department_id 
from employees a
minus
select b.job_id, b.department_id 
from employees b
where b.department_id not in (10,50)
or b.department_id is null)

union all

(select a.job_id, a.department_id 
from employees a
minus
select b.job_id, b.department_id 
from employees b
where b.department_id not in (20)
or b.department_id is null)


/* Q4
Create a report that lists the employee IDs and job IDs of those employees who 
currently have a job title that is the same as their job title when they were initially hired 
by the company (that is, they changed jobs but have now gone back to doing their 
original job). 
*/

/*Q4 - Answer*/
select employee_id, job_id
from employees
intersect
select h.employee_id, h.job_id
from job_history h


/* Q5 
Create following reports:  
a.
Department ID of all departments that have employees working in them. 
(Use set operators to find these departments) 
b.
Department ID of all departments that do not have employees assigned to 
them. (Use set operators to find these departments)
*/

/*Q5 - Answer*/
--a
select department_id
from departments
intersect
select department_id
from employees
where department_id is not null

-- b
select department_id
from departments
minus
select department_id
from employees
where department_id is not null


/* Q6 
The HR department needs a report with the following specifications: 
o Last name, department ID, and department’s name of all the employees 
from the EMPLOYEES table, regardless of whether or not they belong to a department  
o Department ID and department name of all the departments from the 
DEPARTMENTS table, regardless of whether or not they have employees working in them 
*/

/*Q6 - Answer*/
SELECT last_name, department_id, TO_CHAR (null) as "DEPARTMENT NAME"
FROM   employees 
UNION 
SELECT TO_CHAR (null), department_id, department_name
FROM   departments








