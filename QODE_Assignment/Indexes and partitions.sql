-- Indexes
CREATE INDEX idx_trades_symbol 
ON trades (instrument_id);

CREATE INDEX idx_trades_timestamp 
ON trades (timestamp);

CREATE INDEX idx_trades_exchange 
ON trades (exchange_id);

-- BRIN index for large time-series
CREATE INDEX brin_trades_timestamp 
ON trades USING BRIN (timestamp);

-- Composite index for heavy queries
CREATE INDEX idx_trades_symbol_time 
ON trades (instrument_id, timestamp);

-- Partition by exchange (example)
CREATE TABLE trades_partitioned (
    LIKE trades INCLUDING ALL
) PARTITION BY LIST (exchange_id);

-- Example partitions
CREATE TABLE trades_nse PARTITION OF trades_partitioned
FOR VALUES IN (1);

CREATE TABLE trades_bse PARTITION OF trades_partitioned
FOR VALUES IN (2);

CREATE TABLE trades_mcx PARTITION OF trades_partitioned
FOR VALUES IN (3);
