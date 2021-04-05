--연습테이블 마우스로~
--CREATE TABLE AUTH 
--(
--  ID VARCHAR2(30 BYTE) NOT NULL 
--, NAME VARCHAR2(30 BYTE) 
--, JOB VARCHAR2(30 BYTE) 
--, CONSTRAINT AUTH_PK PRIMARY KEY 
--  (
--    ID 
--  )
--);
--
--CREATE TABLE INFO 
--(
--  BNO NUMBER(10, 0) NOT NULL 
--, TITLE VARCHAR2(30 BYTE) 
--, CONTENT VARCHAR2(30 BYTE) 
--, ID VARCHAR2(30 BYTE) 
--, CONSTRAINT INFO_PK PRIMARY KEY 
--  (
--    BNO 
--  )
--
--) ;

--INSERT INTO "HR"."INFO" (BNO, TITLE, CONTENT, ID) VALUES ('1', 'java', 'java is...', '1')
--INSERT INTO "HR"."INFO" (BNO, TITLE, CONTENT, ID) VALUES ('2', 'js', 'js is...', '1')
--INSERT INTO "HR"."INFO" (BNO, TITLE, CONTENT, ID) VALUES ('3', 'oracle', 'oracle is...', '1')
--INSERT INTO "HR"."INFO" (BNO, TITLE, CONTENT, ID) VALUES ('4', 'spring', 'spring is...', '2')
--INSERT INTO "HR"."INFO" (BNO, TITLE, CONTENT, ID) VALUES ('5', 'mysql', 'mysql is...', '3')
--INSERT INTO "HR"."INFO" (BNO, TITLE, CONTENT, ID) VALUES ('6', 'c', 'c is...', '4')
--INSERT INTO "HR"."INFO" (BNO, TITLE, CONTENT) VALUES ('7', '음..', '음~~')
--
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('1', '홍길동', '전업주부')
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('2', '이순신', 'DBA')
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('3', '정우현', 'designer')
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('4', '홍길동', '선생님')
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('5', '고길동', '과학자')


--------------------------------------조인---------------------------------------

select * from auth;
select * from info;

--INNER JOIN
SELECT * FROM info INNER JOIN auth ON info.id = auth.id;

--SELECT문의 열을 선택할 때 id만 쓰게 되면 모호하다. (양쪽 테이블에 id가 있어서)
--이런 경우 컬럼에 테이블이름.컬럼명을 직접 지칭해서 가져와야한다.
SELECT bno, title, content, info.id, name, job
FROM info
INNER JOIN auth ON info.id = auth.id;

--테이블명이 길어질 수 있어서 테이블 alias(별칭) 사용이 가능하다.
SELECT bno, title, content, i.id, name, job
FROM info i
INNER JOIN auth a ON i.id = a.id;

--조건절 사용도 가능하다.
SELECT bno, title, content, name, job
FROM info i
INNER JOIN auth a ON i.id = a.id
WHERE job = '전업주부';

--OUTER JOIN
--LEFT OUTER JOIN (왼쪽 기준)

SELECT *
FROM info i 
LEFT OUTER JOIN auth a ON i.id = a.id;

SELECT *
FROM auth a
RIGHT OUTER JOIN info i ON a.id = i.id;

--RIGHT OUTER JOIN (오른쪽 기준)
SELECT *
FROM info i
RIGHT OUTER JOIN auth a ON i.id = a.id;

--FULL OUTER JOIN (양측 테이블이 다나온다.)
SELECT *
FROM info i
FULL OUTER JOIN auth a ON i.id = a.id;

--CROSS JOIN (잘못된 조인)
SELECT *
FROM info i
CROSS JOIN auth a;

--3개의 테이블 조인

select *
from employees e
left outer join departments d on e.department_id = d.department_id
left outer join locations l on d.location_id = l.location_id;