/*
    테이블 스페이스(space)
    테이블(object) 및 다른 object(view, sequence...) 저장하는 논리적 공간

*/

CREATE TABLESPACE TABLESPACE2
DATAFILE 'D:\temp\TEST_TBS.DBF' SIZE 10M
AUTOEXTEND ON NEXT 1M MAXSIZE UNLIMITED
LOGGING
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;

-- OBJECT : CREATE(생성), AKTER(수정), DROP(삭제)
-- DATA : INSERT, UPDATE, DELETE, SELECT

ALTER TABLESPACE TABLESPACE1
RENAME TO TEST_TBS1;

ALTER DATABASE
DATAFILE 'D:\temp\FILE_SPECIFICATION1' RESIZE 7M;

DROP TABLESPACE TEST_TBS1
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

/*  
    TABLE : 행(COLUMN)과 열(ROW)으로 구성

*/

CREATE TABLE TB_TEST01(
    COL1 VARCHAR2(10),
    COL2 VARCHAR2(10),
    COL3 VARCHAR2(10)
);

CREATE TABLE TB_TEST02(
    COL1 VARCHAR2(10),
    COL2 VARCHAR2(10),
    COL3 VARCHAR2(10)
)TABLESPACE TABLESPACE2;

-- 테이블을 복제 : 데이터를 포함
CREATE TABLE TB_TEST03(JNAME, JTITLE, SALMIN, SALMAX)
AS
SELECT * FROM jobs;

SELECT * FROM TB_TEST03;

DROP TABLE TB_TEST03;

--테이블을 복제 : 데이터를 미포함
CREATE TABLE TB_TEST04
AS
SELECT * FROM employees
WHERE 1 = 2;

-- 테이블명 수정
ALTER TABLE TB_TEST04
RENAME 
TO TB_TEST99;

-- 컬럼 추가
ALTER TABLE TB_TEST99
ADD
NEWCOL VARCHAR2(20);

-- 컬럼 수정
ALTER TABLE TB_TEST99
MODIFY
NEWCOL DATE;

-- 컬럼 삭제
ALTER TABLE TB_TEST99
DROP
COLUMN NEWCOL;

-- 컬럼명 수정
ALTER TABLE TB_TEST99
RENAME
COLUMN employee_id TO EMPNO;

DROP TABLE TB_TEST99;

PURGE RECYCLEBIN;

SELECT * FROM TB_TEST03;

-- 데이터 추가
INSERT INTO tb_test03(JNAME, JTITLE, SALMIN, SALMAX)
VALUES('SALES_AD', '영업부', 8000, 20000);

INSERT INTO tb_test03
VALUES('BALL_MO', '야구부', 8500, 2500);

INSERT INTO tb_test03(JTITLE, JNAME, SALMAX, SALMIN)
VALUES('창고부', 'SAVE', 23000, 10000);

INSERT INTO tb_test03( JNAME, JTITLE, SALMAX)
VALUES( 'PHONE', '전화상담', 25000);
-- 데이터 삭제
DELETE FROM tb_test03
WHERE JNAME = 'SAVE';

DELETE FROM tb_test03
WHERE SALMAX = 2500;

-- 데이터 수정 UPDATE
UPDATE tb_test03
SET jtitle = '개발부', SALMAX = 25000, SALMIN = 9000
WHERE JNAME = 'SALES_AD';









