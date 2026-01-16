CREATE TABLE audit_logs (
    transactionId STRING,
    amount DOUBLE,
    currency STRING,
    createdAt TIMESTAMP,
    processed_at TIMESTAMP
)
USING DELTA;
