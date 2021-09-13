-- hr
-- 문제1) 사원들의 이름, 부서번호, 부서명을 출력하라
SELECT e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;


-- 문제2) 30번 부서의 사원들의 이름,직업,부서명을 출력하라
SELECT e.first_name, e.department_id, j.job_title, d.department_name
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
    AND e.department_id = 30
        AND e.job_id = j.job_id;

-- 문제3) 커미션을 받는 사원의 이름, 직업, 부서번호,부서명을 출력하라
SELECT e.employee_id, e.commission_pct, j.job_title, d.department_name
FROM employees e, jobs j, departments d
WHERE e.commission_pct  IS NOT NULL
    AND e.department_id = d.department_id
         AND e.job_id = j.job_id;

-- 문제4) 지역번호 2500 에서 근무하는 사원의 이름, 직업,부서번호,부서명을 출력하라
SELECT e.first_name, d.location_id, j.job_title, e.department_id, d.department_name
FROM employees e, jobs j, departments d
WHERE d.location_id = 2500
    AND e.department_id = d.department_id
        AND e.job_id = j.job_id;

-- 문제5) 이름에 A가 들어가는 사원들의 이름과 부서이름을 출력하라
SELECT e.first_name, d.department_name
FROM employees e, departments d
WHERE e.first_name LIKE '%A%'
    AND e.department_id = d.department_id;

-- 문제6) 사원이름과 그 사원의 관리자 이름을 출력하라
SELECT a.first_name, b.first_name
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;

-- 문제7) 사원이름과 부서명과 월급을 출력하는데 월급이 3000 이상인 사원을 출력하라
SELECT e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.salary >= 3000
    AND e.department_id = d.department_id;

-- 문제8) TJ 이란 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하라
SELECT a.first_name, a.hire_date
FROM employees a, employees b
WHERE b.first_name = 'TJ'
    AND TO_CHAR(a.hire_date) > TO_CHAR(b.hire_date);

-- 문제9) 급여가 3000에서 5000사이인 사원의 이름과 소속부서명 출력하라
SELECT e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.salary BETWEEN 3000 AND 5000
    AND e.department_id = d.department_id;
    

-- 문제10) ACCOUNTING 부서 소속 사원의 이름과 입사일 출력하라
SELECT e.first_name, e.hire_date, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND d.department_name = 'Accounting';

-- 문제11) 급여가 3000이하인 사원의 이름과 급여, 근무지
SELECT e.first_name, e.salary, l.city
FROM employees e, departments d,locations l
WHERE e.salary <= 3000
    AND e.department_id = d.department_id
        AND d.location_id = l.location_id;
        
/*
101번 사원에 대해 아래의 결과를 산출하는 쿼리를 작성해보자.

사번  사원명     job명칭   job시작일자 job종료일자     job수행부서명
*/
SELECT e.employee_id, e.first_name, j.job_title,
    h.start_date, h.end_date, d.department_name
FROM employees e, jobs j, job_history h, departments d
WHERE e.employee_id = 101
    AND e.job_id = j.job_id
        AND e.employee_id = h.employee_id
            AND e.department_id = d.department_id;

