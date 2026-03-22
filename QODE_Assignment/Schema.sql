-- Exchanges
CREATE TABLE exchanges (
    exchange_id SERIAL PRIMARY KEY,
    exchange_name VARCHAR(10) UNIQUE NOT NULL
);

-- Instruments
CREATE TABLE instruments (
    instrument_id SERIAL PRIMARY KEY,
    exchange_id INT REFERENCES exchanges(exchange_id),
    symbol VARCHAR(50) NOT NULL,
    instrument_type VARCHAR(20)
);

-- Contracts
CREATE TABLE contracts (
    contract_id SERIAL PRIMARY KEY,
    instrument_id INT REFERENCES instruments(instrument_id),
    expiry_dt DATE,
    strike_price NUMERIC,
    option_type VARCHAR(5)
);

-- Trade Data
CREATE TABLE trade_data (
    trade_id BIGSERIAL PRIMARY KEY,
    contract_id INT REFERENCES contracts(contract_id),
    timestamp TIMESTAMP,
    open NUMERIC,
    high NUMERIC,
    low NUMERIC,
    close NUMERIC,
    volume BIGINT,
    open_interest BIGINT
);
-- RAW data table for inserting CSV
CREATE TABLE raw_data (
    instrument VARCHAR,
    symbol VARCHAR,
    expiry_dt DATE,
    strike_pr NUMERIC,
    option_typ VARCHAR(5),

    open NUMERIC,
    high NUMERIC,
    low NUMERIC,
    close NUMERIC,
    settle_pr NUMERIC,

    contracts BIGINT,
    val_inlakh NUMERIC,

    open_int BIGINT,
    chg_in_oi BIGINT,

    timestamp DATE
);