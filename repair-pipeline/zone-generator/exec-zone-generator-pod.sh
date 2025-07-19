#! /bin/bash

kubectl -n repair exec -it `kubectl -n repair get pod -l serving.knative.dev/service=zone-generator -o name` -- bash
