SQL Day 8 Problems

■ Q-219. 월급이 2700 이상인 사원들의 이름과 월급과 부서위치를
출력하시오 ! 
                                                   
select   e.ename,  e.sal,  d.loc  
  from  emp  e , dept  d             
     where e.deptno = d.deptno and e.sal >= 2700;

■ Q-220. 이름의 끝글자가 T 로 끝나는 사원들의 
이름과 월급과 부서위치와 부서명을 출력하시오 !

Select e.ename, e.sal, d.loc, d.dname
   from emp e, dept d
     where e.deptno = d.deptno and e.ename like '%T';

■ Q-221. 직업이 SALESMAN 이고 월급이 1200 이상인 사원들의 
            이름과 직업과 부서위치와 월급을 출력하시오 !

select  e.ename,  e.job, d.loc,  e.sal
  from  emp  e,  dept  d
    where   e.deptno = d.deptno  and   e.job ='SALESMAN'  
                                         and   e.sal >= 1200 ;
                     ↑                              ↑
                 조인조건                      검색조건 

■ Q-222.  부서위치, 부서위치별 토탈월급을 출력하는데
 DALLAS 는 제외하고 출력하시오 !

select  d.loc,  sum(e.sal)
   from  emp  e,  dept  d
     where   e.deptno = d.deptno  and  d.loc !='DALLAS'
          group  by  d.loc;

■ Q-223. 지금 출력된 결과를 다시 출력하는데 토탈월급이 높은것부터 
 출력하시오 !

select  d.loc,  sum(e.sal)
   from  emp  e,  dept  d
    where   e.deptno = d.deptno  and  d.loc !='DALLAS'
     group  by  d.loc
       order  by  sum(e.sal)  desc;

■ Q-224.  위의 결과에서 등급이 3등급인 사원들만 출력하시오 !

 select   e.ename,  e.sal,  s.grade 
   from   emp  e,  salgrade  s
       where   e.sal  between  s.losal  and  s.hisal  and  s.grade = 3; 

■ Q-225.   급여등급(grade), 급여등급별로 해당 하는 사원들의 이름을 가로로 출력하시오

1	ADAMS,JAMES,SMITH
2	MARTIN,MILLER,WARD
3	ALLEN,TURNER
4	BLAKE,CLARK,FORD,JONES,SCOTT
5	KING

 select  s.grade , listagg( e.ename, ',')  within  group ( order  by e.ename asc) as 이름
   from  emp  e,  salgrade  s
     where  e.sal  between  s.losal  and  s.hisal
        group  by  s.grade;  

■ Q-226. 위의 결과에서 월급도 옆에 같이 나오게 하시오 !

1	ADAMS(950),JAMES(1100),SMITH(700)
2	MARTIN,MILLER,WARD
3	ALLEN,TURNER
4	BLAKE,CLARK,FORD,JONES,SCOTT
5	KING

 select  s.grade , listagg( e.ename ||'(' || sal || ')', ',')  
 within  group ( order  by e.ename asc) as 이름
   from   emp  e,  salgrade  s
     where   e.sal  between  s.losal  and  s.hisal
        group  by  s.grade;  


■ Q-227. emp 와 dept 를 서로 조인해서 이름과 부서위치와 부서번호를 출력하시오 !

 select   e.ename,  d.loc, e.deptno 
   from   emp  e,  dept   d
      where  e.deptno = d.deptno ; 


■ Q-228.  부서위치, 부서위치별 토탈월급을 출력하시오 !
LOC                        SUM(E.SAL)
-------------------------- ----------
NEW YORK                         8750
DALLAS                          10875
CHICAGO                          9400

 select  d.loc, sum(e.sal)
   from  emp  e,  dept  d
     where  e.deptno = d.deptno 
        group  by  d.loc; 
        
■ Q-229. 위의 결과에서 BOSTON 도 나오겠금 조인문법을 변경하세요 ~

