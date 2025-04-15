#! /bin/bash

. ../../../../.env

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

NS=gkgv6

argocd app sync ipfs-seahex-$NS-cluster-$CLUSTER 
