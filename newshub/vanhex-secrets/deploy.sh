#! /bin/bash

. .env

CLUSTER=ryzen9

CBC_BC_PASSWORD_BASE64=$(echo -n $cbc_bc_password | base64)

argocd app create $CLUSTER-newshub-vanhex-secrets \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path newshub/vanhex-secrets \
  --dest-name $CLUSTER \
  --dest-namespace newshub-vanhex \
  --jsonnet-tla-str cbcBcPassword=$CBC_BC_PASSWORD_BASE64 \


