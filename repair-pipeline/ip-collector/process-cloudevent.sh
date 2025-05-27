#! /bin/sh

set -eux

echo "Running process-cloudevent.sh, checking IPs from CloudEvent"

if [ ! -f /ips/ips.json ]; then
  touch /ips/ips.json
fi

OLD=$(md5sum /ips/ips.json | cut -f1 -d " ")
NEW=$(md5sum /tmp/cloudevent.json | cut -f1 -d " ")

echo "Old: $OLD New: $NEW"
if [ "$OLD" != "$NEW" ]; then
  cp /tmp/cloudevent.json /ips/ips.json

  # https://stackoverflow.com/questions/7642743/how-to-generate-random-numbers-in-the-busybox-shell
  ID=$(</dev/urandom tr -dc A-Za-z0-9-_ | head -c 22 || true)

  echo Sending event: camp.hex.ce.ips-updated $ID

  curl -i $K_SINK \
    -H "Content-Type: application/json" \
    -H "Ce-Id: $ID" \
    -H "Ce-Specversion: 1.0" \
    -H "Ce-Type: camp.hex.ce.ips-updated" \
    -H "Ce-Source: ryzen9.repair" \
    -d "{}"
fi

echo "Done."
