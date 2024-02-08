## where 조건절 사용
select * from emp where sal >= 2000;

## where 조건절 사용 (beween 활용)
select * from emp where SAL between 1500 and 3000;

## inner join 사용 - where 조건절 사용
select A.DEPTNO, A.JOB, A.ENAME, B.DEPTNO, B.LOC
from emp as A inner join dept as B 
on A.DEPTNO = B.DEPTNO
where SAL > 1000;

## where 조건절 사용 - !=, AND 사용
select * from emp where job != 'salesman' AND JOB != 'manager';

## where 조건절 사용 - not in 활용
select * from emp where job not in ('salesman', 'manager');

## group by 사용방법
select job, sal, EMPNO from emp group by EMPNO ;

## where 조건절 사용 - like, _%사용
select * from emp
where ENAME like 's%';

## group by 사용 - avg 함수 사용
select job, avg(SAL) as mean from emp 
group by job;