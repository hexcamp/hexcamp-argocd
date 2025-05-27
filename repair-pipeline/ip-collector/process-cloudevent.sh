#! /bin/sh

set -euxo pipefail

echo "Mock process-cloudevent.sh"
touch /ips/ips.json
OLD=$(md5sum /ips/ips.json)
NEW=$(md5sum /tmp/cloudevent.json)

echo "Old: $OLD New: $OLD"
if [ "$OLD" != "$NEW" ]; then
  cp /tmp/cloudevent.json /ips/ips.json
  echo FIXME: Call Sink
fi
echo "Done."
