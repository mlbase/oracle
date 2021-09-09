/*
    SELECT 
    FROM 
    WHERE   조건절 ->  if

    비교 연산자( > < >= <= = != <>)
    NULL, IS NULL, IS NOT, IS NOT NULL
    AND(&&), OR(||), (우선비교)
*/

-- 이름 -> JULIA
SELECT first_name, last_name, salary
FROM EMPLOYEES
WHERE FIRST_NAME = 'Julia'

-- 월급이 $9000 이상인 사원
SELECT first_name, salary
FROM employees
WHERE first_name >= '9000';

SELECT first_name
FROM employees
WHERE first_name >= 'Shanta';

SELECT first_name
FROM employees
WHERE first_name > 'J' And first_namet_name >='Shanta';

-- 메니자가 없는 사원
SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;
-- NULL 은 무적권 IS NULL로
SELECT first_name, manager_id
FROM employees
WHERE manager_id ='';

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;


-- && = AND
-- 이름이 John, 월급이 5000이상
SELECT first_name, salary
FROM employees
WHERE first_name = 'John'
    AND salary >= 5000;

-- || = OR
SELECT  first_name, last_name
FROM employees
WHERE first_name = 'John'
    OR last_name = 'Vollman';
    
--2007년 12월 31일 이후에 입사한 사원을 출력
SELECT first_name, hire_date
FROM employees
WHERE hire_date > '07/12/31';

SELECT first_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('20071231', 'YYYYMMDD') ;

/*
    ALL (=AND), ANY(=OR)
    IN NOT IN
    BETWEEN
    LIKE
*/
SELECT first_name
FROM employees
WHERE first_name = ALL('Julia', 'John');
-- first_name == 'Julia' And first_name =='John'
 
SELECT first_name, salary
From employees
WHERE salary = ANY(8000,3200,6000);

SELECT first_name, salary
From employees
WHERE salary IN(8000,3200,6000);

SELECT first_name, salary
From employees
WHERE salary NOT IN(8000,3200,6000);

SELECT first_name, salary
From employees
WHERE salary = 8000 OR salary = 3200 OR salary = 6000;

SELECT first_name, salary
From employees
WHERE salary >=3200 AND salary <=9000;

SELECT first_name, salary
From employees
WHERE salary BETWEEN 3200 AND 9000;

--LIKE
SELECT  first_name
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'G_ra_d';    -- _ 한글자

SELECT first_name
FROM employees
WHERE first_name LIKE 'K%y';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%06';

SELECT first_name, hire_date
FROM employees
WHERE first_name LIKE '%z%';

SELECT first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'MM') LIKE '06';
