#! /bin/bash

kubectl -n knative-eventing port-forward svc/kafka-broker-ingress 18099:80
