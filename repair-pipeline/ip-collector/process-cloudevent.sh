#! /bin/sh

set -eux

echo "Mock process-cloudevent.sh"
touch /ips/ips.json
OLD=$(md5sum /ips/ips.json | cut -f1 -d " ")
NEW=$(md5sum /tmp/cloudevent.json | cut -f1 -d " ")

echo "Old: $OLD New: $OLD"
if [ "$OLD" != "$NEW" ]; then
  cp /tmp/cloudevent.json /ips/ips.json
  echo FIXME: Call Sink
fi
echo "Done."
