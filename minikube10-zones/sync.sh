#! /bin/bash

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

argocd app sync $CLUSTER-zones
