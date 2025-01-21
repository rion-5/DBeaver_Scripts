--update 교원조회및인사카드출력 
--set 학기 = 202402
--where 학기 is null;

select * from 교원조회및인사카드출력
where 성명 ='심현우';

select * from 교원조회및인사카드출력
where 재직구분 = '재직'
and 직종 = '강사'
and 학과 = '경제학부';