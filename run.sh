#!/bin/bash

# Check if the "-d" flag is provided
if [ "$1" == "-D" ]; then
  echo "Bringing down the containers..."
  docker-compose -f orchestration/docker-compose.yml down
elif [ "$1" == "-d" ]; then
  echo "Running in detached mode"
  docker-compose -f orchestration/docker-compose.yml up -d
# Running file beat agent on any server
elif [ "$1" == "-f" ]; then
  docker run -d --name=filebeat   --restart unless-stopped --user=root  -v /var/lib/docker/containers:/var/lib/docker/containers:ro -v /var/run/docker.sock:/var/run/docker.sock:ro  -v $(pwd)/orchestration/filebeat.yml:/usr/share/filebeat/filebeat.yml   docker.elastic.co/beats/filebeat:8.6.2 filebeat -e
else
  echo "Spinning up the containers..."
  docker-compose -f orchestration/docker-compose.yml up
fi
