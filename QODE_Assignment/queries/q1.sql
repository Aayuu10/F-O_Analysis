WITH oi_calc AS (
    SELECT 
        i.symbol,
        t.timestamp,
        t.open_interest,
        LAG(t.open_interest) OVER (
            PARTITION BY i.symbol 
            ORDER BY t.timestamp
        ) AS prev_oi
    FROM trade_data t
    JOIN contracts c ON t.contract_id = c.contract_id
    JOIN instruments i ON c.instrument_id = i.instrument_id
)
SELECT 
    symbol,
    SUM(open_interest - prev_oi) AS total_oi_change
FROM oi_calc
WHERE prev_oi IS NOT NULL
GROUP BY symbol
ORDER BY total_oi_change DESC
LIMIT 10;