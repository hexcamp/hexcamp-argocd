#! /bin/bash

. ../../../../.env
. .env

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

NS=gkgv6

kubectl --context $CLUSTER create ns $NS

echo GITHUB_PAT $GITHUB_PAT

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

IPFS_PEER_ID_BASE64=$(echo -n $IPFS_PEER_ID | base64)
IPFS_PRIVATE_KEY_BASE64=$(echo -n $IPFS_PRIVATE_KEY | base64)

argocd app create ipfs-seahex-$NS-$CLUSTER-secrets \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path ipfs/seahex/$NS/$CLUSTER-secrets \
  --dest-name $CLUSTER \
  --dest-namespace $NS \
  --jsonnet-tla-str ipfsPeerId=$IPFS_PEER_ID_BASE64 \
  --jsonnet-tla-str ipfsPrivateKey=$IPFS_PRIVATE_KEY_BASE64

