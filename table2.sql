/*
    무결성 : constraint
            column을 지정하는 성질
            
    primary key : 기본키, null을 허용하지 않는다. 중복을 허용하지 않는다.    id, 주민번호
    uniqe key : 고유키 null은 허용한다. 중복을 허용하지 않는다.
    foregin key : 외래키. 테이블과 테이블을 연결하는 것이 목적의 성질이다. join이 목적
                  null을 허용한다.
                  외래키로 설정된 컬럼은 연결된 테이블의 컬럼에서 primary key나 unique key로 설정되어 있다.
    check : 범위를 설정. 값을 지정할 수도 있다. 지정된 값외에는 사용할 수 없다. null을 허용
    not null : null을 허용하지 않는다

*/

--NOT NULL
DROP TABLE TB_TEST04;

CREATE TABLE TB_TEST04(
    COL1 VARCHAR2(10) NOT NULL,
    COL2 VARCHAR2(20)
);

INSERT INTO tb_test04(COL1, COL2)
VALUES('AAA', '111');

INSERT INTO tb_test04(COL1, COL2)
VALUES('BBB', '');

SELECT * FROM tb_test04;

INSERT INTO tb_test04(COL1, COL2)
VALUES('', '222');

INSERT INTO tb_test04(COL1)
VALUES('ccc');

-- check : 지정된 값만을 삽입할 수 있다. null을 허용
CREATE TABLE TB_CHECK(
    COL1 VARCHAR2(10),
    COL2 VARCHAR2(20),
    CONSTRAINT CHK_01 CHECK(COL1 IN('사과', '배', '바나나') ),
    CONSTRAINT CHK_02 CHECK(COL2 > 0 AND COL2 <= 10 )
);

INSERT INTO tb_check(COL1, COL2)
VALUES('사과' , 5);

INSERT INTO tb_check(COL1, COL2)
VALUES('귤' , 5);

INSERT INTO tb_check(COL1, COL2)
VALUES('' , 5);

INSERT INTO tb_check( COL2)
VALUES( 5);

INSERT INTO tb_check(COL1, COL2)
VALUES('사과' , 0);

INSERT INTO tb_check(COL1, COL2)
VALUES('사과' , 11);


-- Primary Key = Uniquer Key + NOT NULL

CREATE TABLE TB_TEST05(
    COL1_PK VARCHAR2(10) CONSTRAINT PK_TEST_01 PRIMARY KEY,
    COL2 VARCHAR2(20)
);

INSERT INTO tb_test05(COL1_PK, COL2)
VALUES( 'AAA', '111');

INSERT INTO tb_test05(COL1_PK, COL2)
VALUES( 'BBB', '');

INSERT INTO tb_test05(COL1_PK)
VALUES( 'CCC');

CREATE TABLE TB_TEST06(
    COL1_PK VARCHAR2(10) CONSTRAINT PK_TEST_02 PRIMARY KEY,
    COL2_PK VARCHAR2(10) CONSTRAINT PK_TEST_03 PRIMARY KEY,        --"table can have only one primary key"
    COL2 VARCHAR2(20)
);

CREATE TABLE TB_TEST06(
    COL1 VARCHAR2(10), 
    COL2 VARCHAR2(10),
    COL3 VARCHAR2(20),
    CONSTRAINT PK_TEST_02 PRIMARY KEY(COL1,COL2)
);

CREATE TABLE TB_TEST07(
    COL1 VARCHAR2(10), 
    COL2 VARCHAR2(10)
);

ALTER TABLE TB_TEST07
ADD
PRIMARY KEY(COL1);

ALTER TABLE TB_TEST07
DROP
PRIMARY KEY;

-- Unique : 중복된 값을 사용불가. null은 허용
create table tb_test08{
    col1 varchar2(10)  CONSTRAINT UK_TEST_01 UNIQUE,
    VOL2 VARCHAR2(20)  
);

INSERT INTO TB_TEST08 (COL1, VOL2)
VALUES('AAA', '111');

INSERT INTO TB_TEST08 (COL1, VOL2)
VALUES('', '111');


-- FOREGIN KEY : 외래키
--               JOIN을 목적. 테이블 연결
--               기본테이블에서 컬럼이 PK, UK로 되어 있어야한다.
--               NULL을 허용

CREATE TABLE DEPT(
    DEPARTMENT_ID VARCHAR2(10),
    DEPARTMENT_NAME VARCHAR2(20),
    LOCATION_ID NUMBER,
    CONSTRAINT PK_DEPT_TEST PRIMARY KEY(DEPARTMENT_ID)
);

INSERT INTO DEPT(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
VALUES('10', '기획부', 100);

INSERT INTO DEPT(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
VALUES('20', '관리부', 110);

INSERT INTO DEPT(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
VALUES('30', '개발부', 120);

CREATE TABLE EMP(
  EMPNO VARCHAR2(10),
  ENAME VARCHAR2(20),
  DEPARTMENT_ID_FK VARCHAR2(10),
  CONSTRAINT FK_EMP_TEST FOREIGN KEY(DEPARTMENT_ID_FK)
  REFERENCES DEPT(DEPARTMENT_ID)
);

INSERT INTO EMP (EMPNO, ENAME, DEPARTMENT_ID_FK)
VALUES(1, '홍길동', '30');

INSERT INTO EMP (EMPNO, ENAME, DEPARTMENT_ID_FK)
VALUES(2, '성춘향', '10');

INSERT INTO EMP (EMPNO, ENAME, DEPARTMENT_ID_FK)
VALUES(3, '일지매', '20');

-- JOIN
SELECT *
FROM EMP E, DEPT D
WHERE e.department_id_fk = d.department_id;