--���� 1.
---EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
---EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
--���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)

select *
from employees e
inner join departments d on e.department_id = d.department_id; --106

select *
from employees e
left outer join departments d on e.department_id = d.department_id; --107

select *
from employees e
right outer join departments d on e.department_id = d.department_id; --122

select *
from employees e
full outer join departments d on e.department_id = d.department_id; --123

--���� 2.
---EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
--����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
--����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�

select e.first_name || ' ' || e.last_name as name, e.department_id
from employees e
inner join departments d on e.department_id = d.department_id
where e.employee_id = 200;

--���� 3.
---EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
--����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
--HINT) � �÷����� ���� ����� �ִ��� Ȯ��

select e.first_name, e.job_id, j.job_title
from employees e
inner join jobs j on e.job_id = j.job_id
order by first_name asc;

--���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.

select *
from jobs j
left outer join job_history h on j.job_id = h.job_id;

--���� 5.
--Steven King�� �μ����� ����ϼ���.

select department_name
from employees e
inner join departments d on e.department_id = d.department_id
where first_name = 'Steven' and last_name = 'King';

--���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���

select *
from employees e
cross join departments d; --2889

--���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�,
--�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)

select e.employee_id as �����ȣ,
       e.first_name || ' ' || e.last_name as �̸�,
       e.salary+(e.salary*e.commission_pct) as �޿�,
       d.department_name as �μ���,
       d.location_id as �ٹ���
from employees e
inner join departments d on e.department_id = d.department_id
where job_id = 'SA_MAN';

--���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������
--����ϼ���.

select *
from employees e
inner join jobs j on e.job_id = j.job_id
--where job_title = 'Stock Manager' or job_title = 'Stock Clerk';
--where job_title in ('Stock Manager', Stock clerk');
where j.job_title like 'Stock%';

--���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���

select d.department_id, d.department_name
from departments d
left outer join employees e on d.department_id = e.department_id
where d.manager_id is null;

--���� 10.
---join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.

select e.first_name as �����,
       ee.first_name as �Ŵ�����
from employees e
left outer join employees ee on e.manager_id = ee.employee_id;

--���� 11.
--6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���

select e.first_name as �����̸�,
       ee.employee_id as �Ŵ����ƾƵ�,
       concat(ee.first_name || ' ' , ee.last_name) as �Ŵ����̸�,
       ee.salary
from employees e
left outer join employees ee on e.manager_id = ee.employee_id
where e.manager_id is not null
order by ee.salary desc;
