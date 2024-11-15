#! /bin/bash

. ../.env

echo GITHUB_PAT $GITHUB_PAT

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create minikube4-hexcamp-dns \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path minikube4 \
  --dest-name minikube4 \
  --dest-namespace default
