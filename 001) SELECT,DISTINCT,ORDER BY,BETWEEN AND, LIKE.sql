※ SQL 작성시 주의사항! 

1. SQL 은 대소문자를 구분하지 않는다. (But DATA does) 
예) SELECT ENAME,SAL FROM EMP; -- 가능 
    Select ename,sal from emp; -- 가능 
2. SQL 을 한줄로 작성하지 말고   
     절은 다음 라인으로 분리해서 작성한다. 
     
3. 들여쓰기를 해서 SQL 의 가독성을 높인다.

@결과 화면의 가로사이즈 조절하는 명령어 : Set lines 300
@ / 하고 엔터 를 치면 방금 수행했던 SQL 을 실행할수 있다
@결과 화면에서 세로 사이즈 조절하는 명령어 : set pages 400
@테이블 모든 열 (COLLUM)  출력하기 : select *
(*을 asterisk 라고 하고 모든 컬럼을 다 선택할 때 사용.)

@describe 와 "*" 차이를 조심하기 

※ 설명 dept는 부서 테이블이고 컬럼은 3개가 있는데 다음과 같습니다. 
Deptno : 부서번호
Dname : 부서명
Loc : 부서위치

001 테이블에서 특정 열 (COLUMN선택하기) 

select : 조회해라, 선택해라
ename, sal : COLUMN
from : 로부터
emp : 테이블 

002 테이블 모든 Columm 출력 

select * from emp

003 컬럼 별칭을 사용하여 출력되는 컬럼명 변경하기 (원본은 변하지 않는다)

"컬럼 별칭은 컬럼명 대신에 다른 컬럼명을 지정할 때 사용하는 문법입니다"
예: select ename as 이름, sal as 월급 
※ 컬럼명 뒤에 as 를 쓰고 그리고 컬럼별칭을 작성한다.
   결과가 출력될 때 컬럼별칭이 출력된다.
    as는 생략 가능합니다. 

※ 설명: 컬럼별칭에 대소문자를 구분하고 싶다거나 
          공백문자나 특수문자를 넣으려면 양쪽에
          Dobule 쿼테이션 마크를 둘러주어야 한다. 

004 연결 연산자 사용하기 (||)

"연결 연산자는 두 Columm 의 데이터를 연결해서 출력하는 연산자"
 select ename || '의 월급은' || sal from emp;

@edit or ed : 메모장 수정--- 저장 

005 중복된 데이터를 제거해서 출력하기 (distinct) 

'distinct' 키워드를 컬럼명 앞에 작성하고 실행하면 중복된 데이터를 제거하고 출력할 수 있습니다.
select distinct job from emp;

예: select job
From emp;   --- 중복된것이 나온다. 

select distinct job, sal, ename 
from emp;

006데이터를 정렬해서 출력하기 (order by)

order by 절은 데이터를 정렬하는 절이고 select 문장 맨 마지막에 기술합니다.
예) select ename, sal 

    from emp
        order by sal asc; 
                     ↓
               정렬할 컬럼명 
정렬방법 1. asc : 낮은값부터 높은값순으로 
        2. desc : 높은값부터 낮은순으로

*Order by 절에 컬럼을 여러개를 작성할 수있다. 

Select ename,deptno,sal
From emp
Order by deptno asc, sal desc;
(order by 2 asc, 3 desc;)
Select 이후의 순서대로 숫자를 입력하면 됨.
두개를 써서 정렬을 할 수 있다. 두개의 조건   

007 Where 절 배우기 1 (숫자 데이터 검색)

"where 절을 사용하면 특정 값에 대한 데이터만 선별해서 출력할수 있다"
예)
select ename,sal
From emp
where sal=3000;

008 Where 절 배우기 2 (문자와 날짜 검색)

where 절로 데이터를 검색할 때 숫자와는 다르게 
문자와 양쪽에 싱글 퀘티이션 마크를 둘러줘야합니다.
예)select ename,sal
from emp
where ename='SCOTT';

※SQL은 대소문자를 구분하지 않으나 데이터는 대소문자를 구분합니다. 
싱글 쿼테이션 마크안에 있는 데이터는 문자 또는 날짜이다 라고 오라클에게 알려주는 것임. 

