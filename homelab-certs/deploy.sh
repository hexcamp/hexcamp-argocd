#! /bin/bash

. ../.env

CLUSTER=$1
if [ -z "$CLUSTER" ]; then
  echo Need cluster
  exit 1
fi

echo GITHUB_PAT $GITHUB_PAT

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create $CLUSTER-certs \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path homelab-certs \
  --dest-name $CLUSTER \
  --dest-namespace default
