#! /bin/bash

. ../.env

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

echo GITHUB_PAT $GITHUB_PAT

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

RCLONE_PASSWORD_BASE64=$(echo -n $RCLONE_PASSWORD | base64)

argocd app create $CLUSTER-secrets \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path $CLUSTER-secrets \
  --dest-name $CLUSTER \
  --dest-namespace default \
  --jsonnet-tla-str rclonePassword=$RCLONE_PASSWORD_BASE64
