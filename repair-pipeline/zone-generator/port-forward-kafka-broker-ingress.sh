#! /bin/bash

kubectl --context ryzen9 -n knative-eventing port-forward svc/kafka-broker-ingress 18099:80