@ 날짜 검색을 할때는 년도/월/일 순으로 검색을 하면 되는데
나라마다 순서가 다를 수 있다. 미국이나 영국에서의 날짜 검색은    
일/월/년도 순서 입니다. 

009 산술 연산자 배우기 (*, /, +, -)

예) select ename,sal, (sal + 3000) * 12 
From emp;

010 비교 연산자 배우기 1 (〉, 〈, 〉=,〈=, =, !=,〈〉, ^=)
                                    요 3개는 같지 않다를 의미함 

※ 더블 쿼테이션 마크는 오라클 전체를 통틀어 딱 한번만 사용되는데 
컬럼별칭 사용할때 공백문자,특수문자,대소문자를 구분해서 컬럼별칭을  출력하고자 할때만 사용한다. 나머지 경우는 다 싱글입니다. 

*SQL developer 설치
이툴은 도스장을 이용하지 않고 오라클에 접속해서 메모장같은 화면에서 편하게 SQL을 작성할 수 있게 하는 툴이다. 

011 비교 연산자 배우기 2 (BETWEEN AND)
Between 숫자,문자,날짜 AND 숫자,문자,날짜

012 비교 연산자 배우기 3 (LIKE)
예제 : 이름의 첫글자가 S로 시작하는 사원들의 이름을 출력하시오!
Select ename
From emp
Where ename like 's%';

설명 : Like 는 ~일 것같은 이라는 영어 뜻처럼 이름의 첫번째 철자가 S로 시작할것 같은과 같은것이다. 
       %는 와일드 카드로 이자리에 뭐가 와도 관계 없다.
       그 철자의 갯수가 몇개가 되도 관계가없다.

Like 와 같이 쓸수 있는 키워드 2개 
% : 와일드 카드 : 이자리에 뭐가 와도 관계 없고 그갯수가 몇개가 되던 관계없다.
_ : 언더바 : 이자리에 뭐가 와도 관계없는데 자릿수는 한개여야 한다. 


오라클에 접속을 하기 위해서는 접속 정보를 알아야 합니다. 
1.데이터 베이스 서버의 IP주소(건물 주소) (HOST=127.0.0.1)
2.포트번호(건물내의 통로 번호)  (PORT=1521)
3.오라클 인스턴스 이름(SID) (건물내의 특정 회사 이름) orcl

위의 정보를 알아내는 명령어 : 도스창을 열고 lsnrctl status -- enter 

건물에 있는 경비원 아저씨에게 물어보면 된다. 
도스창을 열고 lsnrctl status

Developer 
도구--환경설정--글꼴 (글짜 크기 변경가능)
Control --Enter  



3.  emp 테이블의 컬럼이 무엇무엇이 있는지 확인 하시오!

describe emp

4. 이름,월급,커미션을 출력하시오

select ename,sal,comm from emp;

5. 이름,직업,입사일 부서번호를 출력하시오!
select ename,job,hiredate,deptno from emp;

6. emp 테이블에 모든 컬럼을 검색하시오 

describe emp;

7. dept 테이블의 모든 컬럼을 출력하시오

describe dept;

9.이름과 월급을 출력하는데 컬럼명이 아래와 같이 출력되게 하시오! (Employee name, Salary )
 
 select ename as 'Employee name'
      sal as 'Salary' from emp;

10.아래와 같이 결과를 출력하시오
(KING 의 직업은 PRESIDENT 입니다  
SCOTT 의 직업 ANALYST 입니다) 

select ename ||'의 직업은'|| job ||'입니다' from emp;
                      
11. 위의 과에서  출력되는 컬럼명을 사원정보라는 한글로 출력되게 하시오

select ename ||'의 직업은'|| job ||'입니다'  as 사원정보 from emp;

12. 부서번호를 출력하는데 중복을 제거해서 출력하시오.
 
select distinct deptno from emp;

13.이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오
 
 select ename,sal
  from emp
    order by sal desc;

14. 이름과 입사일을 출력하는데 최근에 입사한 사원부터 출력하시오

select ename,hiredate
 from emp
    order by hiredate desc;

