#!/bin/bash

docker compose up --detach

docker exec broker \
  kafka-topics \
    --bootstrap-server broker:9092 \
    --create \
    --topic quickstart

docker exec \
  --interactive \
  --tty broker \
  kafka-console-producer \
    --bootstrap-server broker:9092 \
    --topic quickstart

docker exec \
  --interactive \
  --tty broker \
  kafka-console-consumer \
    --bootstrap-server broker:9092 \
    --topic quickstart \
    --from-beginning

docker compose down
