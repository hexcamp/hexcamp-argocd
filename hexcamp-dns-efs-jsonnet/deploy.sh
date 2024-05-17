#! /bin/bash

. ../.env

echo GITHUB_PAT $GITHUB_PAT

VOLUME_HANDLE=$(cd /Users/jim/hexcamp-jpimac/localnet-farm/localnet-farm/prototypes/localnet-farm-5/terraform; terraform output efs-hexcamp-coredns | sed 's,",,g')

argocd repo add https://github.com/jimpick/localnet-farm.git --username jimpick --password $GITHUB_PAT --upsert

set -x

argocd app create hexcamp-dns-efs-jsonnet \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path hexcamp-dns-efs-jsonnet \
  --dest-name localnet-farm-5 \
  --upsert \
  --jsonnet-tla-str volumeHandle=$VOLUME_HANDLE
