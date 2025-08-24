#! /bin/bash

. ../.env

CLUSTER=$(pwd | sed 's,^.*\/,,')
EXTDNS_CLUSTER=nuc2

echo GITHUB_PAT $GITHUB_PAT

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create $CLUSTER-zones-dns \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path $CLUSTER-zones-dns \
  --dest-name $EXTDNS_CLUSTER \
  --dest-namespace default
