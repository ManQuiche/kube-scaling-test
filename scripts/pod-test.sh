#!/bin/bash

if [[ -n $WAIT_SECONDS ]]; then
  sleep "$WAIT_SECONDS"
else
  sleep 60
fi

replicas=$(kubectl get deployment pod-stress -n "$TESTING_NS" -o=jsonpath='{.spec.replicas}')

if [[ $replicas -gt 1 ]]; then
  echo "pod autoscaling is working as expected."
  exit 0
else
  echo "pod autoscaling is not working."
  exit 1
fi