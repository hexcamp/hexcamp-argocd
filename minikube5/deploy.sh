#! /bin/bash

. ../.env

echo GITHUB_PAT $GITHUB_PAT

argocd repo add https://github.com/hexcamp/hexcamp-argocd.git --username jimpick --password $GITHUB_PAT --upsert

argocd app create minikube5-hexcamp-dns \
  --upsert \
  --repo https://github.com/hexcamp/hexcamp-argocd.git \
  --path minikube5 \
  --dest-name minikube5 \
  --dest-namespace default
