#! /bin/bash

CONTEXT=ryzen9

while true; do
  kubectl --context $CONTEXT -n repair logs -f --tail 100 -l serving.knative.dev/service=ip-collector 2> /dev/null
  sleep 3
  echo -n .
done
