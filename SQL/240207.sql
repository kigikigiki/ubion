select * from emp where sal >= 2000;

select * from emp where SAL between 1500 and 3000;

select A.DEPTNO, A.JOB, A.ENAME, B.DEPTNO, B.LOC
from emp as A inner join dept as B 
on A.DEPTNO = B.DEPTNO
where SAL > 1000;

select * from emp where job != 'salesman' AND JOB != 'manager';

select * from emp where job not in ('salesman', 'manager');

select job, sal, EMPNO from emp group by EMPNO ;

select * from emp
where ENAME like 's%';

select job, avg(SAL) as mean from emp 
group by job;