15.이름과 직업과 입사일을 출력하는데 직업은 ABCD 순으로 정렬해서 출력하고 직업을 ABCD 순으로 정렬한걸 기준으로 입사일을
먼저 입사한 사원부터 출력되게 하시오 (order by 는 한번만 입력하면 된다) 

select ename,job,hiredate
  from emp
    order by 2 asc, 3 asc;

16.사원번호가 7788번인 사원의 사원번호와 이름과 월급을 출력하시오

select ename,empno,sal
  from emp
    where empno=7788;

17.30번 부서번호에서 근무하는 사원들의 이름과 월급과 부서번호를 출력하시오

select ename,sal,deptno
 from emp
   where deptno=30;

18. 위의 결과를 다시 출력하는데 월급이 높은 사원부터 출력하시오 (17연결)

select ename,empno,sal
  from emp
  where empno=7788
   order by sal desc;

19.부서번호가 20번인 사원들의 이름과 입사일과 부서번호를 출력하는데 최근에 입사한 사원부터 출력하시오.

select ename,hiredate,deptno
 from emp
   where deptno=20
     order by hiredate desc;

20.직업이 SALESMAN인 사원들의  이름과 월급과 직업을 출력하시오 
 select ename,sal,job
  from emp
    where job='SALESMAN';

21.81년 11월 17일에 입사한 사원의 이름과 입사일을 출력하시오
 
 select ename,hiredate
  from emp
    where hiredate='81/11/17';

22.이름과 연봉(sal*12)을 출력하는데 컬럼명을 한글로 이름,연봉으로 출력하시오

select ename as 이름, sal*12 as 연봉
 from emp;

23.위의 결과를 다시 출력하는데 연봉이 36000인 사원들의 이름과 연봉을 출력하시오 (22연결)

select ename as 이름, sal*12 as 연봉
    from emp
   where sal*12=36000;

24.이름과 연봉을 출력하는데 연봉이 높은 사원부터 출력하시오 

select ename as 이름, sal*12 as 연봉
  from emp
  order by 2 desc;
  코딩순서 : select ---from---order by
  실행순서 : from---select---order by
 
 25. 커미션이 150 이상인 사원들의 이름과 커미션을 출력하시오 

select ename,sal
   from emp
  where sal<=2400
    order by sal desc;

26.아래의 SQL 에서 더하기 가 먼저 실행되게 하려면?

select ename, (sal +200) * 20
From emp; 

27.월급이 3000이상인 사원들의 이름과 월급을 출력하시오 
 
 select ename,sal
   from emp
   where sal>=3000;

28.직업이 SALESMAN 이 아닌 사원들의 이름과 직업을 출력하시오

select ename,job
    from emp
   where job<>'SALESMAN';

29.월급이 2400 이하인 사원들의 이름고 월급을 력하는데 월급이 높은 사원부터 출력하시오.

select ename,sal
    from emp
    where sal<=2400
  order by sal desc;

30.월급이 1000에서 3000사이인 사원들의 이름과 월급을 출력하시오 

Select ename,sal
From emp
Where sal between 1000 and 3000;
 또는
Select ename,sal
From emp
Where sal>=1000 and sal <=3000;

31.월급이 1000에서 3000사이가 아닌 사원들의 이름과 월급을 출력 하시오 

select ename,sal
   from emp
   where sal not between 1000 and 3000; 
     (not 을 사용하기) 

32.1981년도에 입사한 사원들의 사원들의 이름과 입사일을 출력하시오.
 
 select ename,hiredate
  from emp
  where hiredate between '81/01/01' and '81/12/31';

33.이름의 끝 글자가 T로 끝나는 사원들의 이름을 출력하시오 

select ename
    from emp
  where ename like '%T';

34. 81년도에 입사한 사원들의 이름과 입사일을 출력하는데 between and 사용하지 말고 Like 로 

select ename
from emp
 where hiredate like '81%';

35.이름의 두번째 철자가 M인 사원들의 이름을 출력하시오!

Select name
  From emp
    Where ename like '_M%';

36.이름의 세번째 철자가 A인 사원들의이름. 

select ename 
  from emp
    where ename like '__M%';