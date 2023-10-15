#!/bin/bash

if [[ -n $WAIT_SECONDS ]]; then
  sleep "$WAIT_SECONDS"
else
  sleep 180
fi

nodes=$(kubectl get nodes --no-headers | wc -l)

if [[ $nodes -gt 1 ]]; then
  echo "node autoscaling is working as expected."
  exit 0
else
  echo "node autoscaling is not working."
  exit 1
fi