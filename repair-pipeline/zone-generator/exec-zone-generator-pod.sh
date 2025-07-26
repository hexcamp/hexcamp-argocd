#! /bin/bash

kubectl --context ryzen9 -n repair exec -it `kubectl --context ryzen9 -n repair get pod -l serving.knative.dev/service=zone-generator -o name` -- bash
