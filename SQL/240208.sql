# 데이터베이스 이동
use ubion10;

# table whghl
select * from tran_1 ;
select * from tran_2 ;

# table union 결합 (행 추가 결합)
select * from tran_1
UNION
select * from tran_2;

# tran_1 table 과 tran_d1 table join 결합
select * from tran_1 as t1
inner join  tran_d_1 as td1
on t1.transaction_id = td1.transaction_id;

# tran_1 table 과 tran_d1 table join 결합 (원하는 컬럼만 추출)
select t1.transaction_id, t1.price, t1.payment_date, td1.item_id, td1.detail_id
from tran_1 as t1
inner join  tran_d_1 as td1
on t1.transaction_id = td1.transaction_id;

## 부서의 지역이 NEW YORK인 사원의 정보를 출력
## 사원 정보는 emp
## 부서 정보는 dept
select * from emp
left join dept
on emp.DEPTNO = dept.DEPTNO
where dept.LOC = 'NEW YORK';

## Case 2
## dept table에서 부서 지역이 new york인 부서 번호를 조회
select deptno from dept
where loc = 'new york';

select * from emp
where deptno = 10;

## 서브 쿼리문 이용
select * from emp
where deptno 
in ( select deptno from dept
	where loc = 'new york') ;
    
# 부서 지역이 new york 이거나
# dallas 인 사원의 정보를 출력하시오

# join 방식
select * from emp 
left join dept
on emp.DEPTNO = dept.DEPTNO
#where dept.loc = 'new york' or dept.loc = 'dallas';
where dept.loc in( 'new york','dallas');

# 서브쿼리 방식
select * from emp
where deptno
in (select deptno from dept
where loc = 'new york' or loc = 'dallas');

# 서브쿼리는 각각 실행하고 합치는 것이 편함

select * from emp
where deptno ;
#in
select deptno from dept
where loc in ('new york', 'dallas');

## sales records 데이터 불러오기
## 파일명에 공백이 있으면 ``로 묶어주기
select * from `sales records`;

## 그룹화
## sales records table 에서
## Region 컬럼을 기준으로 그룹화
## 그룹화 연산 Total Profit 의 합산 결과와 Region 데이터를 출력
select `Region`, sum(`total profit`) as sum from `sales records`
group by `Region` ;

select * from `sales records`;

## 대륙 별 총 이윤데이터의 합산 (조건식 : 온라인 판매를 기준으로 )

select `REGION`, sum(`total profit`) as sum_profit
from `sales records`
where `sales channel` = 'online'
group by `region`;

#having 사용방법
select `REGION`, sum(`total profit`) as sum_profit
from `sales records`
where `sales channel` = 'online'
group by `region`
having `region` = 'asia';

## 한국의 온오프라인 총 이윤의 합산을 출력해보자
select `country`, sum(`total profit`) as sum_profit , `sales channel`
from `sales records`
where `country` = 'south korea'
Group by `sales channel`;

select `country`
`sales channel`,
sum(`total profit`)
from
`sales records`
group by
`country`,
`sales channel`
having
`country` = 'south korea';