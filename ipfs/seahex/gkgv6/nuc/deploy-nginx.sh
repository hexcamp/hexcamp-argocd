#! /bin/bash

kubectl --context nuc -n gkgv6 apply -f nginx.yaml.debug
kubectl --context nuc -n gkgv6 apply -f svc-nginx.yaml.debug 
