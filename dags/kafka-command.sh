cd /home/EV_ERP/Kafka-Setup/kafka_2.12-3.3.1
bin/kafka-topics.sh --create --topic dss-testing --bootstrap-server 172.16.211.93:9092 --replication-factor 1 --partitions 1 # create new topic

cd /home/EV_ERP/Kafka-Setup/kafka_2.12-3.3.1
nohup bin/zookeeper-server-start.sh config/zookeeper.properties &        # zookeeper Start  

cd /home/EV_ERP/Kafka-Setup/kafka_2.12-3.3.1
nohup bin/kafka-server-start.sh config/server.properties &              # bootstrap server Start

cd /home/EV_ERP/Kafka-Setup/kafka_2.12-3.3.1
bin/kafka-console-producer.sh --topic dss-testing --bootstrap-server 172.16.211.93:9092    # Producer

cd /home/EV_ERP/Kafka-Setup/kafka_2.12-3.3.1
bin/kafka-console-consumer.sh --topic dss-testing --bootstrap-server 172.16.211.93:9092     # Consumer

cd /home/EV_ERP/Kafka-Setup/kafka_2.12-3.3.1
bin/kafka-topics.sh --bootstrap-server 172.16.211.93:9092 --delete --topic dss-testing     # Topic Delete Command

cd /home/EV_ERP/Kafka-Setup/kafka_2.12-3.3.1
bin/kafka-topics.sh --list  --bootstrap-server 172.16.211.93:9092  #list of Topics 
