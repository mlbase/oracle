/*
    SEQUENCE : 유일한 값(중복된 값이 아님)을 생성해 주는 오브젝트
               회원번호, 게시판 글번호
               초기화가 안된다. 삭제 후에 다시 생성
    int count = 0;
    while(true) {    
        count++;
    }
*/

--SEQUENCE 생성
CREATE SEQUENCE TESTSEQ
INCREMENT BY 1      -- 1씩 증가
START WITH 10        --시작 숫자
MAXVALUE 100
MINVALUE 1;

-- CURRVAL = 현재의 SEQ
SELECT TESTSEQ.CURRVAL 
FROM DUAL;

--NEXTVAL = 진행값
SELECT TESTSEQ.NEXTVAL 
FROM DUAL;

-- 수정
ALTER SEQUENCE TESTSEQ
INCREMENT BY 3;

INSERT INTO employees(employee_id,last_name, email, hire_date, job_id)
VALUES(EMPLOYEES_SEQ.nextval, '홍', 'hgd@daum.net', '21/09/13', 'IT_PROG');

SELECT
    * FROM employees;

DROP SEQUENCE TESTSEQ;


ROLLBACK;















