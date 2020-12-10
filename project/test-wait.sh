#!/bin/sh
echo "# Launching tests after messages are delivered"

while true; do

  if [ "$(docker ps -aq -f status=exited -f name=GITLAB_ORIG)" ]; then
    echo "# Messages delivered, starting tests..."
    exit 0
  fi

  echo "Waiting..."
  sleep 2

done