LOC                        SUM(E.SAL)
-------------------------- ----------
NEW YORK                         8750
DALLAS                          10875
CHICAGO                          9400
BOSTON
 
 select  d.loc, sum(e.sal)
   from  emp  e,  dept  d
    where  e.deptno (+) = d.deptno 
      group  by  d.loc; 

■ Q-230. 우리반 테이블과  telecom_price 테이블을 조인해서  이름, 나이, 성별, 통신사,
        통신사 기본요금(price) 을 출력하는데  나이가 27 이상인 학생들만 출력되게
        하시오
        

■ Q-231. 위의 결과를 다시 출력하는데 컬럼명을  한글로 사원, 관리자라고 출력되게하시오

사원                  관리자 
-------------------- -------
BLAKE                KING
CLARK                KING
JONES                KING
MARTIN               BLAKE
ALLEN                BLAKE

select   사원.ename as  사원,   관리자.ename  as  관리자
   from   emp  사원,  emp  관리자 
      where   사원.mgr  = 관리자.empno; 

■ Q-232.사원이름, 사원월급, 관리자이름, 관리자의 월급을 출력하시오 ! (Self Join) 

 select  사원.ename as  사원,  사원.sal  as 사원월급,  
 관리자.ename  as  관리자,  관리자.sal  as  "관리자의 월급"
     from   emp  사원,  emp  관리자 
          where 사원.mgr  = 관리자.empno; 

■ Q-233.  위의 결과를 다시 출력하는데  사원의 월급이 관리자의 월급보다 더 큰 사원들
 만 출력하시오 ! 

 select 사원.ename as  사원,  사원.sal  as 사원월급, 관리자.ename  as  관리자,  관리자.sal  as  "관리자의 월급"
   from   emp  사원,  emp  관리자 
       where   사원.mgr = 관리자.empno  
       and  사원.sal > 관리자.sal ;

■ Q-234.   관리자보다 먼저 입사한 사원들의 사원 이름과 사원 입사일, 관리자 이름과 
 관리자의 입사일을 출력하시오 !

  select   사원.ename,  사원.hiredate,  관리자.ename, 관리자.hiredate
    from   emp  사원,   emp  관리자
        where   사원.mgr = 관리자.empno  
        and  사원.hiredate  <  관리자.hiredate;  
  
■ Q-235.  관리자이름을 출력하고  그 옆에 해당 관리자에 속한 사원들의 이름을 
가로로 출력하시오 (Self join) 

BLAKE	ALLEN,JAMES,MARTIN,TURNER,WARD
CLARK	MILLER
FORD	SMITH
JONES	FORD,SCOTT
KING	BLAKE,CLARK,JONES
SCOTT	ADAMS

select  관리자.ename as  관리자,  
listagg(사원.ename, ',')  within  group ( order by 사원.ename)  as  사원
  from   emp 사원,  emp 관리자
    where 사원.mgr = 관리자.empno
            group  by  관리자.ename; 

■ Q-236. 직업, 이름, 월급, 순위를 출력하는데 순위가 월급이 높은 순서데로 순위를
부여하시오 

select job, ename, sal, dense_rank() over ( order  by  sal  desc ) 순위
   from  emp ;

■ Q-237. 위의 결과를 다시 출력하는데 직업별 각각 순위가 부여되게 하시오 !

select  job, ename, sal, dense_rank() over
(partition by job order by sal desc) 순위
    from   emp ;

■ Q-238. 부서위치, 이름, 월급, 순위를 출력하는데 부서위치별로 각각 월급이 높은순서데로 순위를 부여하시오 ! 

select  d.loc,  e.ename, e.sal,dense_rank() over  
(partition  by  d.loc order by  e.sal  desc) 순위
    from  emp e, dept d
         where  e.deptno = d.deptno; 

■ Q-239. 부서위치, 부서위치별로 속한 사원들의 이름을 가로로 출력하시오 !

CHICAGO	    ALLEN,BLAKE,JAMES,MARTIN,TURNER,WARD
DALLAS	    ADAMS,FORD,JONES,SCOTT,SMITH
NEW YORK	  CLARK,KING,MILLER

