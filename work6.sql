CREATE TABLE TEAM(
    team_id NUMBER ,
    CONSTRAINT PK_TEAM_TB PRIMARY KEY(team_id),
    locate VARCHAR2(20),
    team_name VARCHAR2(20),
    since DATE,
    phone_number VARCHAR2(20),
    urls VARCHAR2(20)
);

DROP TABLE TEAM;

CREATE TABLE PLAYER(
    player_num NUMBER,
    player_name VARCHAR2(20),
    sign_date DATE,
    pos VARCHAR2(10),
    height LONG,
    team_id NUMBER,
    CONSTRAINT FK_TEAM_TB FOREIGN KEY(team_id)
    REFERENCES TEAM(team_id)
);

INSERT INTO TEAM
VALUES( 01, 'Liberpool', 'Liberpool', TO_DATE('1891', 'yyyy'), '031-897-4863', 'liverpoolfc.com');
INSERT INTO TEAM
VALUES( 02, 'Barcelona', 'FC Barcelona', TO_DATE('1906', 'YYYY'), '078-489-1867', 'fcbarcelona.com');

SELECT
    * FROM team;
    
INSERT INTO player
VALUES( 10, 'ansu_party', TO_DATE('2018/10/08'), 'FW', 170, 02);
INSERT INTO player
VALUES ( 7, 'antuwan_greizman', TO_DATE('2019/09/01'), 'FW', 173, 02);
INSERT INTO player
VALUES(21, 'jordi_alba', TO_DATE('2014/09/01'), 'LB', 172, 02);
INSERT INTO player
VALUES(10, 'robert_frimino', TO_DATE('2014/09/01'), 'ST', 180, 01);
INSERT INTO player
VALUES( 7, 'mohamed_sala', TO_DATE('2016/09/01'), 'FW', 172, 01);
INSERT INTO player
VALUES (9, 'mane', TO_DATE('2017/09/01'), 'FW', 180, 01);

SELECT p.player_name, t.team_name, t.phone_number, t.urls
FROM player p, team t
WHERE p.team_id = t.team_id;

CREATE TABLE PRODUCT
(   pro_id NUMBER, CONSTRAINT PK_TB_PD PRIMARY KEY(PRO_ID),
    PRO_NAME VARCHAR2(20),
    PRO_PRICE NUMBER,
    DETAIL VARCHAR2(50)
);

CREATE TABLE CONSUMER
(   CONS_ID NUMBER, CONSTRAINT PK_TB_CONS PRIMARY KEY(CONS_ID),
    CONS_NAME VARCHAR2(20),
    CONS_AGE NUMBER
);
DROP TABLE CONSUMER;
DROP TABLE CART;
CREATE TABLE CART
(   CART_ID NUMBER, CONSTRAINT PK_TB_CART PRIMARY KEY(CART_ID),
    CONS_ID NUMBER, CONSTRAINT FK_TB_CART1 FOREIGN KEY(CONS_ID) 
    REFERENCES CONSUMER(CONS_ID),
    PRO_ID NUMBER, CONSTRAINT FK_TB_CART2 FOREIGN KEY(PRO_ID)
    REFERENCES PRODUCT(PRO_ID),
    QUANTITY NUMBER
);

INSERT INTO PRODUCT
VALUES ( 101, 'CHANEL', 80000, 'CHANEL BAG');
INSERT INTO product
VALUES ( 201, 'MACBOOK M1', 100000, 'apple silicon laptop');
INSERT INTO consumer
VALUES (101, '진상', 52);
INSERT INTO CART
VALUES ( 1, 101, 101, 5);

SELECT c.cons_name, p.pro_name, ca.quantity
FROM product p, consumer c, cart ca
WHERE ca.pro_id = p.pro_id AND ca.cons_id = c.cons_id;