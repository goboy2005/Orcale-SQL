SQL Day 13 Problems 

�� Q-366.������ ������ Ǯ������ from ���� ������������ ����� �ӽ����̺��� ���� �����Ͻÿ�! 

create global temporary table num1_9
(num1 nubmer(10))
on commit preserve rows;

insert into num1_9
(select level
  from dual 
     conncect by level <=9);
     
     select * from num1_9;

create global temporary table num2_9
(num2 nubmer(10))
on commit preserve rows;

insert into num2_9
(select level
  from dual 
     conncect by level <=9);
     
     select * from num2_9;


select a.num1,b.num2
from num1_9 a , num2_9 b


�� Q-369.Dalls ���� �ٹ��ϴ� ������� �̸��� �μ���ġ��  ����Ͻÿ�! (����)

select e.ename,d.loc
  from ename e, dept d
    where e.detpno=e.depno and d.loc='DALLAS';

�� Q-370.���� ��� �����͸� ��� ���̺� emp710 �� �����Ͻÿ�! 

create table emp710 as                                                     
 select e.ename,d.loc 
  from ename e, dept d
    where e.detpno=e.depno and d.loc='DALLAS';

�� Q-371.����1������ 10�������� ���ڸ� ��� ���̺��� emp705�� �����Ͻÿ�! 

create table emp705 as
 select level as num1
   from dual
     connect by level<=10;

�� Q-372.emp705�� ���� �������߿� ���Ƿ� �ƹ��ų� �ϳ��� ����ÿ�.

delete from emp705
where num1=4;

�� Q-374.����,������ ��Ż������ ����Ͻÿ�(���� ���) 
select ename,sum(sal)
  from emp
    group by job;

�� Q-375.���� ����� ����ϴ� VIEW�� �����Ͻÿ�! (VIEW �̸��� emp403) 

create view emp403 as
select job,sum(sal) as Total
from emp
group by job;

(in order to make a view table with group you must make a name for it)

�� Q-376.�μ���ȣ, (�μ���ȣ�� ��տ���)�� ����ϴ� VIEW�� deptno_avg��� �̸����� �����Ͻÿ�! 

create view deptno_avg as
select deptno,avg(sal) as ���
 from emp 
    group by deptno;

�� Q-377.emp�� ���� ���� deptno_avg view �� �����ؼ� 
�̸�,����,�μ���ȣ,�μ����� ��� 

select e.ename,e.sal,e.deptno,v.���
 from emp e, deptno_avg v
    where e.deptno=v.deptno;

*Benefit of the view table 1 .�ΰ��� �÷��� ���缭 �����͸� ������ �� �ִ�.
                           2. ������ �������� �ܼ��ϰ� ���� �� �ִ�. 
                
�� Q-378.�̸�,����,�μ���ȣ,�μ���տ����� ����ϴµ� ������ �μ� ��պ��� �� ū ����鸸 ����Ͻÿ�

select e.ename,e.sal,e.deptno,v.�μ���տ���
 from emp e, deptno_avg v
   where e.deptno=v.deptno and e.sal > v.�μ���տ���

�� Q-379.emp ���̺����� ����Ұ� ���� ������� �����ϱ� ���� �ڱ��� ������ �ڱⰡ ���� ������
��� ���޺��� ������ ������� �̸��� ���ް� ��������� ����Ͻÿ�! 

(First make a view table) 

create view job_avg as
 select job,avg(sal) as �������
  from emp
    group by job;

select*from job_avg;               �� check whether the table is made 

select e.ename,e.sal,e.job,v.�������
  from emp e, job_avg v 
      where e.job = v.job and e.sal < v.������� ;

�� Q-380.����,�̸�,����,������ ����ϴµ� ������ �������� ���� ������ ���� ������� ������ �ο��Ͻÿ�! 

select ename,job,sal,dense_rank() over (partition by job order by sal desc) from emp;

���� ������ ����� view �� ����� view �� �����ؼ� ������ 1���� ����鸸 ����Ͻÿ�

create view tabel as WF
select rank() over (partition by job order by sal desc) as rank
    from emp;

select * rank from WF;

�� Q-382.�̸��� �μ���ġ�� ����ϴ� VIEW�� ename_loc ��� �̸����� �����Ͻÿ�

create view ename_loc as
select e.ename,d.loc
  from ename e , dept d 
     where e.deptno=d.deptno;

(This used two tables so it is a double view) 

select * from ename_loc

�� Q-383.ename_loc �� ������ �߿� SCOTT �� �μ���ġ�� WASHINGTON  ö�ڷ� �ٲٽÿ�.! 

update ename_loc
set loc='washington'
where ename='SCOTT'

�� An error occurs 

(���̺� ������ ��Ģ�� update �ȵǰ� �ؼ��� �ȵǴ� �͵�.)

�� Q-384.����375������ ���� emp403 view�� �����ϰ� ����� ���ÿ�

create view emp403 as
select job,sum(sal) as ��Ż
  from emp
     group by job;

select * from emp403 ;

update emp403
 set ��Ż =2000 
   where job='SALESMAN' 


�� Q-385.�׵��� ���� ���� view���� ���� ����ִ��� Ȯ���Ͻÿ�!

select view_name
   from user_views;

 &

 select view_name,text
    from user_views;

(If you put text in you can see the original table that was used to make the view table
By restricting the acesss of this, data analyst from outside can only see the admitted range of data.)

�� Q-385.��� ���̺��� ���޿� �ε����� �Žÿ�!

create index emp_sal -------make a name of an index    
  on emp(sal) ;   

�� Q-386.emp ���̺��� sal�� �ε����� emp_sal�� ������ Ȯ���Ͻÿ�

select sal,rowid
 from emp
   where sal>0;

(Because it reads from the index, it automatically reads as order) 