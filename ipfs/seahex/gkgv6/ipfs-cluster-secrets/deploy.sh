#! /bin/bash

. ../../../../.env
. .env

CLUSTER_SECRET_BASE64=$(echo -n $CLUSTER_SECRET | base64)
CLUSTER_RESTAPI_BASICAUTHCREDENTIALS_BASE64=$(echo -n $CLUSTER_RESTAPI_BASICAUTHCREDENTIALS | base64)

NS=gkgv6

echo GITHUB_PAT $GITHUB_PAT
argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

#argocd app create ipfs-seahex-$NS-$CLUSTER-secrets \

for cluster in nuc nuc2 ryzen9; do
  argocd app create ipfs-seahex-$NS-cluster-secrets-$cluster \
    --upsert \
    --repo https://github.com/hexcamp/hexcamp-argocd.git \
    --path ipfs/seahex/$NS/ipfs-cluster-secrets \
    --dest-name $cluster \
    --dest-namespace $NS \
    --jsonnet-tla-str clusterSecret=$CLUSTER_SECRET_BASE64 \
    --jsonnet-tla-str clusterRestapiBasicauthcredentials=$CLUSTER_RESTAPI_BASICAUTHCREDENTIALS_BASE64
done
