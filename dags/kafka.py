pip install confluent-kafka

from confluent_kafka import Producer
import time

def acked(err, msg):
    """Delivery report handler called on successful or failed delivery of message."""
    if err is not None:
        print(f"Failed to deliver message: {err}")
    else:
        print(f"Message produced: {msg.value().decode('utf-8')}")

conf = {
    'bootstrap.servers': 'localhost:9092',  # Change this to your Kafka broker's address
}

producer = Producer(**conf)

topic = 'my_topic'  # Replace with your topic name

for i in range(10):
    message = f"Message {i}"
    producer.produce(topic, key=str(i), value=message, callback=acked)
    producer.poll(1)  # Wait for the message to be delivered

# Wait for any outstanding messages to be delivered and delivery report callbacks to be triggered
producer.flush()





from confluent_kafka import Consumer, KafkaError

conf = {
    'bootstrap.servers': 'localhost:9092',  # Change this to your Kafka broker's address
    'group.id': 'my_group',                 # Consumer group ID
    'auto.offset.reset': 'earliest'
}

consumer = Consumer(**conf)

topic = 'my_topic'  # Replace with your topic name
consumer.subscribe([topic])

running = True
while running:
    msg = consumer.poll(timeout=1.0)  # Poll for new messages
    if msg is None:
        continue
    if msg.error():
        if msg.error().code() == KafkaError._PARTITION_EOF:
            # End of partition event
            print(f"Reached end of partition: {msg.topic()}[{msg.partition()}] at offset {msg.offset()}")
        elif msg.error():
            # Error
            print(f"Error: {msg.error()}")
            running = False
    else:
        # Proper message
        print(f"Received message: {msg.value().decode('utf-8')}")

consumer.close()
