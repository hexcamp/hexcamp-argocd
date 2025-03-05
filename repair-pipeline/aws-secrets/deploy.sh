#! /bin/bash

. ../../.env
. .env

echo GITHUB_PAT $GITHUB_PAT

CLUSTER=ryzen9

kubectl --context $CLUSTER create ns repair

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

JIMPICK_ACCESS_KEY_ID_BASE64=$(echo -n $JIMPICK_ACCESS_KEY_ID | base64)
JIMPICK_SECRET_ACCESS_KEY_BASE64=$(echo -n $JIMPICK_SECRET_ACCESS_KEY | base64)
LOCALNET_FARM_ACCESS_KEY_ID_BASE64=$(echo -n $LOCALNET_FARM_ACCESS_KEY_ID | base64)
LOCALNET_FARM_SECRET_ACCESS_KEY_BASE64=$(echo -n $LOCALNET_FARM_SECRET_ACCESS_KEY | base64)

argocd app create $CLUSTER-repair-aws-secrets \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path repair-pipeline/aws-secrets \
  --dest-name $CLUSTER \
  --dest-namespace repair \
  --jsonnet-tla-str jimpickAccessKeyId=$JIMPICK_ACCESS_KEY_ID_BASE64 \
  --jsonnet-tla-str jimpickSecretAccessKey=$JIMPICK_SECRET_ACCESS_KEY_BASE64 \
  --jsonnet-tla-str localnetFarmAccessKeyId=$LOCALNET_FARM_ACCESS_KEY_ID_BASE64 \
  --jsonnet-tla-str localnetFarmSecretAccessKey=$LOCALNET_FARM_SECRET_ACCESS_KEY_BASE64

