019 자에서 특정 철자의 위치 출력하기(INSTR)

정의 : 특정 철자의 자릿수를 출력하는 함수
문법:instr('smith','m')  --- 여기에 +,- 가능?  
 
예제) 
select instr('smith','m')
from dual; --- (dual 사용한 이유는 칼럼이 아닌 특정값인 smith 를 사용했기때문이다)

예제)
우리반 테이블서 이메일을 출력하고 그옆에 이메일에서 @가 몇번 자리에 있는지 출력하시오 
select email,instr(email,'@')
from emp12;
예제)
우리반 테이블에서 이메일에서 @ 앞에까지의 철자를 잘라내시오
pumadd1277@gmail.com ------ pumadd1277  이런식으로

select substr(email,1,instr(email,'@')-1)
from emp12;

예제: select replace('smith','m','k')
from dual; 

020 특정 철자를 다른 철자로 변경하기 (REPLACE)

 " 특정 철자를 다른 철자로 변경하는 함수"

예제)
select  replace('smith', 'm', 'k')
          from   dual;

select  replace('smith', 'm', 'k')
 from  dual; 

select ename,  replace(sal, 0, '*')
  from  emp;

문법:replace(컬럼명, 대체전 문자, 대체후 문자)

 select ename,
      replace(ename, substr(ename, -2, 1), '*' )
	       from emp12;

021 특정 철자를 N개 만큼 채우기(LPAD, RPAD)
정의: 항상 고정된 자리수를 보장하기 위해 필요한 함수 
문법: lpad(컬럼명,전체자리수,채워넣을값)
	- 컬럼 left 쪽에 채워넣어서 전체자리수 10개를 만들것이다. 근데 채워넣을값은  

select sal, lpad(sal,10,'*')
from emp;

022 특정 철자 잘라내기(TRIM, RTRIM, LTRIM)

정의 : 공백을 잘라낼때 많이 사용하는 함수
문법 : 컬럼(trim) , adress(rtrim), name(ltrim) 

공백 때문에 데이터 검색이 안는는 경우가 종종 있기 때문에 trim함수를 자주 사용합니다.

Rtrim : 왼쪽에 있는 공백을 잘라버리겠다.
rtrim : 오른쪽에 있는 공백을 잘라버리겠다.
trim : 양쪽에 있 공백을 잘라버리겠다. 

1.기본 Selecrt 문 
      select  컬럼명
        from 테이블명
           where 검색조건
              order by 정렬할 컬럼명 

2.함수  
    단일행 함수 : 문자,숫자,날짜,변환,일반
    복수행 함수 :  max,min,avg,sum,count 


023 반올림해서 출력하기(ROUND)            

예제)
select   round( 786.567,  -1 )
           from   dual; 

     7  8   6   .   5  6  7  
    -3 -2  -1  0  1  2  3
           
   790

설명: 소수점 이전은 바로 그 자리에서 반올림한다. 

예제)
우리반 나이의 평균값을 출력하시오 ! (반올림해서) 

select    round( avg(age), 0 ) 
   from   emp12;		

024 숫자를 버리고 출력하기(TRUNC)
숫자 함수 
   1. round : 반올림하는 함수
   2. trunc : 잘라내서 버리는 함수
   3.mod : 나눈 나머지값을 출력하는 함수 

문법: round(786.567,2) 
    
예제)
select round(786.567,2) 
    from dual;   
설명: 소수점 이후 두번째 자리를 기준으로 두고 뒤에서 반올림한다. 
      dual 쓰는 이유는 특정값에서 꺼내오는거, 컬럼이면 14개 다 뽑힌다. 
@소수점 이전은 바로 그자리에서 반올림한다.  소수점 이후와 다름.
@ truncate -1로 두고 날리면 그자리는 남기고 0으로 바뀌고 남겨둠. 

설명:trunc는 버리는 함수인데 소수점 이전은 지정된 자리를 포함해서 버리고 소수점 이후는 지정된 자리 이후부터 버린다. 

7 8 6   .  5 6 7 
-3-2-1 0 1 2 3 
0 = 위치가 . 이다 

025 나눈 나머지 값 출력하기(MOD)

예제)
select mod(10,3)
    from dual; 

나이가 짝수인지 홀수인지 구분할때 사용한다.    mod(8,2) mod(7,2) 

026 날짜 간 개월 수 출력하기(MONTHS_BETWEEN)

날짜 - 숫자 =날짜
날짜+숫자 = 날짜
날짜 -날짜 = 숫자 

오늘 날짜를 확인하는 방법 
select sysdate / +1 하면 내일 , -1 하면 어제 
from dual;

날짜에서 날짜를 빼는경우 
select ename,sysdate-hiredate
from emp;

문법: months_between(sysdate,hiredate), ---최신날짜,옛날날짜


날짜와 날짜 사이의 개월수를 출력 
--- 날짜함수 ----

1.month_between
2.add_months
3.next_day
4.last_day

027 개월 수 더한 날짜 출력하기 (ADD_MONTHS)

오늘부터 100달 뒤에 돌아오는 날짜가 몇일인가. 
문법 : add_months(sysdate,100) 
from dual;


028 특정 날짜 뒤에 오는 요일 날짜 출력하기 (NEXT_DAY)

문법:  next_day(sysdate,'월요일')
특정 날짜 뒤에 오는 요일날짜 출력하기 
예제 : 오늘부터 앞으로 바로 돌아올 월요일의 날짜를 출력하시오! 
select next_day(sysdate,'월요일') 
from dual; 

