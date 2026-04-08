# 📊 F&O Data Analytics System (Qode Assignment)

## 📌 Overview

This project implements a scalable relational database system to store and analyze high-volume Futures & Options (F&O) data using PostgreSQL. It demonstrates end-to-end data engineering capabilities including data ingestion, normalization (3NF), advanced SQL analytics, and performance optimization.

The system is designed to support multi-exchange analysis (NSE, BSE, MCX) and handle large-scale time-series trading data efficiently.

---

## 🏗️ Repository Structure

```
/Qode_Assignment
 ├── Schema.sql                     # Table creation (DDL)
 ├── Indexes and partition.sql     # Indexing & partitioning strategies
 ├── queries/                      # SQL queries for analytics
 ├── Loading_DATA.ipynb            # Data ingestion (ETL pipeline)
 ├── ER_Diagram.png                # Database design (ER diagram)
 ├── Explanation.pdf               # Design reasoning document
```

---

## ⚙️ System Architecture

The database follows a **3NF normalized schema**:

* **Fact Table**

  * `trade_data`: Stores time-series OHLC, volume, and open interest data

* **Dimension Tables**

  * `exchanges`: Exchange metadata
  * `instruments`: Unique symbols and instrument types
  * `contracts`: Derivative definitions (expiry, strike, option type)

### Relationships

* Exchanges → Instruments (1)
* Instruments → Contracts (1)
* Contracts → Trade Data (1)

---

## 🔄 Data Pipeline (ETL)

1. **Extract**

   * Kaggle NSE F&O dataset (3M records)

2. **Transform**

   * Cleaned using Python (Pandas)
   * Fixed date formats and null values
   * Standardized column names

3. **Load**

   * Data first loaded into `raw_data` (staging table)
   * Transformed and inserted into normalized tables

---

## 📊 Key SQL Analytics

### 🔹 Open Interest (OI) Change

* Used `LAG()` window function to track OI trends

### 🔹 Volatility Analysis

* 7-day rolling standard deviation using `STDDEV()`

### 🔹 Cross-Exchange Comparison

* Compared average settlement prices between:

  * NSE (index futures)
  * MCX (gold futures - simulated)

### 🔹 Option Chain Summary

* Aggregated volume by expiry date and strike price

### 🔹 Performance Query

* Max volume in last 30 days optimized with indexes

---

## 🚀 Performance Optimization

### Indexing

* B-tree indexes on:

  * `timestamp`
  * `contract_id`
  * `symbol`
* Composite index:

  * `(contract_id, timestamp)`

### Partitioning

* Suggested partitioning of `trade_data` by:

  * exchange OR expiry date

### Query Optimization

* Window functions used instead of subqueries
* Reduced full table scans using indexed filters

---

## 🔀 Cross-Exchange Support

Since the dataset contains only NSE data:

* MCX data (gold futures) was simulated
* Enabled cross-exchange comparison queries

---

## 📈 Scalability

The system is designed to scale to **10M+ rows** using:

* Efficient indexing strategies
* Partitioning for large datasets
* Normalized schema to reduce redundancy

---

## 🛠️ Tech Stack

* PostgreSQL
* Python (Pandas, SQLAlchemy)
* dbdiagram.io (ER design)

---

## 🎯 Key Learnings

* Designing normalized schemas for financial data
* Handling real-world messy datasets
* Writing optimized SQL queries for time-series analysis
* Implementing scalable data pipelines

---

## 📬 Conclusion

This project demonstrates a production-style data engineering workflow, combining database design, ETL processing, and analytical querying to derive insights from high-volume trading data.**Load**

* Data first loaded into `raw_data` (staging table)
* Transformed and inserted into normalized tables

---

## 📊 Key SQL Analytics

### 🔹 Open Interest (OI) Change

* Used `LAG()` window function to track OI trends

### 🔹 Volatility Analysis

* 7-day rolling standard deviation using `STDDEV()`

### 🔹 Cross-Exchange Comparison

* Compared average settlement prices between:

  * NSE (index futures)
  * MCX (gold futures - simulated)

### 🔹 Option Chain Summary

* Aggregated volume by expiry date and strike price

### 🔹 Performance Query

* Max volume in last 30 days optimized with indexes

---

## 🚀 Performance Optimization

### Indexing

* B-tree indexes on:

  * `timestamp`
  * `contract_id`
  * `symbol`
* Composite index:

  * `(contract_id, timestamp)`

### Partitioning

* Suggested partitioning of `trade_data` by:

  * exchange OR expiry date

### Query Optimization

* Window functions used instead of subqueries
* Reduced full table scans using indexed filters

---

## 🔀 Cross-Exchange Support

Since the dataset contains only NSE data:

* MCX data (gold futures) was simulated
* Enabled cross-exchange comparison queries

---

## 📈 Scalability

The system is designed to scale to **10M+ rows** using:

* Efficient indexing strategies
* Partitioning for large datasets
* Normalized schema to reduce redundancy

---

## 🛠️ Tech Stack

* PostgreSQL
* Python (Pandas, SQLAlchemy)
* dbdiagram.io (ER design)

---

## 🎯 Key Learnings

* Designing normalized schemas for financial data
* Handling real-world messy datasets
* Writing optimized SQL queries for time-series analysis
* Implementing scalable data pipelines

---

## 📬 Conclusion

This project demonstrates a production-style data engineering workflow, combining database design, ETL processing, and analytical querying to derive insights from high-volume trading data.
