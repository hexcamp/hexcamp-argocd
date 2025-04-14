#! /bin/sh

echo "CLUSTER_SECRET=$(openssl rand -hex 32)" > .env
echo "CLUSTER_RESTAPI_BASICAUTHCREDENTIALS='{\"admin\": \"$(pwgen 16)\"}'" >> .env