029 특정 날짜가 있는 달의 마지막 날짜 출력하기 (LAST_DAY)
 
문법 : select sysdate,last_day(sysdate)
            from dual;

함수 
1.단일행 함수 : 문자함수,   숫자함수,          날짜함수,                변환함수,일반함수 
                     upper       round         months_between
                     lower        trunc             add_months 
                    initcap        mod               next_day
                     subsrt                            
                     instr
                     replace                 
                    lpad/rpad
                    trim/rtrim/ltrim
     
030 문자형으로 데이터 유형 변환하기 (TO_CHAR)

정의 : 숫자형 데이터를 문자형 데이터로 변환하는것 

문법: to_char(sysdate,'day')
'day' 는 요일을 출력하게 해주는것
'sysdate' 는 현재 서버의 날짜. 
예: 오늘이 무슨 요일인지 출력하고 싶다면 select  to_char(sysdate,'day')
                                                           from dual;

설명: to_date 함수로 날짜로 변환해주어야 합니다.)

                                   현재 내가 접속한 세션의 날짜 형식을 확인 
                                    select*
                               from nls_session_parameters; ---National Language Support
                                nls_date_fromat 


*미국의 오라클 환경으로 날짜 형식을 변경해본다. 
alter session set nls_date_format = 'RR/MM/DD';

년도 : RRRR.,YYYY,RR,YY
월 : MM,MON
일 : DD 
시간 : HH,HH24 
분 : MI
초 : SS 
요일 : day, dy, d 

select ename,hiredate, to_char(hiredate, 'day') =월요일 
                              to_char(hiredate, 'dy') = 월
                              to_char(hiredate,'d') =숫자
 
      RR                                                 VS                                   YY 

      81                                                                                       81
1981  2081                                                                            1981     2081 
    2020 
현재연도에서 가장                                                                 YY 는 현재 세기로 인식   
가까운 연도를 선택


69.사원 테이블에서 이름을 출력하고 그 옆에 이름의 끝철자를 출력하는데 끝 철자를 소문자로 출력하시오

select ename,upper(substr(ename,-1,1))
from emp12;
 
71.사원 테이블에서 이름 월급을 출력하는데, 월급을 출력할때 숫자 0을 *로 출력하시오 

select ename,replace(sal,0,'*')
from emp;

72.우리반 테이블에서 이름을 출력하고 그옆에 이름에 두번째 철자를 출력하시오! 

select substr(ename,2,1)
from emp12;

73.아산병원의 전광판을 구현하시오! (유*수,성*창)

select ename,replace(ename,substr(ename,2,1),'*')
from emp12;

74.남궁솔미 데이터를 입하고 남궁*미로 출력되게 위의 SQL을 다시 작성하시오 (73연결)

select ename,replace(ename,substr(ename,-2,1),'*')
from emp12;

75.경기도에 사는 학생들의 이름과 주소를 출력하시오 ! 와일드 카드를 양쪽에 사용하지 
말고 한쪽에만 사용해서 출력하시오

select ename,address
from emp12
where ltrim(address) like '경기도%';

76.정보통계학과가 전공인 학생의 이름과 나이와 전공을 출력하시오

select ename,age,major
from emp12
where trim(major) like '%정보통계학과%';

77.우리반 나이의 평균값을 출력하시오 avg(age)

select avg(age)
from emp12;

78.위의 결과를 반올림해서 소수점 이후는 안나오게 하시오

select round(avg(age),0) / 아니면 그냥 닫기.
from emp12;

78.우리반에서 나이가 짝수인 학생들의 이름과 나이를 출력하시오 

select ename,age,mod(age,2) 
from emp12
where mod(age,2)=0;

80.select ename,sysdate-hiredate from emp; 이결과에서 소수점 이하는 안나오게 반올림하시오

select ename,round(sysdate-hiredate,0)
from emp;

81.이름,입사한 날짜부터 오늘까지 총 몇주 근무했는지 출력하시오 

select ename,round(round(sysdate-hiredate,0)/7,0)
from emp;

82.이름,입사한 날짜부터 오늘까지 총 몇 달 무했는지 출력하시오 
select ename, round(months_between(sysdate,hiredate))
  from emp;

83. King은 467달을 근무했습니다 

select ename||'은'||round(months_between(sysdate,hiredate))||'달을 근무했습니다'
  from emp;

84.오늘 날짜에서 100달 뒤에 돌아오는 목요일의 날짜를 출력하시오
select next_day(add_months(sysdate,100),'목요일')
from dual;

85.81/11/17 일에 입사한 사원의 이름과 입사일을 출력하시오 .
select ename,hiredate
from emp
where hiredate='81/11/17';

86.이름,입사일,입사한 요일을 출력하시오

select ename,hiredate,to_char(hiredate,'day')
from emp;

87.수요일에 입사한 사원들의 이름과 입사일을 출력하시오.

select ename,hiredate,to_char(hiredate,'day')
from emp
where to_char(hiredate,'day') = '수요일'

88.내가 무슨 요일에 태어났는지 확인하시오. (to_date로 변환하는 기능을 알아야함.)

select to_char(to_date('92/01/14','RR/MM/DD'),'day')
from dual;

89.카페에 답글로 올리세요~
이름,입사한 요일을 출력하는데 
입사한 요일이 일월화수목금토 순으로 

90.마지막문제 이메일을 출력하고 그 옆에 이메일의 도메인을 출력하시오 ex) gmail,naver 

select substr(email,instr(email,'@')+1, instr(email,'.'))
                 from emp12; 