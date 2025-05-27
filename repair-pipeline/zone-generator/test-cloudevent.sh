#! /bin/sh

set -eux

#export K_SINK=http://kafka-broker-ingress.knative-eventing.svc.cluster.local/repair/broker
export K_SINK=http://localhost:18099/repair/broker

# https://stackoverflow.com/questions/7642743/how-to-generate-random-numbers-in-the-busybox-shell
#ID=$(</dev/urandom tr -dc A-Za-z0-9-_ | head -c 22 || true)
ID=$(cat /dev/urandom | cut -b 1-10 | head -1 | base64)

echo Sending event: camp.hex.ce.ips-updated $ID

curl -i $K_SINK \
  -H "Content-Type: application/json" \
  -H "Ce-Id: $ID" \
  -H "Ce-Specversion: 1.0" \
  -H "Ce-Type: camp.hex.ce.ips-updated" \
  -H "Ce-Source: ryzen9.repair" \
  -d "{}"

echo "Done."
