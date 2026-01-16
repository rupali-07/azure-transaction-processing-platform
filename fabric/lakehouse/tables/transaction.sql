CREATE TABLE transactions (
    transactionId STRING,
    amount DOUBLE,
    currency STRING,
    status STRING,
    createdAt TIMESTAMP
)
USING DELTA;
