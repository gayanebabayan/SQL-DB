--// Subject:     DBS 301
--// Lab:         Lab-6
--// Student:     Gayane Babayan
--// ID:          107-061-160
--// Date:        19-Oct-2018
-----------------------------------------------------------------------------------------------------
-- Q1
/*
SET AUTOCOMMIT ON (do this each time you log on) so
 any updates, deletes and inserts 
are automatically committed before you exit from Or
acle. 
*/
-- Q1:  Answer
SET AUTOCOMMIT ON;

-----------------------------------------------------------------------------------------------------
-- Q2
/*
Create an INSERT statement to do this.  Add yourself as an employee with a NULL salary, 
0.2 commission_pct, in department 90, and Manager 100.  You started TODAY.   

*/
-- Q2:  Answer
INSERT INTO EMPLOYEES
   VALUES(55,'GAYANE','BABAYAN','SOME EMAIL',NULL,SYSDATE,'IT_PROG',NULL,0.2,100,90);

-----------------------------------------------------------------------------------------------------
-- Q3
/*
Create an Update statement to: Change the salary of  the employees with a last name of 
Matos and Whalen to be 2500. 
*/
-- Q3:  Answer
UPDATE EMPLOYEES
    SET SALARY=2500
    WHERE UPPER(last_name)='MATOS' OR UPPER(last_name)='WHALEN';

-----------------------------------------------------------------------------------------------------
-- Q4
/*
Display the last names of all employees who are in the same department as the 
employee named Abel. 
*/
-- Q4:  Answer
SELECT LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (
                        SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE UPPER(LAST_NAME) = 'ABEL' )

-----------------------------------------------------------------------------------------------------
-- Q5
/*
Display the last name of the lowest paid employee(s) 
*/
-- Q5:  Answer
SELECT LAST_NAME
FROM EMPLOYEES
WHERE SALARY > (
                SELECT MIN(SALARY)
                FROM EMPLOYEES)

-----------------------------------------------------------------------------------------------------
-- Q6
/*
Display the city that the lowest paid employee(s) are located in. 
*/
-- Q6:  Answer
SELECT L.CITY
FROM LOCATIONS L
JOIN DEPARTMENTS D
    ON (L.LOCATION_ID = D.LOCATION_ID)
JOIN EMPLOYEES E
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE E.SALARY = (
                    SELECT MIN(E.SALARY)
                    FROM EMPLOYEES E)

-----------------------------------------------------------------------------------------------------
-- Q7
/*
Display the last name, department_id, and salary of the lowest paid employee(s) in each 
department.  Sort by Department_ID. (HINT: careful with department 60) 
*/
-- Q7:  Answer
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY IN (
                        SELECT MIN(SALARY)
                        FROM EMPLOYEES
                        WHERE DEPARTMENT_ID IS NOT NULL
                        GROUP BY DEPARTMENT_ID)
                        AND DEPARTMENT_ID IS NOT NULL

-----------------------------------------------------------------------------------------------------
-- Q8
/*
Display the last name of the lowest paid employee(s) in each cit
*/
-- Q8:  Answer
SELECT E.LAST_NAME, L.CITY, E.SALARY
FROM EMPLOYEES E
JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
JOIN LOCATIONS L
    ON (D.LOCATION_ID = L.LOCATION_ID)
WHERE SALARY IN (
                SELECT MIN(E.SALARY)
                FROM EMPLOYEES E
                JOIN DEPARTMENTS D
                    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
                JOIN LOCATIONS L
                    ON (D.LOCATION_ID = L.LOCATION_ID)
                GROUP BY L.CITY)

-----------------------------------------------------------------------------------------------------
-- Q9
/*
Display last name and salary for all employees who earn less than the lowest salary in 
ANY department.  Sort the output by top salaries first and then by last name. 
*/
-- Q9:  Answer
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < ANY (
                    SELECT MIN(SALARY)
                    FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID
                    HAVING DEPARTMENT_ID IS NOT NULL)
ORDER BY SALARY DESC, LAST_NAME

-----------------------------------------------------------------------------------------------------
-- Q10
/*
Display last name, job title and salary for all employees whose salary matches any of the 
salaries from the IT Department. Do NOT use Join method
*/
-- Q10:  Answer
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY IN(
                SELECT SALARY
                FROM EMPLOYEES
                WHERE JOB_ID = 'IT_PROG')
ORDER BY SALARY, LAST_NAME

-----------------------------------------------------------------------------------------------------



















