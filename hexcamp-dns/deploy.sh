#! /bin/bash

. ../.env

echo GITHUB_PAT $GITHUB_PAT

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create hexcamp-dns \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path hexcamp-dns \
  --dest-name localnet-farm-5 \
  --dest-namespace default
