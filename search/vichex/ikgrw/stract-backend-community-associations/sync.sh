#! /bin/bash

. ../../../../.env

CLUSTER=ryzen9

NS=ikgrw

argocd app sync stract-backend-$NS-$CLUSTER-community-associations

