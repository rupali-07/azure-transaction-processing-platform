from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

dlq_df = spark.read.json("abfss://servicebusdlq@fabric.dfs.core.windows.net/")

dlq_df.show()
