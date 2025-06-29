#! /bin/bash

. ../.env

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

RCLONE_PASSWORD_BASE64=$(echo -n $RCLONE_PASSWORD | base64)

argocd app sync $CLUSTER-secrets
