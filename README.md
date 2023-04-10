<br />
<p align="center">
  <a href="">
    <img src=".logo.png" alt="Logo" width="90" height="90">
  </a>

  <h1 align="center">Apache Kafka Primer</h1>

  <p align="center"><i>Setting up an experimental Kafka cluster by running brokers and ZooKeeper nodes with Supervisor.</i>
  </p>
</p>

---

### Prerequisites

> *NOTE: Your local environment must have Java 8+ installed.*


## Run

Start the ZooKeeper service
```shell
bin/zookeeper-server-start.sh config/zookeeper.properties
```

Start the Kafka broker service
```shell
bin/kafka-server-start.sh config/server.properties
```


### Sources
- [Quickstart](https://kafka.apache.org/quickstart)
- [App using Kafka](https://openclassrooms.com/fr/courses/4451251-gerez-des-flux-de-donnees-temps-reel/4451526-creez-votre-premiere-application-avec-kafka)
- [Download Kafka](https://www.apache.org/dyn/closer.cgi?path=/kafka/3.4.0/kafka_2.13-3.4.0.tgz)

