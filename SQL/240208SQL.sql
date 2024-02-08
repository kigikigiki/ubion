# 데이터베이스 이동
use ubion10;

# table whghl
select * from tran_1 ;
select * from tran_2 ;

# table union 결합 (행 추가 결합)
select * from tran_1
UNION
select * from tran_2;

