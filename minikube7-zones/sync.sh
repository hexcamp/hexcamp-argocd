#! /bin/bash

. ../.env

argocd app sync $CLUSTER-zones
