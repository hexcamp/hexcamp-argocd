#! /bin/bash

CONTEXT=ryzen9

while true; do
  kubectl --context $CONTEXT -n repair logs -f -l serving.knative.dev/service=ip-collector
  sleep 1
done
