-- 문제1) EMPLOYEES 테이블에서 급여가 3000이상인 사원의 사원번호, 이름, 담당업무, 급여를 출력하라.
SELECT  employee_id, first_name, job_id, salary
FROM EMPLOYEES
WHERE SALARY >= 3000
ORDER BY salary DESC;

-- 문제2) EMPLOYEES 테이블에서 담당 업무가 ST_MAN인 사원의 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라.
SELECT employee_id, first_name, job_id, salary, department_id
FROM EMPLOYEES
WHERE JOB_ID = 'ST_MAN'
ORDER BY SALARY DESC;

-- 문제3) EMPLOYEES 테이블에서 입사일자가 2006년 1월 1일 이후에 입사한 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
SELECT employee_id, first_name, job_id, salary, HIRE_DATE, department_id
FROM EMPLOYEES
--WHERE TO_CHAR(HIRE_DATE, 'YYYYMMDD') > 20060101
WHERE HIRE_DATE > TO_DATE('060101', 'YYMMDD')
ORDER BY HIRE_DATE;

-- 문제4) EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 사원의 성명, 담당업무, 급여, 부서번호를 출력하라.
SELECT first_name, job_id, salary, department_id
FROM EMPLOYEES
--WHERE SALARY >= 3000 AND SALARY <=5000
WHERE SALARY BETWEEN 3000 AND 5000
ORDER BY SALARY;
-- 문제5) EMPLOYEES 테이블에서 사원번호가 145,152,203인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자를 출력하라
SELECT employee_id, first_name, job_id,SALARY, hire_date
FROM EMPLOYEES
--WHERE EMPLOYEE_ID = 145 OR EMPLOYEE_ID = 152 OR EMPLOYEE_ID = 203;
WHERE employee_id IN(145,152,203);

-- 문제6) EMPLOYEES 테이블에서 입사일자가 05년도에 입사한 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
SELECT employee_id, first_name, job_id, salary, HIRE_DATE, department_id
FROM EMPLOYEES
--WHERE TO_CHAR(HIRE_DATE, 'YY') = '05'
WHERE hire_date LIKE '05%'
ORDER BY hire_date;
-- 문제7) EMPLOYEES 테이블에서 보너스가 없는 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 보너스, 부서번호를 출력하라.
SELECT employee_id, first_name, job_id, salary, HIRE_DATE, department_id, NVL(COMMISSION_PCT,0)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL
ORDER BY EMPLOYEE_ID;           --ORACLE: NVL    MYSQL:ISNULL

-- 문제8) EMPLOYEES 테이블에서 급여가 8000이상이고 JOB이 ST_MAN인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라
SELECT employee_id, first_name, job_id, salary, HIRE_DATE, department_id
FROM EMPLOYEES
WHERE SALARY >= 8000 AND job_id = 'ST_MAN';

-- 문제9) EMPLOYEES 테이블에서 급여가 10000이상이거나 JOB이 ST_MAN인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라
SELECT employee_id, first_name, job_id, salary, HIRE_DATE, department_id
FROM EMPLOYEES
WHERE SALARY >= 10000 OR JOB_ID = 'ST_MAN'
ORDER BY JOB_ID;
-- 문제10) EMPLOYEES 테이블에서 JOB이 ST_MAN, SA_MAN, SA_REP가 아닌 사원의 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라
SELECT employee_id, first_name, job_id, salary, HIRE_DATE, department_id
FROM EMPLOYEES
--WHERE JOB_ID != 'ST_MAN' AND JOB_ID != 'SA_MAN' AND JOB_ID != 'SA_REP';
WHERE JOB_ID NOT IN('ST_MAN', 'SA_MEN', 'SA_REP');
-- 문제11) 업무가 PRESIDENT이고 급여가 12000이상이거나 업무가 SA_MAN인 사원의 사원번호, 이름, 업무, 급여를 출력하라.
SELECT employee_id, first_name, job_id, salary
FROM EMPLOYEES
WHERE (JOB_ID = 'AD_PRES' AND SALARY >= 12000) OR JOB_ID = 'SA_MAN';
-- 문제12) 업무가 AD_PRES 또는 SA_MAN이고 급여가 12000이상인 사원의 사원번호, 이름, 업무, 급여를 출력하라.
SELECT employee_id, first_name, job_id, salary
FROM EMPLOYEES
WHERE JOB_ID = 'AD_PRES' OR (JOB_ID = 'SA_MAN' AND SALARY >=12000);
