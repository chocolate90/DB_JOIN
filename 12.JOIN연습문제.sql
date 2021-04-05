--문제 1.
---EMPLOYEES 테이블과, DEPARTMENTS 테이블은 DEPARTMENT_ID로 연결되어 있습니다.
---EMPLOYEES, DEPARTMENTS 테이블을 엘리어스를 이용해서
--각각 INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER 조인 하세요. (달라지는 행의 개수 확인)

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

--문제 2.
---EMPLOYEES, DEPARTMENTS 테이블을 INNER JOIN하세요
--조건)employee_id가 200인 사람의 이름, department_id를 출력하세요
--조건)이름 컬럼은 first_name과 last_name을 합쳐서 출력합니다

select e.first_name || ' ' || e.last_name as name, e.department_id
from employees e
inner join departments d on e.department_id = d.department_id
where e.employee_id = 200;

--문제 3.
---EMPLOYEES, JOBS테이블을 INNER JOIN하세요
--조건) 모든 사원의 이름과 직무아이디, 직무 타이틀을 출력하고, 이름 기준으로 오름차순 정렬
--HINT) 어떤 컬럼으로 서로 연결되 있는지 확인

select e.first_name, e.job_id, j.job_title
from employees e
inner join jobs j on e.job_id = j.job_id
order by first_name asc;

--문제 4.
--JOBS테이블과 JOB_HISTORY테이블을 LEFT_OUTER JOIN 하세요.

select *
from jobs j
left outer join job_history h on j.job_id = h.job_id;

--문제 5.
--Steven King의 부서명을 출력하세요.

select department_name
from employees e
inner join departments d on e.department_id = d.department_id
where first_name = 'Steven' and last_name = 'King';

--문제 6.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블을 Cartesian Product(Cross join)처리하세요

select *
from employees e
cross join departments d; --2889

--문제 7.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블의 부서번호를 조인하고 SA_MAN 사원만의 사원번호, 이름,
--급여, 부서명, 근무지를 출력하세요. (Alias를 사용)

select e.employee_id as 사원번호,
       e.first_name || ' ' || e.last_name as 이름,
       e.salary+(e.salary*e.commission_pct) as 급여,
       d.department_name as 부서명,
       d.location_id as 근무지
from employees e
inner join departments d on e.department_id = d.department_id
where job_id = 'SA_MAN';

--문제 8.
-- employees, jobs 테이블을 조인 지정하고 job_title이 'Stock Manager', 'Stock Clerk'인 직원 정보만
--출력하세요.

select *
from employees e
inner join jobs j on e.job_id = j.job_id
--where job_title = 'Stock Manager' or job_title = 'Stock Clerk';
--where job_title in ('Stock Manager', Stock clerk');
where j.job_title like 'Stock%';

--문제 9.
-- departments 테이블에서 직원이 없는 부서를 찾아 출력하세요. LEFT OUTER JOIN 사용

select d.department_id, d.department_name
from departments d
left outer join employees e on d.department_id = e.department_id
where d.manager_id is null;

--문제 10.
---join을 이용해서 사원의 이름과 그 사원의 매니저 이름을 출력하세요
--힌트) EMPLOYEES 테이블과 EMPLOYEES 테이블을 조인하세요.

select e.first_name as 사원명,
       ee.first_name as 매니저명
from employees e
left outer join employees ee on e.manager_id = ee.employee_id;

--문제 11.
--6. EMPLOYEES 테이블에서 left join하여 관리자(매니저)와, 매니저의 이름, 매니저의 급여 까지 출력하세요
--매니저 아이디가 없는 사람은 배제하고 급여는 역순으로 출력하세요

select e.first_name as 직원이름,
       ee.employee_id as 매니저아아디,
       concat(ee.first_name || ' ' , ee.last_name) as 매니저이름,
       ee.salary
from employees e
left outer join employees ee on e.manager_id = ee.employee_id
where e.manager_id is not null
order by ee.salary desc;
