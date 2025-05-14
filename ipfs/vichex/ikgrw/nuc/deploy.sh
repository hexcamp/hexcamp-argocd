#! /bin/bash

. ../../../../.env

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

echo GITHUB_PAT $GITHUB_PAT

NS=ikgrw

kubectl --context $CLUSTER create ns $NS

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create ipfs-vichex-$NS-$CLUSTER \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd \
  --path ipfs/vichex/$NS/$CLUSTER \
  --dest-name $CLUSTER \
  --dest-namespace $NS
