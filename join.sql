/*
    JOIN
    두 개 이상의 테이블의 데이터를 검색하는 방법이다.
    보통 두 개 이상의 행(ROW)들의 공통된 값(기본키, 외래키)를 사용해서 Join한다.
    
    기본키(Primary Key): 테이블에서 중복이 되지 않는키. == 주민번호 -> PK
    외래키(Foreign key): 다른 테이블에서 PK, UK인 경우가 많다.     -> FK 

    JOIN 종류
    inner join  = 교집합       *****
    full outer join = 합집합
    cross join 
    outer join
        left join              *** 
        right join             ***
    self join                 *****   
*/

-- inner join
-- ansi SQL
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e INNER JOIN departments d 
    ON e.department_id = d.department_id;

-- Oracle
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT employee_id, first_name,
    e.job_id, j.job_id,
    job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
    AND e.job_id = 'IT_PROG';
    
    
-- cross join
-- ansi
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e CROSS JOIN departments d;

-- Oracle
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d;

-- full outer join
-- ansi
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
--oracle
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
UNION
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;
-- outer join
--left
-- ansi
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e LEFT OUTER JOIN departments d
    ON  e.department_id = d.department_id;

--oracle
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

--차집합
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
    AND e.department_id IS NULL;
    
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.department_id IS NULL
    OR d.department_id IS NULL;
    
    
-- 부서명, 업무명
SELECT e.first_name,
    e.department_id, d.department_id,
    e.job_id, j.job_id,
    d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.first_name = 'Nancy'
    AND e.department_id = d.department_id
        AND e.job_id = j.job_id;
        
-- self join : 동일한 테이블을 조인
SELECT a.employee_id, a.first_name,
    a.manager_id, b.employee_id,
    b.first_name
FROM employees a, employees b -- a: 사원 b: 상사
WHERE  a.manager_id = b.employee_id;