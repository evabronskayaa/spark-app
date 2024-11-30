#!/bin/bash

POETRY_DEPS=$(poetry show --no-ansi | awk '{print $1 ":" $2}' | paste -sd,)

/opt/spark/bin/spark-submit \
    --master spark://spark-master:7077 \
    --deploy-mode client \
    --packages ${POETRY_DEPS} \
    --conf spark.rpc.message.maxSize=1024 \
    --conf spark.network.maxFrameSize=1024m \
    --conf spark.rpc.io.threads=4 \
    --conf spark.network.timeout=120s \
    /opt/spark/work-dir/src/sample_spark_code.py 