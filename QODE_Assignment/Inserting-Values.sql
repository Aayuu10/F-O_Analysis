COPY raw_data
FROM '/Users/aayuu/Documents/QODE_Assignment/cleaned_fno.csv'
DELIMITER ','
CSV HEADER;

INSERT INTO exchanges (exchange_name) VALUES ('NSE'), ('BSE'), ('MCX');

INSERT INTO instruments (exchange_id, symbol, instrument_type)
SELECT DISTINCT
    1,  -- NSE
    symbol,
    instrument
FROM raw_data;

INSERT INTO contracts (instrument_id, expiry_dt, strike_price, option_type)
SELECT DISTINCT
    i.instrument_id,
    r.expiry_dt,
    r.strike_pr,
    r.option_typ
FROM raw_data r
JOIN instruments i 
    ON r.symbol = i.symbol;

INSERT INTO trade_data (
    contract_id, timestamp, open, high, low, close, volume, open_interest
)
SELECT
    c.contract_id,
    r.timestamp,
    r.open,
    r.high,
    r.low,
    r.close,
    r.contracts,      
    r.open_int
FROM raw_data r
JOIN instruments i 
    ON r.symbol = i.symbol
JOIN contracts c 
    ON c.instrument_id = i.instrument_id
   AND c.expiry_dt = r.expiry_dt
   AND (c.strike_price = r.strike_pr OR c.strike_price IS NULL);