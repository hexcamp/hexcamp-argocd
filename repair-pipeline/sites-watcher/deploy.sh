#! /bin/bash

. ../../.env

CLUSTER=ryzen9

echo GITHUB_PAT $GITHUB_PAT

kubectl --context $CLUSTER create ns repair

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create $CLUSTER-repair-sites-watcher \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd \
  --path repair-pipeline/sites-watcher \
  --dest-name $CLUSTER \
  --dest-namespace repair
