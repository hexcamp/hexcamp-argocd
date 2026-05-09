#! /bin/bash

for tr in `tkn -n newshub-vanhex taskrun list -o name | tac | tail -6`; do
  TASKRUN=$(echo $tr | sed 's,taskrun.tekton.dev/,,')
  tkn -n newshub-vanhex taskrun list | grep $TASKRUN
  echo ---
  kubectl -n newshub-vanhex logs -c step-blueskybot $TASKRUN-pod
  echo
done
