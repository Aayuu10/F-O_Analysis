CREATE MATERIALIZED VIEW option_chain_summary AS
SELECT 
    c.expiry_dt,
    c.strike_price,
    SUM(t.volume) AS total_volume
FROM trade_data t
JOIN contracts c ON t.contract_id = c.contract_id
GROUP BY c.expiry_dt, c.strike_price;