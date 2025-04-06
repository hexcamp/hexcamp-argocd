#! /bin/bash

. ../../.env

CLUSTER=ryzen9

argocd app sync $CLUSTER-repair-aws-secrets
