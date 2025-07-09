#! /bin/bash

. ../../../../.env

CLUSTER=ryzen9

echo GITHUB_PAT $GITHUB_PAT

NS=ikgrw

kubectl --context $CLUSTER create ns $NS

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create stract-backend-$NS-$CLUSTER-community-associations \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd \
  --path search/vichex/$NS/stract-backend-community-associations \
  --dest-name $CLUSTER \
  --dest-namespace $NS
