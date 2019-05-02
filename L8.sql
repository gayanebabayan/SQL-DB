-- Name:    Gayane Babayan
-- ID:      107-061-160
-- Lab:     Lab-8
--Date:     8-Nov-2018

set autocommit off;

--Q1
/*
Create an INSERT statement to add the first row of data to the SALESREP table from the 
above sample data. Insert NULL value for the userid column. Include the columns’ name 
in the INSERT clause. Do not enter all rows yet. 
*/
--Q1: answer
INSERT INTO SALESREP (salesrep_id, last_name, first_name, userid, salary, ofiice_number, office_location) 
VALUES (100, 'Patel', 'Ralph', NULL, 2000, 4166667777, 'Toronto');


--Q2
/*
Populate the SALESREP table with the rest of the rows of sample data from the 
preceding list. Insert NULL value for the userid column. (Write a single INSERT 
statement) 
*/
--Q2: answer
INSERT ALL
INTO SALESREP VALUES (101, 'Denis', 'Betty', null, 1500, 9053334433, 'Montreal') 
INTO SALESREP VALUES (102, 'Biri', 'Ben', null, 1550, 2891118811, 'Vaughan') 
INTO SALESREP VALUES (103, 'Newman', 'Chad', null, 1850, 4164442299, 'Markham') 
INTO SALESREP VALUES (104, 'Ropeburn', 'Audrey', null, 2200, 2896667744, 'Newmarket')
SELECT 1 from dual;


--Q3
/*
Create a report that show all the inserted rows and columns from the SALESREP table. 
How many rows are selected? 
*/
--Q3: answer 
-- IN TOTAL 5 ROWS ARE SELECTED

SELECT *
FROM SALESREP;


--Q4
/*
Execute the rollback command. Display all rows and columns from the SALESREP table. 
How many rows are selected? 
*/
--Q4: answer
-- NO ROWS EXIST, IT'S 0 
ROLLBACK;

SELECT *
FROM SALESREP;

--Q5
/*
Do Task 1 and Task 2 again. Make you additions permanent to the table. Display all rows 
and columns from the SALESREP table. How many rows are selected? 
*/
--Q5: answer
-- IN TOTAL 5 ROWS ARE SELECTED 

INSERT INTO SALESREP (salesrep_id, last_name, first_name, userid, salary, ofiice_number, office_location) 
VALUES (100, 'Patel', 'Ralph', NULL, 2000, 4166667777, 'Toronto');

INSERT ALL
INTO SALESREP VALUES (101, 'Denis', 'Betty', null, 1500, 9053334433, 'Montreal') 
INTO SALESREP VALUES (102, 'Biri', 'Ben', null, 1550, 2891118811, 'Vaughan') 
INTO SALESREP VALUES (103, 'Newman', 'Chad', null, 1850, 4164442299, 'Markham') 
INTO SALESREP VALUES (104, 'Ropeburn', 'Audrey', null, 2200, 2896667744, 'Newmarket')
SELECT 1 from dual

COMMIT;

SELECT *
FROM SALESREP;


--Q6
/*
Execute the rollback command. 
a.
Display all rows and columns from the SALESREP table. How many rows are selected? 
b.
Did the rollback command effective? 
c.
What was the difference between the result of the rollback execution from 
Task 4 and the result of the rollback execution of this task? 
*/
--Q6: answer
ROLLBACK;

--A
-- 5 ROWS
SELECT *
FROM SALESREP;

-- B
-- NO, BECAUSE COMMIT MAKES OUR CHANGES PERMANENT

--C 

-- IN TASK4 WE COULD CANCEL OUR PREVIOUS ACTION, WHICH WAS INSERT STATEMENT, BECAUSE WE DIDN'T
-- MAKE ANY CHANGE PERMANENT, BUT IN THIS TASK, BECAUSE WE HAVE COMMIT, WHICH MAKES 
-- CHANGES PERMANENT, WE CAN'T ROLLBACK. 


--Q7
/*
Create an INSERT statement to add rows to the SALESREP table for employees in the 
employees table who work in sales department. Insert NULL value for the user ID and 
office number columns. They office location value can be found for each employee from 
other tables in the database. 
*/
--Q7: answer
INSERT INTO SALESREP (salesrep_id, last_name, first_name, userid, salary, ofiice_number, office_location)
SELECT  e.employee_id, 
        e.last_name, 
        e.first_name,
        NULL, 
        e.salary,
        NULL,
        l.city
from employees e
join departments d
on (e.department_id = d.department_id)
join locations l
on (d.location_id = l.location_id)
where e.job_id = 'SA_REP'


--Q8
/*
Make your insertion permanent. 
*/
--Q8: answer
COMMIT;


--Q9
/*
Write an update statement to update the value of column userid for all the rows in the 
SALESREP table. Concatenate the first letter of the first name and the first seven 
characters of the last name to produce the user ID.
*/
--Q9: answer
UPDATE SALESREP
SET userid = CONCAT (SUBSTR(first_name,1,1), SUBSTR(last_name,1,7));


--Q10
/*
Change the value of the office_number column to ‘unknown’ for sales representatives 
with null office numbers.  
*/
--Q10: answer
UPDATE SALESREP
SET ofiice_number = 'unknown'
WHERE ofiice_number is null


--Q11
/*
Make your changes permanent. 
*/
--Q11: answer
COMMIT;


--Q12
/*
Delete all sales representatives from the SALESREP table that their city is the same as 
the city of employees working in the department with department ID 80. 
a.
How many rows are deleted? 
b.
Create a report from the SALESREP table after deletion whose city is the 
same as the city of employees working in the department with department 
ID 80. How many rows are selected? 
c.
Execute the rollback command. Execute the same SQL statement from 12.b. 
How many rows are selected? 
*/
--Q12: answer
DELETE FROM SALESREP
WHERE OFFICE_LOCATION in (
                        SELECT  l.city
                        from employees e
                        join departments d
                        on (e.department_id = d.department_id)
                        join locations l
                        on (d.location_id = l.location_id)
                        where e.DEPARTMENT_ID = 80);
                        
                        
-- A
-- 35 rows has been deleted

--B
-- NO ROWS HAS BEEN SELECTED, 0 ROWS
DELETE FROM SALESREP
WHERE OFFICE_LOCATION in (
                        SELECT  l.city
                        from employees e
                        join departments d
                        on (e.department_id = d.department_id)
                        join locations l
                        on (d.location_id = l.location_id)
                        where e.DEPARTMENT_ID = 80;

--C
-- 35 ROWS HAS BEEN SELECTED

ROLLBACK;

SELECT * FROM SALESREP
WHERE OFFICE_LOCATION in (
                        SELECT  l.city
                        from employees e
                        join departments d
                        on (e.department_id = d.department_id)
                        join locations l
                        on (d.location_id = l.location_id)
                        where e.DEPARTMENT_ID = 80);























