SQL Day 10 Problems 

■ Q-280.  JAMES 보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하시오

select ename, sal
    from   emp
        where sal > (select sal
                           from  emp
                                where  ename='JAMES' );

■ Q-281. 직업,직업별 토탈월급을 출력하시오 ! (세로 출력) 

select  job,  sum(sal)
   from  emp
     group  by  job;

■ Q-282. 위의 결과를 다시 출력하는데 직업이 SALESMAN 의 토탈월급보다 
 더 큰 것만 출력하시오 

select  job,  sum(sal)
  from  emp
    group  by  job
       having  sum(sal) > ( select sum(sal)
                               from  emp
                                   where  job='SALESMAN') 

설명:  그룹함수로 조건을 주는 절은 having 절 입니다. 
       
■ Q-283. 부서번호와 부서번호별 인원수를 출력하는데 10번 부서번호의 인원수보다 
더 큰것만 출력하시오

select   deptno,  count(*)
  from   emp
    group  by  deptno 
      having  count(*)  > ( select  count(*)
                               from  emp
                               where   deptno = 10 );

■ Q-284. 직업, 이름, 월급,  순위를 출력하는데 순위가 직업별로 각각 월급이 높은 순서
데로 순위를 부여하시오 

select job, ename, sal, dense_rank() over 
(partition  by  job order  by  sal  desc )  순위
    from emp;

■ Q-285. 위의 결과에서 순위가 1등인 사원들만 출력하시오 !

select  *
  from (select job, ename, sal, dense_rank()
        over (partition  by  job order by sal desc) 순위 from emp) 
     where 순위 = 1 ;
 
■ Q-286.  우리반 테이블에서 통신사별로 나이가 가장 많은 학생의 이름과 나이와 
통신사와 나이의 순위를 출력하시오 

select  *
  from (select telecom, ename, age,
        dense_rank() over (partition  by  telecom order  by   age  desc ) 순위 from emp12)
           where  순위 = 1; 

■ Q-287.  price 테이블의 전체 건수가 어떻게 되는지 확인하시오 !

select  count(*) 
   from price; 

■ Q-289.   사원이름, 월급, 사원 테이블의 최대월급, 사원 테이블의 최소월급을
출력하시오 !

 select ename,sal,(select  max(sal), min(sal) from emp )   
    from   emp;

중요설명:  select 절의 서브쿼리인 스칼라 서브쿼리의 특징 ?
               스칼라 서브쿼리는 단 한개값 만 리턴 할 수 있다. 

select ename,sal, (select max(sal) from emp) 최대 , (select min(sal)
                                                          from emp) 최소 
   from   emp;

■ Q-290.   이름, 나이,  우리반 나이의 평균나이를 출력하시오 !

 select ename,age, (select avg(age) from emp12) as 평균나이
    from emp12; 

■ Q-291.  위의 결과를 소수점 이하가 안나오게 반올림하시오 ! 

 select ename, age, (select round(avg(age),0) from emp12) 평균나이
     from emp12; 

■ Q-292 위의 결과에서 학생의 나이가 평균나이보다 더 큰 
 학생들의 이름과 나이와 평균나이를 출력하시오 !

select *
  from (select ename, age, round(avg(age),0) as 평균나이 from emp12) 
  
      where age > 평균나이 ;

■ Q-293.  사원 테이블에서 이름, 월급, 사원 테이블의 최대월급,
사원 테이블의 최소월급,
사원 테이블의 평균월급을 출력하시오! 

튜닝전
select  ename, sal, ( select  max(sal) from  emp ) 최대월급,
                     ( select  min(sal) from  emp ) 최소월급,
                     ( select  avg(sal) from  emp ) 평균월급
                          from   emp; 
                                      
                           ↓ 
튜닝후         
select  ename, sal,  max(sal)  over   ()  최대월급,
                      min(sal)  over   ()  최소월급,
                      avg(sal)  over   ()  평균월급
                          from   emp; 

■ Q-294.  우리반 테이블에서 이름, 나이, 우리반 나이의 최대나이,
우리반 나이의 최소나이,
우리반 나이의 평균나이,
우리반 학생들의 인원수를
출력하시오 !

