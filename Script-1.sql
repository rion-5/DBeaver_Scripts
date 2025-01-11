select trading_date, count(*) from stock s
group by trading_date
order by trading_date desc
limit 10;


delete from stock where trading_date = '2024-10-10';