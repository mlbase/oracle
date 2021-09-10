/*
    ORDER BY == Sorting
    
    SELECT COLUM VALUE SUBQUERY
    FROM TABKE SYNQUERY
    WHERE IF
    
    ORDER BY COLUM (ACS, DESC)

*/

SELECT FIRST_NAME, hire_date
FROM EMPLOYEES
ORDER BY HIRE_DATE ASC; --ACS 오름차순 디폴트값이라 생략해도 됨

SELECT FIRST_NAME, SALARY
FROM employees
ORDER BY salary DESC;

-- ALIAS
SELECT employee_id, FIRST_NAME, SALARY * 12 AS "ANNSAL"
FROM EMPLOYEES
ORDER BY ANNSAL DESC;

SELECT FIRST_NAME, NVL(COMMISSION_PCT, 0)
FROM employees
ORDER BY commission_pct ASC NULLS LAST;

/*
`   GROUP BY: 그룹으로 묶는 기능
    HAVING : 묶었을 때 조건
*/
SELECT DISTINCT JOB_ID, employee_id
FROM employees;

SELECT job_id       --SELECT는 제일 마지막에 실행됨
FROM EMPLOYEES
GROUP BY job_id;

/*
    통계 - GROUP FUNCTION
    COUNT
    SUM
    AVG
    MAX
    MIN
*/

SELECT COUNT (salary), COUNT(*), SUM(salary), AVG(SALARY), MAX(salary), MIN(salary)
FROM employees
WHERE JOB_ID = 'IT_PROG';

SELECT JOB_ID, COUNT(*), SUM(SALARY), AVG(SALARY), MAX(SALARY), MIN(SALARY)
FROM employees
GROUP BY JOB_ID
ORDER BY COUNT(*) DESC;

SELECT DEPARTMENT_ID, SUM(salary)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID      --HAVING 절 사용할때 반드시 GROUP BY 사용
HAVING SUM(salary) > 50000;

SELECT job_id, SUM(salary)          --4
FROM EMPLOYEES
WHERE salary >= 5000                --1
GROUP BY job_id                     --2
HAVING SUM(salary) > 20000          --3
ORDER BY SUM(salary) DESC;          --5


