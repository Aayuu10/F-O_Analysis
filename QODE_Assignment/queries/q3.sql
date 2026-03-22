SELECT 
    e.exchange_name,
    AVG(t.close) AS avg_settle_price
FROM trade_data t
JOIN exchanges e ON t.exchange_id = e.exchange_id
JOIN contracts c ON t.contract_id = c.contract_id
JOIN instruments i ON c.instrument_id = i.instrument_id
WHERE 
    (e.exchange_name = 'MCX' AND i.symbol = 'GOLD')
    OR
    (e.exchange_name = 'NSE' AND i.instrument_type = 'FUTURE')
GROUP BY e.exchange_name;