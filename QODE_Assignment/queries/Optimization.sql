EXPLAIN ANALYZE
SELECT 
    i.symbol,
    MAX(t.volume)
FROM trade_data t
JOIN contracts c ON t.contract_id = c.contract_id
JOIN instruments i ON c.instrument_id = i.instrument_id
WHERE t.timestamp >= NOW() - INTERVAL '30 days'
GROUP BY i.symbol;