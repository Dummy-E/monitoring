#!/bin/bash

# Check if the "-d" flag is provided
if [ "$1" == "-D" ]; then
  echo "Bringing down the containers..."
  docker-compose -f orchestration/docker-compose.yml down
elif [ "$1" == "-d" ]; then
  echo "Running in detached mode"
  docker-compose -f orchestration/docker-compose.yml up -d
else
  echo "Spinning up the containers..."
  docker-compose -f orchestration/docker-compose.yml up
fi
