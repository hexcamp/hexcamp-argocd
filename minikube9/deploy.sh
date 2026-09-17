#! /bin/bash

. ../.env

CLUSTER=$(pwd | sed 's,^.*\/,,')

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create $CLUSTER-hexcamp-dns \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path $CLUSTER \
  --dest-name $CLUSTER \
  --dest-namespace default
