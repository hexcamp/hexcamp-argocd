#! /bin/bash

. ../.env

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

echo GITHUB_PAT $GITHUB_PAT

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create $CLUSTER-zones \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path $CLUSTER-zones \
  --dest-name $CLUSTER \
  --dest-namespace default
