#! /bin/bash

. ../.env

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

argocd app sync $CLUSTER-zones-dns
