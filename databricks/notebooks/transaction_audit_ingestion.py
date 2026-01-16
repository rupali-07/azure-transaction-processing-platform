from pyspark.sql import SparkSession
from pyspark.sql.functions import current_timestamp

spark = SparkSession.builder.appName("TransactionAudit").getOrCreate()

df = spark.read.json("abfss://onelake@fabric.dfs.core.windows.net/transactions/")

audit_df = df.withColumn("processed_at", current_timestamp())

audit_df.write.format("delta") \
    .mode("append") \
    .save("/lakehouse/audit_logs")