select  d.loc, listagg( e.ename,',' ) within group ( order  by  e.ename  asc )  사원
  from  emp  e, dept  d
    where  e.deptno = d.deptno 
        group  by  d.loc; 
        
■ Q-240. 부서위치, 부서위치별 토탈월급을 출력하는데 맨 아래에 전체 토탈월급이
출력되게하시오 !

select  d.loc,  sum(e.sal)
  from  emp  e, dept  d
    where  e.deptno = d.deptno
        group  by  rollup(d.loc) ;

■ Q-241. 직업, 직업별 최대월급, 직업별 최소월급, 직업별 평균월급을
출력하시오 ! 

select   job,  max(sal), min(sal), avg(sal)
  from  emp
     group  by  job; 

■ Q-242. 부서위치, 부서위치별 최대월급, 부서위치별 최소월급, 부서위치별 인원수를
 출력하시오 !

select  d.loc, max(e.sal), min(e.sal), count(*)
  from  emp  e,  dept  d
    where  e.deptno = d.deptno
       group  by  d.loc; 

■ Q-243. 이름과 월급과 부서위치를 출력하는데 월급이 2400 이상인 사원들만 출력
하시오 ! ( on 절을 사용한 조인 문법으로 수행)

select  e.ename, e.sal,  d.loc
  from emp  e  join  dept   d
    on ( e.deptno = d.deptno)  
       where  e.sal >= 2400 ;   

설명: on 절을 사용한 조인 문법은  조인조건은 on 절에 주게 되어있고
         검색조건은 where 절에 주겠금 구분해 놓았다. 

■ Q-244. DALLAS 에서 근무하는 사원들의 이름과 월급과 부서위치와 직업을
출력하는데 ON 절을 사용한 조인문법으로 수행하세요 ~

select  e.ename, e.sal, d.loc, e.job
  from  emp  e  join  dept  d
    on  (e.deptno = d.deptno )
         where   d.loc='DALLAS'; 
  
■ Q-245. emp 테이블과 salgrade 테이블을 서로 조인해서 이름, 월급, 급여등급(grade)
  를 출력하는데  2등급만 출력되게하고   on 절을 사용한 조인문법으로 
  수행하시오 !

select  e.ename,  e.sal,  s.grade
  from  emp  e  join  salgrade  s
    on  (  e.sal  between  s.losal  and  s.hisal )
       where   s.grade = 2; 
   
■ Q-247. 위의 결과를 1999 ansi 문법으로 구현하시오 !

  select   e.ename,  d.loc
      from   emp  e   left  outer  join  dept   d
         on ( e.deptno = d.deptno ); 

■ Q-248. 우리반 테이블과 telecom_price 와 조인을 해서  이름이 김정민 학생의
 이름과 나이와 통신사와 통신요금(price) 을 출력하시오 !  (ANSI ON 절 사용) 

select  e.ename,  e.age,  e.telecom, t.price
  from  emp12  e  join  telecom_price  t
     on  ( e.telecom = t.telecom )
          where e.ename='김정민'; 

■ Q-249. 나이가 28 이상인 학생들의 이름과 나이와 통신사와 통신요금(price) 를
 출력하시오 !

select e.ename,e.telecom,s.price
   from emp e, telecom_price s
     where e.telecom=s.telecom
           and e.age >= 28; 

■ Q-250. 부서위치, 부서위치별 토탈월급 가로로 
출력하시오!
NEW  YORK       DALLAS      CHICAGO  <--- 컬럼명
8750        10875          9400     <--- 데이터 

select sum(decode(d.loc, 'NEW YORK', sal, null)) as "NEW YORK",
       sum(decode(d.loc, 'DALLAS', sal, null)) as "DALLAS",
       sum(decode(d.loc, 'CHICAGO', sal, null)) as "CHICAGO",
       sum(decode(d.loc, 'BOSTON', sal, null)) as "BOSTON"
          from emp e, dept d
              where e.deptno (+) = d.deptno;