select  ename, age, max(age) over () 최대나이,
                    min(age)  over  ()  최소나이,
                    round( avg(age)   over  (), 0 )  평균나이,
                    count(*)   over  ()  인원수
                      from   emp12; 

설명:   select 절의 서브쿼리인 스칼라 서브쿼리가 성능이 느리므로
         위와 같이 데이터 분석함수를 이용해서 튜닝을 하면 빠르게 
         대용량 데이터의 데이터를 검색 할 수 있습니다. 

■ Q-295.  사원 테이블에 아래의 데이터를 입력하시오 !

  사원번호: 2939
  사원이름: jane
  월급  :   4700
  입사일 :  오늘날짜

insert into emp(empno, ename, sal, hiredate )
       values( 2939, 'jane', 4700,  sysdate );

■ Q-296. 오늘 입사한 사원의 이름과 입사일을 출력하시오 !

 select   ename, hiredate
  from   emp
  where  hiredate = sysdate ;

설명:  왜 조회가 되지 않는가 ?  sysdate 는 날짜 뿐만 아니라 시분초도 출력
          되기 때문에 아까 입력했을때 시분초와 지금 조회했을때 시분초가
          서로 다르기 때문에 조회되지 않은 것 입니다. 


■ Q-297. 2020년 11월 05일에 입사한 사원의 이름과 입사일을 출력하시오!

 select ename, hiredate
  from  emp
    where hiredate = to_date('2020/11/05', 'RRRR/MM/DD') ;


설명: Try not to use function because it will slow your
search time. Istead use it in the left side of the where phrase. 
         
■ Q-298.  아래의 데이터를 사원 테이블에 입력하시오 !

insert into emp(empno, ename, sal, deptno)
          values( 4945, 'mike',  3000, 20 ) ;

■ Q-299.  이름이 mike 인 사원의 이름과 월급을 출력하시오 !

튜닝전:
select  ename, sal
  from   emp
  where  rtrim(ename)='mike'; 
               ↓
튜닝후:
  select  ename, sal
  from   emp  
  where  ename  like  'mike%'; 

Remember that using a function in the left side of the where phrase
will slow your SQL. 

■ Q-300.  아래의 데이터를 우리반 테이블에 입력하시오 !

   이름:  김인호
   성별:  남
   이메일:  abcd1234@gmail.com
   주소 :   서울시 강남구 역삼동 삼원빌딩 4층
 
 insert into emp12(ename,gender,email,address)
             values('김인호','남','abcd1234@gmail.com', '서울시 강남구 역삼동');
            

■ Q-301.  KING 의 월급을 9000 으로 변경하시오 

 update  emp
  set  sal = 9000
     where  ename='KING';

■ Q-302. 직업이 SALESMAN 인 사원들의 커미션을 9500 으로 수정하시오 

update  emp
  set  comm = 9500
    where   job ='SALESMAN'; 

■ Q-303. 직업이 SALESMAN 인 사원들을 삭제하시오 ! 

 delete from emp
   where job='SALESMAN'; 

■ Q-304. 부서번호, 부서번호별 토탈월급을 출력하는데 가로로 출력하시오 
 (sum + decode 이용)

 select job, sum ( decode( deptno, 10, sal )   )  as "10",
             sum ( decode( deptno, 20, sal )  )   as  "20",
             sum ( decode( deptno, 30, sal )  )  as  "30"
                from  emp
                   group  by  job; 

■ Q-305.  (오늘의 마지막 문제)  위의 결과에서 집계결과를 아래와 같이 
출력하시오 

select job, sum(decode(deptno, 10,sal)) as "10",
            sum(decode(deptno, 20, sal)) as "20",
            sum(decode(deptno, 30, sal)) as "30", sum(sal) as 토탈값
              from emp
                group by job
union all
select '전체토탈' as job , sum(decode(deptno, 10,sal)) as "10",
                          sum(decode(deptno, 20, sal)) as "20",
                          sum(decode(deptno, 30, sal)) as "30", sum(sal) as 토탈값
                               from emp;
