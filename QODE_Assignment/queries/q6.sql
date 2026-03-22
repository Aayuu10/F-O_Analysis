SELECT 
    i.symbol,
    t.timestamp,
    (t.close - t.open) AS price_change
FROM trade_data t
JOIN contracts c ON t.contract_id = c.contract_id
JOIN instruments i ON c.instrument_id = i.instrument_id;