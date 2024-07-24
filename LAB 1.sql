CREATE DATABASE CSE_3A_170

-- LAB_1 :

CREATE TABLE DEPOSIT(
  ACOUNTNO INT,
  CNAME VARCHAR(50),
  BNAME VARCHAR(50),
  AMOUNT DECIMAL(8,2),
  ADATE DATETIME
);

CREATE TABLE BRANCH(
 BNAME VARCHAR(50),
 CITY VARCHAR(50)
);

CREATE TABLE CUSTOMERS(
  CNAME VARCHAR(50),
  CITY VARCHAR(50)
);

CREATE TABLE BORROW(
LOANO INT,
CNAME VARCHAR(50),
BNAME VARCHAR(50),
AMOUNT DECIMAL(8,2)
);

INSERT INTO DEPOSIT VALUES(101,'ANIL','VRCE',1000,'1995-3-1')
INSERT INTO DEPOSIT VALUES(102,'SUNIL','AJNI',5000,'1996-1-4')
INSERT INTO DEPOSIT VALUES(103,'MEHUL','KAROLBAGH',3500,'1995-11-17')
INSERT INTO DEPOSIT VALUES(104,'MADHURI','CHANDI',1200,'1995-12-17')
INSERT INTO DEPOSIT VALUES(105,'PRAMOD','M.G.ROAD',3000,'1996-3-27')
INSERT INTO DEPOSIT VALUES(106,'SANDIP','ANDHERI',2000,'1995-3-31')
INSERT INTO DEPOSIT VALUES(107,'SHIVANI','VIRAR',1000,'1995-9-5')
INSERT INTO DEPOSIT VALUES(108,'KRANTI','NEHRU PALACE',5000,'1995-7-2')
INSERT INTO DEPOSIT VALUES(109,'MINU','POWAI',1000,'1995-8-10')

SELECT *FROM DEPOSIT

INSERT INTO BRANCH VALUES
('VRCE','NAGPUR'),
('AJNI','NAGPUR'),
('KAROLBAGH','DELHI'),
('CHANDI','NAGPUR'),
('DHARAMPETH','NAGPUR'),
('M.G.ROAD','BENGALORE'),
('ANDHERI','BOMBAY'),
('VIRAR','BOMBAY'),
('NEHRU PALACE','DELHI'),
('POWAI','BOMBAY');

SELECT *FROM BRANCH

INSERT INTO CUSTOMERS VALUES
('ANIL','CALCUTTA'),
('SUNIL','DELHI'),
('MEHUL','BARODA'),
('MANDAR','PATNA'),
('MADHURI','NAGPUR'),
('PRAMOD','NAGPUR'),
('SANDIP','SURAT'),
('SHIVANI','BOMBAY'),
('KRANTI','BOMBAY'),
('NAREN','BOMBAY');

SELECT *FROM CUSTOMERS

INSERT INTO BORROW VALUES
(201,'ANIL','VRCE',1000),
(206,'MEHUL','AJNI',5000),
(311,'SUNIL','DHARAMPETH',3000),
(321,'MADHURI','ANDHERI',2000),
(375,'PRAMOD ','VIRAR',8000),
(481,'KRANTI','NAHERU PLACE',3000);

SELECT *FROM BORROW




