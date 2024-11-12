#! /bin/bash

. ../.env

echo GITHUB_PAT $GITHUB_PAT

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create minikube3-hexcamp-dns \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path minikube3 \
  --dest-name minikube3 \
  --dest-namespace default
