/*
    ����:
        SELECT (��, �÷�(�׸�)��, �Լ�, SUB QUERY)
        FROM (���̺���, SUB QUERY)
*/

SELECT * FROM employees;

SELECT * FROM TAB; -- DB�����ȿ� �ִ� ��� TABLE

SELECT employee_id, FIRST_NAME, SALARY
FROM employees;

SELECT employee_id, FIRST_NAME, SALARY * 12
FROM employees;

--ALIAS         '���ڿ�' "���ڿ�"         AS ��������
SELECT employee_id AS �����ȣ, salary AS "�� ��", salary*12 "�ϳ�ġ ����"
FROM employees;

-- XXX�� ������ xxx�Դϴ�  "�̸� + ����"
SELECT  first_name || '�� ������ ' || SALARY || '�Դϴ�' AS "�̸� + ����"
FROM employees;

-- DISTINGCT : �ߺ����� ����
SELECT DISTINCT department_id
FROM employees;

-- ����1) EMPLOYEES Table�� ��� �ڷḦ ����Ͽ���.
SELECT * FROM EMPLOYEES;
-- ����2) EMPLOYEES Table�� �÷����� ��� ����϶�.
DESC employees;
DESC tb_varchar;
-- ����3) EMPLOYEES Table���� ��� ��ȣ, �̸�, �޿�, �������� ����Ͽ���.
SELECT employee_id, FIRST_NAME, SALARY, JOB_ID
FROM employees;
-- ����4) ��� �������� �޿��� $300���� ��Ű�� ���ؼ� ���� �����ڸ� ����ϰ� ����� SALARY+300�� ���÷��� �մϴ�.
SELECT FIRST_NAME , SALARY+300
FROM employees;
-- ����5) EMP ���̺����� �����ȣ, �̸�, �޿�, ���ʽ�, ���ʽ� �ݾ��� ����Ͽ���. 
-- (������ ���ʽ��� ���� + (����*Ŀ�̼�))
SELECT employee_id, FIRST_NAME, SALARY , NVL(SALARY*COMMISSION_PCT,0), NVL(SALARY+ SALARY*COMMISSION_PCT,SALARY)
FROM employees;
/*
    NVL(�÷�, �÷��� ���� NULL�̸� �����Ǵ� ��)
    
*/
-- ����6) EMPLOYEES ���̺����� LAST_NAME�� �̸����� SALARY�� �޿��� ����Ͽ���.
SELECT LAST_NAME AS "�̸�", SALARY AS "�޿�"
FROM employees;

-- ����7) EMPLOYEES ���̺����� LAST_NAME�� Name���� SALARY * 12�� Annual Salary(����)�� ����Ͽ���
SELECT LAST_NAME AS "NAME", SALARY * 12 AS "Annual Salary"
FROM employees;

-- ����8) EMPLOYEES ���̺����� �̸��� ������ �����Ͽ� ����Ͽ���. 
SELECT FIRST_NAME ||JOB_ID 
FROM employees;

-- ����9) EMPLOYEES ���̺����� �̸��� ������ ��KING is a PRESIDENT�� �������� ����Ͽ���. 
SELECT FIRST_NAME || ' is a ' || JOB_ID
FROM employees;

-- ����10) EMPLOYEES ���̺����� �̸��� ������ ��KING: 1 Year salary = 60000�� �������� ����Ͽ���. 
SELECT FIRST_NAME || ': 1Year salary = ' || SALARY * 12
FROM employees;

-- ����11) EMPLOYEES ���̺����� JOB�� ��� ����϶�.
SELECT  DISTINCT JOB_ID
FROM employees;




