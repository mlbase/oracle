-- 문제1) EMPLOYEES 테이블에서 20번 부서의 세부 사항을 포함하는 EMP_20 VIEW를 생성 하라
CREATE VIEW EMP_20_VIEW
AS
SELECT *
FROM employees
WHERE department_id = 20;


-- 문제2) EMPLOYEES 테이블에서 30번 부서만 
-- EMPLOYEE_ID 를 emp_no 로 LAST_NAME을 name으로 SALARY를 sal로 바꾸어 EMP_30 VIEW를 생성하라.
CREATE VIEW EMP_30_VIEW
AS
SELECT employee_id as "emp_no", LAST_NAME AS name, salary as sal
FROM employees
WHERE department_id = 30;

SELECT
    * FROM EMP_30_VIEW;
-- 문제3) 부서별로 부서명,최소 급여,최대 급여,부서의 평균 급여를 포함하는 DEPT_SUM VIEW을 생성하여라.
DROP VIEW DEPT_SUM_VIEW;
CREATE VIEW DEPT_SUM_VIEW
AS
SELECT department_id as "부서명", MIN(salary) as "최소급여", MAX(salary) as "최대급여", TRUNC(AVG(salary)) AS "평균급여"
FROM employees
GROUP BY department_id;

SELECT
    * FROM DEPT_SUM_VIEW;
-- 문제4) 앞에서 생성한 EMP_20,EMP_30 VIEW을 삭제하여라.
DROP VIEW  EMP_20_VIEW;
DROP VIEW EMP_30_VIEW;





















