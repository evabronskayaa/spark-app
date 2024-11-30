#!/bin/bash
/opt/spark/bin/spark-class \
    -Dspark.rpc.message.maxSize=1024 \
    -Dspark.network.maxFrameSize=1024m \
    -Dspark.rpc.io.threads=4 \
    -Dspark.network.timeout=120s \
    org.apache.spark.deploy.master.Master 