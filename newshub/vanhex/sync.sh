#! /bin/bash

. ../../.env

CLUSTER=ryzen9

tkn -n newshub-vanhex taskrun delete --all -f

argocd app sync $CLUSTER-newshub-vanhex

#kubectl --context ryzen9 -n newshub-vanhex delete pods --wait=false -l eventlistener=sites-github-clone-listener

