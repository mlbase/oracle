/*
    SELECT 
    FROM 
    WHERE   ������ ->  if

    �� ������( > < >= <= = != <>)
    NULL, IS NULL, IS NOT, IS NOT NULL
    AND(&&), OR(||), (�켱��)
*/

-- �̸� -> JULIA
SELECT first_name, last_name, salary
FROM EMPLOYEES
WHERE FIRST_NAME = 'Julia'

-- ������ $9000 �̻��� ���
SELECT first_name, salary
FROM employees
WHERE first_name >= '9000';

SELECT first_name
FROM employees
WHERE first_name >= 'Shanta';

SELECT first_name
FROM employees
WHERE first_name > 'J' And first_namet_name >='Shanta';

-- �޴��ڰ� ���� ���
SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;
-- NULL �� ������ IS NULL��
SELECT first_name, manager_id
FROM employees
WHERE manager_id ='';

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;


-- && = AND
-- �̸��� John, ������ 5000�̻�
SELECT first_name, salary
FROM employees
WHERE first_name = 'John'
    AND salary >= 5000;

-- || = OR
SELECT  first_name, last_name
FROM employees
WHERE first_name = 'John'
    OR last_name = 'Vollman';
    
--2007�� 12�� 31�� ���Ŀ� �Ի��� ����� ���
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
WHERE FIRST_NAME LIKE 'G_ra_d';    -- _ �ѱ���

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