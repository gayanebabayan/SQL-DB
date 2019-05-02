-- Question #1 --
/*
Display the difference between the Average pay and lowest pay in the company. Name
this result Real Amount. Format the output as currency with 2 decimal places. 
*/
-- Q1 SOLUTION --
select round((avg(salary) - min(salary)), 2) as "Real Amount"
from employees;

-- Question #2 --
/*
Display the department number and Highest, Lowest and Average pay per each
department. Name these results High, Low and Avg. Sort the output so that the
department with highest average salary is shown first. Format the output as currency
where appropriate.
*/
-- Q2 SOLUTION --
select department_id, to_char(max(salary), '$999,999.99') as "High", 
        to_char(min(salary), '$999,999.99') as "Low", 
        to_char(round(avg(salary), 2), '$999,999.99') as "Avg"
from employees
where department_id is not null
group by department_id
order by 4 desc;

-- Question #3 --
/*
Display how many people work the same job in the same department. Name these
results Dept#, Job and How Many. Include only jobs that involve more than one person.
Sort the output so that jobs with the most people involved are shown first. 
*/
-- Q3 SOLUTION --
select department_id as "Dep#", job_id as "Job", count(job_id) as "How Many"
from employees
where department_id is not null
group by department_id, job_id
having count(job_id) > 1
order by 3 desc;

-- Question #4 --
/*
For each job title display the job title and total amount paid each month for this type of
the job. Exclude titles AD_PRES and AD_VP and also include only jobs that require more
than $12,000. Sort the output so that top paid jobs are shown first.
*/
-- Q4 SOLUTION --
select job_id, to_char(sum(salary), '$999,999.99') 
from employees
where salary > 12000
group by job_id 
having job_id not in ('AD_PRES', 'AD_VP')
order by 1;

-- Question #5 --
/*
For each manager number display how many persons he / she supervises. Exclude
managers with numbers 100, 101 and 102 and also include only those managers that
supervise more than 2 persons. Sort the output so that manager numbers with the
most supervised persons are shown first. 
*/
-- Q5 SOLUTION --
select manager_id, count(employee_id)
from employees
where manager_id is not null
group by manager_id
having manager_id not in (100, 101, 102)
and count(employee_id) > 2
order by 2 desc;


-- Question #6 --
/*
. For each department show the latest and earliest hire date, BUT
- exclude departments 10 and 20
- exclude those departments where the last person was hired in this century.
- Sort the output so that the most recent, meaning latest hire dates, are shown first.
*/
-- Q6 SOLUTION --
select department_id, min(hire_date) as "Earliest", max(hire_date) as "Latest"
from employees
where department_id is not null
and hire_date < '01-Jan-00'
group by department_id
having department_id not in (10, 20)
order by 3 desc;















