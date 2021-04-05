--�������̺� ���콺��~
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
--INSERT INTO "HR"."INFO" (BNO, TITLE, CONTENT) VALUES ('7', '��..', '��~~')
--
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('1', 'ȫ�浿', '�����ֺ�')
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('2', '�̼���', 'DBA')
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('3', '������', 'designer')
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('4', 'ȫ�浿', '������')
--INSERT INTO "HR"."AUTH" (ID, NAME, JOB) VALUES ('5', '��浿', '������')


--------------------------------------����---------------------------------------

select * from auth;
select * from info;

--INNER JOIN
SELECT * FROM info INNER JOIN auth ON info.id = auth.id;

--SELECT���� ���� ������ �� id�� ���� �Ǹ� ��ȣ�ϴ�. (���� ���̺� id�� �־)
--�̷� ��� �÷��� ���̺��̸�.�÷����� ���� ��Ī�ؼ� �����;��Ѵ�.
SELECT bno, title, content, info.id, name, job
FROM info
INNER JOIN auth ON info.id = auth.id;

--���̺���� ����� �� �־ ���̺� alias(��Ī) ����� �����ϴ�.
SELECT bno, title, content, i.id, name, job
FROM info i
INNER JOIN auth a ON i.id = a.id;

--������ ��뵵 �����ϴ�.
SELECT bno, title, content, name, job
FROM info i
INNER JOIN auth a ON i.id = a.id
WHERE job = '�����ֺ�';

--OUTER JOIN
--LEFT OUTER JOIN (���� ����)

SELECT *
FROM info i 
LEFT OUTER JOIN auth a ON i.id = a.id;

SELECT *
FROM auth a
RIGHT OUTER JOIN info i ON a.id = i.id;

--RIGHT OUTER JOIN (������ ����)
SELECT *
FROM info i
RIGHT OUTER JOIN auth a ON i.id = a.id;

--FULL OUTER JOIN (���� ���̺��� �ٳ��´�.)
SELECT *
FROM info i
FULL OUTER JOIN auth a ON i.id = a.id;

--CROSS JOIN (�߸��� ����)
SELECT *
FROM info i
CROSS JOIN auth a;

--3���� ���̺� ����

select *
from employees e
left outer join departments d on e.department_id = d.department_id
left outer join locations l on d.location_id = l.location_id;