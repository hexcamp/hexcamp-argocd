#! /bin/bash

# https://github.com/knative/docs/tree/main/code-samples/eventing/github-source

. ../../.env
. .env

SSH_RSA_PUB=$(cat ~/.ssh/id_rsa.pub)
echo GITHUB_PAT $GITHUB_PAT

CLUSTER=ryzen9

#kubectl --context $CLUSTER create ns repair

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

ACCESS_TOKEN_BASE64=$(echo -n $ACCESS_TOKEN | base64)
SECRET_TOKEN_BASE64=$(echo -n $SECRET_TOKEN | base64)

argocd app create $CLUSTER-repair-github-secrets \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path repair-pipeline/github-secrets \
  --dest-name $CLUSTER \
  --dest-namespace repair \
  --jsonnet-tla-str accessToken=$ACCESS_TOKEN_BASE64 \
  --jsonnet-tla-str secretToken=$SECRET_TOKEN_BASE64 \


