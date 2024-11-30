import time

from pyspark.sql import SparkSession
from pyspark.sql.types import IntegerType, StringType, StructField, StructType

print("Just waiting 10 seconds for workers to start...")
time.sleep(10)

spark = (
    SparkSession.builder.appName("spark-test-app")
    .master("spark://spark-master:7077")
    .config("spark.driver.host", "spark-app")
    .getOrCreate()
)

schema = StructType(
    [
        StructField("name", StringType(), True),
        StructField("age", IntegerType(), True),
        StructField("city", StringType(), True),
    ]
)

data = [
    ("Ann", 25, "London"),
    ("Eugene", 30, "Saint-Petersburg"),
    ("Maria", 28, "Madrid"),
    ("Arthur", 35, "Paris"),
]

df = spark.createDataFrame(data, schema)

print("Schema:")
df.printSchema()

print("\nPeople over 27 years old:")
df.filter(df.age > 27).show()

print("\nSorting by age:")
df.orderBy("age").show()

spark.stop()
