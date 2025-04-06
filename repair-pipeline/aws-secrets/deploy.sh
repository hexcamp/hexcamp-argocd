#! /bin/bash

. ../../.env
. .env

SSH_RSA_PUB=$(cat ~/.ssh/id_rsa.pub)
echo GITHUB_PAT $GITHUB_PAT

CLUSTER=ryzen9

kubectl --context $CLUSTER create ns repair

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

JIMPICK_ACCESS_KEY_ID_BASE64=$(echo -n $JIMPICK_ACCESS_KEY_ID | base64)
JIMPICK_SECRET_ACCESS_KEY_BASE64=$(echo -n $JIMPICK_SECRET_ACCESS_KEY | base64)
JIMPICK_DNS_READONLY_ACCESS_KEY_ID_BASE64=$(echo -n $JIMPICK_DNS_READONLY_ACCESS_KEY_ID | base64)
JIMPICK_DNS_READONLY_SECRET_ACCESS_KEY_BASE64=$(echo -n $JIMPICK_DNS_READONLY_SECRET_ACCESS_KEY | base64)
LOCALNET_FARM_ACCESS_KEY_ID_BASE64=$(echo -n $LOCALNET_FARM_ACCESS_KEY_ID | base64)
LOCALNET_FARM_SECRET_ACCESS_KEY_BASE64=$(echo -n $LOCALNET_FARM_SECRET_ACCESS_KEY | base64)
SSH_RSA_PUB_BASE64=$(echo -n $SSH_RSA_PUB | base64)
RCLONE_PASSWORD_BASE64=$(echo -n $RCLONE_PASSWORD | base64)

argocd app create $CLUSTER-repair-aws-secrets \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path repair-pipeline/aws-secrets \
  --dest-name $CLUSTER \
  --dest-namespace repair \
  --jsonnet-tla-str jimpickAccessKeyId=$JIMPICK_ACCESS_KEY_ID_BASE64 \
  --jsonnet-tla-str jimpickSecretAccessKey=$JIMPICK_SECRET_ACCESS_KEY_BASE64 \
  --jsonnet-tla-str jimpickDnsReadonlyAccessKeyId=$JIMPICK_DNS_READONLY_ACCESS_KEY_ID_BASE64 \
  --jsonnet-tla-str jimpickDnsReadonlySecretAccessKey=$JIMPICK_DNS_READONLY_SECRET_ACCESS_KEY_BASE64 \
  --jsonnet-tla-str localnetFarmAccessKeyId=$LOCALNET_FARM_ACCESS_KEY_ID_BASE64 \
  --jsonnet-tla-str localnetFarmSecretAccessKey=$LOCALNET_FARM_SECRET_ACCESS_KEY_BASE64 \
  --jsonnet-tla-str sshRsaPub=$SSH_RSA_PUB_BASE64 \
  --jsonnet-tla-str rclonePassword=$RCLONE_PASSWORD_BASE64 \


