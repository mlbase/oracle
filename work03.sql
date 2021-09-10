1. employees 테이블에서 사원이름 중 a가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출하여 출력하라.
SELECT SUBSTR(FIRST_NAME, 1, 3)
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%a%';

2. 이름의 세번째 문자가 a인 모든 사원의 이름을 표시하시오.
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SUBSTR(FIRST_NAME, 3,1) = 'a';

3. 이름이 J,A 또는 M으로 시작하는 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 이름의 길이를 표시하시오.(열 레이블은 name과 length로 표시)
SELECT first_name AS "name", LENGTH(first_name) AS "length"
FROM employees
WHERE SUBSTR(FIRST_NAME, 1, 1) IN('J', 'A', 'M');

4. 이름의 글자수가 6자 이상인 사원의 이름을 소문자로 이름만 출력하시오
SELECT LOWER(first_name)
FROM employees
WHERE LENGTH(FIRST_NAME) >=6;

5. 이름의 글자수가 6자 이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 출력하시오.
SELECT LOWER( SUBSTR(first_name, 1, 3))
FROM employees
WHERE LENGTH(first_name) >=6;

6. 모든 사원의 이름과 급여를 표시하시오. 급여는 15자 길이로 왼쪽에 $기호가 채워진 형식으로 표기하고 열레이블을 월급으로 지정하시오.
SELECT first_name, TO_CHAR(salary, '$999,999,999,999,999') AS "월급"
FROM employees;


7. 사원테이블에서 입사년도별 사원수를 구하라. 
/*SELECT first_name, TO_CHAR(hire_date, 'YYYY') AS "입사년도"
FROM employees
ORDER BY "입사년도"*/

SELECT TO_CHAR(hire_date, 'YYYY') AS "입사년도" ,COUNT(*)CNT
FROM employees
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY');
-- SELECT 구문이 나중에 실행되므로 ALIAS 를 뒤에서 사용할수가 없다(order by 만 가능-> 순서가 뒤라서)
