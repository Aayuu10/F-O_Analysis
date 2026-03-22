import pandas as pd
from sqlalchemy import create_engine


# 1. Load Data
df = pd.read_csv("3mfanddo.csv")

# 2. Clean Data
# Drop unwanted column
if "Unnamed: 0" in df.columns:
    df = df.drop(columns=["Unnamed: 0"])

# Rename columns
df.columns = [
    "instrument", "symbol", "expiry_dt", "strike_pr", "option_typ",
    "open", "high", "low", "close", "settle_pr",
    "contracts", "val_inlakh", "open_int", "chg_in_oi", "timestamp"
]

# Fix date formats
df["timestamp"] = pd.to_datetime(df["timestamp"], format="%d-%b-%Y", errors='coerce')
df["expiry_dt"] = pd.to_datetime(df["expiry_dt"], format="%d-%b-%Y", errors='coerce')

# Fill missing values
df = df.fillna(0)

print("Data cleaned")


# 3. Connect to PostgreSQL
# Replace with your credentials
username = "postgres"
password = "your_password"
host = "localhost"
port = "5432"
database = "fo_trading"

engine = create_engine(f"postgresql://{username}:{password}@{host}:{port}/{database}")

print("Connected to PostgreSQL")


# 4. Load Data into raw_data table
df.to_sql(
    "raw_data",
    engine,
    if_exists="append", 
    index=False,
    chunksize=5000        # improves performance
)

print("Data successfully loaded into raw_data table")