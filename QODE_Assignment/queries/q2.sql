SELECT 
    i.symbol,
    t.timestamp,
    STDDEV(t.close) OVER (
        PARTITION BY i.symbol
        ORDER BY t.timestamp
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS volatility
FROM trade_data t
JOIN contracts c ON t.contract_id = c.contract_id
JOIN instruments i ON c.instrument_id = i.instrument_id
WHERE i.symbol LIKE 'NIFTY%';