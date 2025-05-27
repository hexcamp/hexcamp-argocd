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
  echo FIXME: Call Sink
fi
echo "Done."
