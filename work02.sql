-- hr 정렬
-- 문제1) EMPLOYEES 테이블에서 입사일자 순으로 정렬하여 사원번호, 이름, 업무, 급여, 입사일자,부서번호를 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, department_id
FROM EMPLOYEES
ORDER BY HIRE_DATE;

-- 문제2) EMPLOYEES 테이블에서 가장 최근에 입사한 순으로 사원번호, 이름, 업무, 급여, 입사일자,부서번호를 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, department_id
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

-- 문제3) EMPLOYEES 테이블에서 부서번호로 정렬한 후 부서번호가 같을 경우 급여가 많은 순으로 정렬하여 사원번호, 성명, 업무, 부서번호, 급여를 출력하여라.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, salary DESC;


-- 문제4) EMPLOYEES 테이블에서 첫번째 정렬은 부서번호로 두번째 정렬은 업무로 세번째 정렬은 급여가 많은 순으로 정렬하여 
-- 사원번호, 성명, 입사일자, 부서번호, 업무, 급여를 출력하여라.
SELECT EMPLOYEE_ID, FIRST_NAME,  HIRE_DATE, DEPARTMENT_ID, JOB_ID, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, JOB_ID, SALARY DESC;



-- hr 표준함수

-- 문제1) EMPLOYEES 테이블에서 King의 정보를 대문자로 검색하고 사원번호, 성명, 담당업무(대문자로),부서번호를 출력하라.
SELECT employee_id, first_name, job_id, department_id
FROM EMPLOYEES
WHERE UPPER(LAST_NAME) ='KING';

-- 문제2) DEPARTMENTS 테이블에서 (부서번호와 부서이름), 부서이름과 위치번호를 합하여 출력하도록 하라.
SELECT department_id || ' '||DEPARTMENT_NAME, DEPARTMENT_NAME || ' ' || LOCATION_ID
FROM departments;

SELECT CONCAT(DEPARTMENT_ID, DEPARTMENT_NAME), CONCAT(DEPARTMENT_NAME, LOCATION_ID)
FROM departments;

-- 문제3) EMPLOYEES 테이블에서 이름의 첫 글자가 ‘K’ 보다 크고 ‘Y’보다 적은 사원의 사원번호, 이름, 업무, 급여, 부서번호를 출력하라. 
-- 단 이름순으로 정렬하여라.
SELECT employee_id, first_name, job_id, salary, department_id
FROM EMPLOYEES
--WHERE FIRST_NAME BETWEEN 'K' AND 'Y'
WHERE SUBSTR(FIRST_NAME, 1, 1) BETWEEN 'L' AND 'X'
ORDER BY first_name;
-- 문제4) EMPLOYEES 테이블에서 20번 부서 중 이름의 길이 및 급여의 자릿수를 사원번호, 이름, 이름의 문자의 길이, 급여, 급여의 자릿수를 출력하라.
--LENGTHB() LENGTH()
SELECT employee_id, first_name, LENGTH(first_name), salary, LENGTH(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20
ORDER BY department_id;

-- 문제5) EMPLOYEES 테이블의 이름에서  ‘e’자의 위치를 출력하라.
SELECT first_name, INSTR(first_name , 'e', 1, 1)
FROM EMPLOYEES;


-- 문제6) ROUND 함수를 사용하여 4567.678의 소수가 다음과 같이 출력되도록 하라.
4568
4568
4567.68
4600
SELECT ROUND(4567.678, 0), ROUND(4567.678), ROUND(4567.678, 2), ROUND(4567.678, -2)
FROM DUAL;


-- 문제7) EMPLOYEES 테이블에서 부서번호가 80인 사람의 급여를 30으로 나눈 나머지를 구하여 출력하라.
SELECT MOD(salary, 30)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
-- 문제8) EMPLOYEES 테이블에서 30번 부서 중 이름과 담당 업무를 연결하여 출력하여라. 
-- 단 담당 업무를 한 줄 아래로 출력하라.
SELECT FIRST_NAME ||CHR(10)|| job_id 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
-- 문제9) EMPLOYEES 테이블에서 현재까지 근무일 수가 몇주 몇일 인가를 출력하여라. 
-- 단 근무 일수가 많은 사람 순으로 출력하여라.
SELECT first_name, TO_DATE(SYSDATE) - hire_date
FROM employeeS
ORDER BY HIRE_DATE ASC;
-- 문제10) EMPLOYEES 테이블에서 부서 50에서 급여 앞에 $를 삽입하고 3자리마다 ,를 출력하라
SELECT first_name, salary, TO_CHAR(SALARY, '$999,999')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;





-- hr 그룹핑
-- 문제1) EMPLOYEES 테이블에서 모든 SALESMAN(SA_)에 대하여 급여의 평균, 최고액, 최저액, 합계를 구하여 출력하여라.
SELECT AVG(salary), MAX(salary), MIN(SALARY), SUM(SALARY)
FROM EMPLOYEES
WHERE JOB_ID LIKE 'SA_%';
-- 문제2) EMPLOYEES 테이블에 등록되어 있는 인원수, 보너스가 NULL이 아닌 인원수, 보너스의 평균, 등록되어 있는 부서의 수를 구하여 출력하라.
SELECT COUNT(*),TRUNC( AVG(COMMISSION_PCT * SALARY)), COUNT(DISTINCT DEPARTMENT_ID)
FROM EMPLOYEES;

-- 문제3) EMPLOYEES 테이블에서 부서별로 인원수, 평균 급여, 최저급여, 최고 급여, 급여의 합을 구하여 출력하라.
SELECT COUNT(*), ROUND(AVG(SALARY)), MIN(SALARY), MAX(SALARY), SUM(SALARY)
FROM EMPLOYEES
GROUP BY department_id;

-- 문제4) EMPLOYEES 테이블에서 각 부서별로 인원수,급여의 평균, 최저 급여, 최고 급여, 급여의 합을 구하여 급여의 합이 많은 순으로 출력하여라.
SELECT COUNT(*), ROUND(AVG(SALARY)), MIN(SALARY), MAX(SALARY),
SUM(salary) AS "급여의 합"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY "급여의 합";

-- 문제5) EMPLOYEES 테이블에서 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하여라.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), ROUND(AVG(SALARY)), SUM(salary)
FROM EMPLOYEES
GROUP BY department_id, job_id;

-- 문제6) EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력하여라
SELECT department_id, COUNT(*), SUM(salary)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(DEPARTMENT_ID) > 4;

-- 문제7) EMPLOYEES 테이블에서 급여가 최대 10000이상인 부서에 대해서 부서번호, 평균 급여, 급여의 합을 구하여 출력하여라.
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)), SUM(SALARY), MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 10000;

-- 문제8) EMPLOYEES 테이블에서 업무별 급여의 평균이 10000 이상인 업무에 대해서 업무명,평균 급여, 급여의 합을 구하여 출력하라.
SELECT JOB_ID, ROUND(AVG(SALARY)), SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) >= 10000;

-- 문제9) EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하라. 
-- 단 판매원(SA_)은 제외하고  월 급여 합계로 정렬(내림차순)하라.
SELECT JOB_ID, SUM(SALARY)
FROM EMPLOYEES
WHERE JOB_ID NOT LIKE 'SA_%'
GROUP BY JOB_ID
HAVING SUM(SALARY) > 10000
ORDER BY SUM(SALARY) DESC;
