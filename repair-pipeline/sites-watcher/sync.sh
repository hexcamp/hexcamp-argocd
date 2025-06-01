#! /bin/bash

. ../../.env

CLUSTER=ryzen9

argocd app sync $CLUSTER-repair-sites-watcher

kubectl --context ryzen9 -n repair delete pods --wait=false -l eventlistener=sites-github-clone-listener

