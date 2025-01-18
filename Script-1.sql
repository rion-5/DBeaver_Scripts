select trading_date, count(*) from stock s
group by trading_date
order by trading_date desc
limit 10;


delete from stock where trading_date = '2024-10-10';


SELECT trading_date, close
FROM stock
WHERE symbol = 'TSLA'
  AND trading_date >= CURRENT_DATE - INTERVAL '14 DAYS'
ORDER BY trading_date;


delete from stock_data;

select trade_date, count(*) from stock_data
group by  trade_date 
order by trade_date desc;


select * from stock where trading_date = '2025-01-17';

select * from stock_data;

insert into stock_data (ticker,trade_date,open_price,high_price,low_price, close_price, volume) 
 select symbol,trading_date, open, high, low, close, volume from stock ;