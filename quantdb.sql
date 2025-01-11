-- 최근 거래일 15일의 시작일과 종료일 
select min(trading_date) as start_date, 
	   max(trading_date) as end_date
from (select distinct trading_date from stock order by trading_date desc limit 15);
      
        
-- 조건: 최근 15일 거래일간 조정종가(adjusted)가 100~1000달러이면서 거래량이 8000000 이상이 13회 이상인 종목
WITH DateRange AS (
  SELECT MIN(trading_date) AS start_date,
         MAX(trading_date) AS end_date
  FROM (SELECT DISTINCT trading_date
        FROM stock
        ORDER BY trading_date DESC LIMIT 15)
)
select symbol, count(*),
		round(min(adjusted)::numeric,2) as min_adjusted,
		round(avg(adjusted)::numeric,2) as avg_adjusted,
		round(max(adjusted)::numeric,2) as max_adjusted,
		round(min(volume)::numeric,0) as min_volume,
		round(max(volume)::numeric,0) as max_volume
FROM stock
WHERE trading_date BETWEEN (SELECT start_date FROM DateRange)
                      AND (SELECT end_date FROM DateRange)
and adjusted between 100 and 1000
and volume >= 8000000
group by symbol
having count(*) >= 13
order by min_volume desc;

  -- 조건: 최근 15일 거래일간 조정종가(adjusted)가 1000달러이상이면서 13회 이상인 종목
WITH DateRange AS (
  SELECT MIN(trading_date) AS start_date,
         MAX(trading_date) AS end_date
  FROM (SELECT DISTINCT trading_date
        FROM stock
        ORDER BY trading_date DESC LIMIT 15)
)
select symbol, count(*),
		round(min(adjusted)::numeric,2) as min_adjusted,
		round(avg(adjusted)::numeric,2) as avg_adjusted,
		round(max(adjusted)::numeric,2) as max_adjusted,
		round(min(volume)::numeric,0) as min_volume,
		round(max(volume)::numeric,0) as max_volume
FROM stock
WHERE trading_date BETWEEN (SELECT start_date FROM DateRange)
                      AND (SELECT end_date FROM DateRange)
and adjusted >=1000
group by symbol
having count(*) >= 13
order by min_volume desc;                    

--미국주식 휴장일
select * from market_holidays;

SELECT holiday_date
FROM market_holidays
WHERE EXTRACT(YEAR FROM holiday_date) = 2024;


CREATE TABLE public.stock2 (
	symbol varchar(10) NULL,
	trading_date date NOT NULL,
	"open" numeric(15, 4) NULL,
	high numeric(15, 4) NULL,
	low numeric(15, 4) NULL,
	"close" numeric(15, 4) NULL,
	volume int8 NOT NULL,
	adjusted numeric(15, 4) NULL,
	insert_date date NOT NULL,
	CONSTRAINT stock2_unique UNIQUE (symbol, trading_date)
);

-- delete from stock where trading_date = '2024-11-11';

-- 조건: 특정주
WITH DateRange AS (
  SELECT MIN(trading_date) AS start_date,
         MAX(trading_date) AS end_date
  FROM (SELECT DISTINCT trading_date
        FROM stock
        ORDER BY trading_date DESC LIMIT 15)
)
select symbol, count(*),
		round(min(adjusted)::numeric,2) as min_adjusted,
		round(avg(adjusted)::numeric,2) as avg_adjusted,
		round(max(adjusted)::numeric,2) as max_adjusted,
		round(min(volume)::numeric,0) as min_volume,
		round(max(volume)::numeric,0) as max_volume
FROM stock
WHERE trading_date BETWEEN (SELECT start_date FROM DateRange)
                      AND (SELECT end_date FROM DateRange)
and symbol in ('APP','TSLA','AAPL','GOOG')
group by symbol

order by min_volume desc;  


SELECT trading_date, symbol, adjusted, volume FROM stock where symbol='TSLA' and trading_date <= '2024-12-27';

