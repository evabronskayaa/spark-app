# Spark Cluster with Docker Compose

The project represents a Apache Spark cluster with Docker Compose

The cluster consists of one master node, two worker nodes and a separate container for running Spark-apps

<b>Spark Master UI</b>: http://localhost:8080

## Run containers

```bash
docker compose up -d 
```

## Run python code in spark-master container

```bash
docker exec -it spark-master bash

# interactive mode
cd /opt/spark/bin
./pyspark --master spark://spark-master:7077

# run scripts
cd /opt/spark/work-dir
python3 src/your_script.py
```
