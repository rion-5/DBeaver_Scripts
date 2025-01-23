select ticker, count(*) from stock_data where trade_date between '2025-01-02' and '2025-01-22' 
and close_price between 100 and 1000 and volume >= 5000000
group by ticker
having count(*) >= (select count(distinct trade_date) from stock_data where trade_date between '2025-01-02' and '2025-01-22') -2
;
