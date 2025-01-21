delete  from 취업통계졸업생명단;

select 학과명, 성별, 졸업년월, 출신고교,외국인학생, 회사명, 
	부서, 근무지,평점평균, 입학전형명, 인턴십현장실습인정학점,토익점수, 교환유학생여부, 취업구분 
from 취업통계졸업생명단

;

select 출신고교, count(*)
from 취업통계졸업생명단
where 회사명 is not null and 회사명 !=''
group by 출신고교 
having count(*) > 5
order by count(*) desc
;

select 회사명 , count(*)
from 취업통계졸업생명단
where 회사명 is not null and 회사명 !=''
group by 회사명 
having count(*) > 2
order by count(*) desc
;

select 취업구분  , count(*)
from 취업통계졸업생명단
where 1=1
group by 취업구분 
order by count(*) desc
;

SELECT 평점평균 FROM 취업통계졸업생명단;

select 토익점수  from 취업통계졸업생명단 where 토익점수 > 900; 


SELECT department_name, gender, graduation_date, 
       high_school, international_student,
       company_name, department, workplace, 
       gpa, admission_method, internship_credits,
       toeic_score, exchange_student, employment_type
FROM employment_statistics_graduates;