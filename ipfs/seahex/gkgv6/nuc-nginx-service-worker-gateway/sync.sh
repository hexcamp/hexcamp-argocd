#! /bin/bash

. ../../../../.env

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

NS=gkgv6

argocd app sync seahex-$NS-$CLUSTER-nginx-service-worker-gateway
