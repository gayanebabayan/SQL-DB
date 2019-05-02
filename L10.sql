/*
-- Q-1

Create the EMPLOYEES2 table based on the structure of the EMPLOYEES table. Include only the 
EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, and DEPARTMENT_ID columns. Name the columns in 
your new table ID, FIRST_NAME, LAST_NAME, SALARY, and DEPT_ID, respectively. 

*/

-- Q1 - answer

CREATE TABLE EMPLOYEES2
        (id         NUMBER(4) NOT NULL,
        first_name  VARCHAR(25) NOT NULL,
        last_name   VARCHAR(25) NOT NULL,
        salary      NUMBER(8,2),
        dept_id     NUMBER(4)
        );

/*
-- Q-2
We want to employees inserted into EMPLOYEES2 table to meet following conditions: 
a.
The salary can not be less than 1,000 and greater than 30,000. Name it salary_cst_ck. 
b.
We cannot have employees with the same last name. Name it lname_cst_un. 

*/

-- Q2 - answer
--a
ALTER TABLE EMPLOYEES2
ADD CONSTRAINT salary_cst_ck CHECK(SALARY between 1000 and 30000);

--b
ALTER TABLE EMPLOYEES2
ADD CONSTRAINT lname_cst_un UNIQUE(last_name);


/*
-- Q-3

Add a new column EMAIL to the EMPLOYEES2 table. 

*/

-- Q3 - answer
ALTER TABLE EMPLOYEES2
ADD (email VARCHAR(40));


/*
-- Q-4
Drop the EMPLOYEES2 table.  
*/

-- Q4 - answer
DROP TABLE EMPLOYEES2;


/*
-- Q-5
Create a view named ALLEMPS that consists of all employees includes employee_id, last_name, salary, 
department_id, department_name, city and country (if applicable) 
*/

-- Q5 - answer
CREATE VIEW ALLEMPS AS (
                SELECT e.employee_id, e.last_name, e.salary, e.department_id, 
                d.department_name, l.city, l.country_id
                from employees e join departments d
                on (e.department_id = d.department_id)
                join locations l
                on (d.location_id = l.location_id)
);

/*
-- Q-6
Use the ALLEMPS view to: 
a.
Display the employee_id, last_name, salary and city for all employees 
b.
Display the total salary of all employees by city
c.
Increase the salary of the lowest paid employee(s)
in each department by 100 
d.
What happens if you try to insert an employee by providing 
values for all columns in this view? 
e.
Delete the employee named Vargas. Did it work? Show proof

*/

-- Q6 - answer
--a
SELECT employee_id, last_name, salary, city
FROM ALLEMPS;

--b
SELECT SUM(SALARY) AS SALARY, CITY
FROM ALLEMPS
GROUP BY CITY;

--c
UPDATE ALLEMPS
SET SALARY = (SALARY + 100)
WHERE SALARY IN (
                SELECT MIN(SALARY)
                FROM ALLEMPS
                GROUP BY DEPARTMENT_ID
);

--d

-- In this case, we can't insert any values, as it is combination
-- of 3 tables and insert statement doesn't work in this particular case


--e
select * FROM ALLEMPS
where last_name = 'Vargas';

-- YES, 
-- as a proof, I got a message: "1 row deleted"


/*
-- Q-7
Create a view named ALLDEPTS that consists of all departments and includes department_id, 
department_name, city and country (if applicable) 
*/

-- Q7 - answer
CREATE VIEW ALLDEPTS AS (
                    SELECT d.department_id, d.department_name, l.city, l.country_id
                    FROM  departments d JOIN locations l
                    ON (d.location_id = l.location_id)
);


/*
-- Q-8
Use the ALLDEPTS view to: 
a.
For all departments display the department_id, name and city 
b.
For each city that has departments located in it display the number of departments by city 

*/

-- Q8 - answer

-- a
SELECT department_id, department_name, city
FROM ALLDEPTS;


--b
SELECT COUNT (department_id), city
FROM ALLDEPTS
GROUP BY city;


/*
-- Q-9
Delete the ALLDEPTS view.

*/

-- Q9 - answer
DROP VIEW ALLDEPTS;



















