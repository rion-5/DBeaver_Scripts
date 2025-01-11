-- delete from 학적대장조회내역;
--update 학적대장조회내역
--set 학기 = 202402
--where 학기 is null;


-- cbe api : 학과(부)별 재학생 수

select 학과, count(*) from 학적대장조회내역
where  학기 = 202402 and 
학적상태 = '재학생'
group by 학과
ORDER BY array_position(ARRAY['경제학부','경영학부','보험계리학과','회계세무학과'], 학과::text), count(*) DESC;

-- cbe api : 학과(부)별 외국인 재학생 수

select 학과 department, 국적 nationality, count(*) count from 학적대장조회내역
        where 학적상태 ='재학생'
        and 학기 = 202402
        and 국적<>'대한민국'
        group by 학과, 국적
        ORDER BY array_position(ARRAY['경제학부','경영학부','보험계리학과','회계세무학과'], 학과::text), count(*) desc;
       
       
       
select 학과 department, 국적 nationality, 학적상태 academic_status from 학적대장조회내역
where 학기 = 202402
ORDER BY array_position(ARRAY['경제학부','경영학부','보험계리학과','회계세무학과'], 학과::text),
array_position(ARRAY['대한민국','중국'], 국적::text), 학적상태 ;
;

select * from 학적대장조회내역
limit 10;

select 입학전형, 정원내외구분 , count(*) from 학적대장조회내역
group by 입학전형, 정원내외구분   
order by 정원내외구분,count(*) desc;

select 모집단위,정원내외구분, 입학전형, count(*)   from 학적대장조회내역 
where 모집단위 in ('경제학부(영어트랙)','경영학부(영어트랙)') 
and 학기 = 202402
group by 모집단위,정원내외구분, 입학전형   ;

select 모집단위 , 국적 ,count(*)  from 학적대장조회내역 
where 모집단위 in ('경제학부(영어트랙)','경영학부(영어트랙)') 
and 학기 = 202402
group by 모집단위,국적    
order by 모집단위 desc,  count(*) desc ;

select 모집단위 , 학년, 국적 ,count(*)  from 학적대장조회내역 
where 모집단위 in ('경제학부(영어트랙)','경영학부(영어트랙)') 
and 학기 = 202402
group by 모집단위,학년,국적    
order by 모집단위 desc,학년,  count(*) desc ;

select 모집단위 , 학년, count(*)  from 학적대장조회내역 
where 모집단위 in ('경제학부(영어트랙)','경영학부(영어트랙)') 
and 학기 = 202402
group by 모집단위,학년    
order by 모집단위 desc,학년,  count(*) desc ;

select  학년, count(*)  from 학적대장조회내역 
where 모집단위 in ('경제학부(영어트랙)','경영학부(영어트랙)') 
and 학기 = 202402
group by 학년    
order by 학년,  count(*) desc ;

select * from 학적대장조회내역 
where 거주지주소 like '%길음%';

select 학과, 학적상태, 국적 from 학적대장조회내역 where  학기 = 202402 and 학적상태 = '재학생' ;


-- 영어트랙
select * from 학적대장조회내역  where 학기 = 202402 and 모집단위 in ('경제학부(영어트랙)','경영학부(영어트랙)');

select 국적,count(*) from 학적대장조회내역  where 학기 = 202402 and 모집단위 in ('경제학부(영어트랙)','경영학부(영어트랙)')
group by 국적 
;
