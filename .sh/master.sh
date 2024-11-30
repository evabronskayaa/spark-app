#!/bin/bash
/opt/spark/bin/spark-class \
    -Dspark.rpc.message.maxSize=${SPARK_RPC_MESSAGE_MAX_SIZE} \
    -Dspark.network.maxFrameSize=${SPARK_NETWORK_MAX_FRAME_SIZE} \
    -Dspark.rpc.io.threads=${SPARK_RPC_IO_THREADS} \
    -Dspark.network.timeout=${SPARK_NETWORK_TIMEOUT} \
    org.apache.spark.deploy.master.Master 