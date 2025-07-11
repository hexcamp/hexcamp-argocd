#! /bin/bash

. ../../../../.env

CLUSTER=ryzen9

NS=ikgrw

argocd app sync stract-frontend-$NS-$CLUSTER-community-associations

