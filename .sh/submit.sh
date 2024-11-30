#!/bin/bash

/opt/spark/bin/spark-submit \
    --master spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} \
    --deploy-mode client \
    --conf spark.rpc.message.maxSize=${SPARK_RPC_MESSAGE_MAX_SIZE} \
    --conf spark.network.maxFrameSize=${SPARK_NETWORK_MAX_FRAME_SIZE} \
    --conf spark.rpc.io.threads=${SPARK_RPC_IO_THREADS} \
    --conf spark.network.timeout=${SPARK_NETWORK_TIMEOUT} \
    /opt/spark/work-dir/src/sample_spark_code.py 