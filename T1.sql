/****************************************
Question #1
*****************************************/
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
AND UPPER(FIRST_NAME) LIKE 'B%'


/****************************************
Question #2
*****************************************/
SELECT DEPARTMENT_ID, 
        ROUND(AVG((SALARY + SALARY*NVL(COMMISSION_PCT, 0)))) AS "AVG TOTAL SALARY" 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING AVG((SALARY + SALARY*NVL(COMMISSION_PCT, 0))) > 7000
ORDER BY 2 DESC


/****************************************
Question #3
*****************************************/
SELECT  D.DEPARTMENT_NAME, 
        E.FIRST_NAME || ' ' || E.LAST_NAME AS NAME, 
        E.JOB_ID, 
        E.SALARY, 
        L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
JOIN LOCATIONS L
    ON (D.LOCATION_ID = L.LOCATION_ID)
WHERE L.CITY NOT IN ('Oxford', 'Seattle')
AND SALARY BETWEEN 2000 AND 12000
ORDER BY 4 DESC



/****************************************
Question #4
*****************************************/
SELECT  EMPLOYEE_ID, 
        FIRST_NAME || '' || LAST_NAME AS "FULL NAME", 
        TO_CHAR(HIRE_DATE, 'Day, Month fmDdth,YYYY'),
        SALARY
FROM EMPLOYEES
WHERE HIRE_DATE > (SYSDATE - 7*30)
ORDER BY HIRE_DATE DESC


/****************************************
Question #5
*****************************************/
SELECT  FIRST_NAME || ' ' || LAST_NAME AS "EMPLOYEE NAME", 
        JOB_ID, 
        SALARY, 
        HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE > (
                    SELECT HIRE_DATE
                    FROM EMPLOYEES
                    WHERE JOB_ID = 'AC_ACCOUNT')
AND JOB_ID NOT IN ('SA_REP', 'ST_CLERK')
ORDER BY 4 DESC



/****************************************
Question #6
*****************************************/
SELECT  FIRST_NAME || ' ' || LAST_NAME AS "FULL NAME",
        JOB_ID,
        TO_CHAR(SALARY, '$999,999.999') AS SALARY
FROM EMPLOYEES
WHERE SALARY > (
                SELECT MAX(E.SALARY)
                FROM EMPLOYEES E
                JOIN DEPARTMENTS D
                    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
                JOIN LOCATIONS L
                    ON (D.LOCATION_ID = L.LOCATION_ID)
                WHERE L.CITY = 'Toronto')
ORDER BY 2, 3


/****************************************
Question #7
*****************************************/
SELECT  D.DEPARTMENT_ID AS "Department",
        E.JOB_ID AS "Position",
        MAX(E.SALARY) AS "Maximum Salary",
        MIN(E.SALARY) AS "Minimum Salary"
FROM EMPLOYEES E
JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_ID, E.JOB_ID
HAVING (E.JOB_ID LIKE 'ST\_%'
        ESCAPE '\'
    OR E.JOB_ID LIKE 'IT\_%'
        ESCAPE '\'
    OR E.JOB_ID LIKE 'AD\_%'
        ESCAPE '\')
AND MAX(E.SALARY) = MIN(E.SALARY)
ORDER BY 2





















