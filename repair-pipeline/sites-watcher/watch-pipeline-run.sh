#! /bin/bash

LASTNAME=""
while true; do
  NAME=$(tkn --context ryzen9 -n repair pipelinerun list --limit 1 -o name | sed 's,^.*/,,')
  if [ "$NAME" != "$LASTNAME" ]; then
    LASTNAME=$NAME
    echo
    tkn --context ryzen9 -n repair pipelinerun list --limit 5
    echo Following $NAME...
    tkn --context ryzen9  -n repair pipelinerun logs -f $NAME
  fi
  echo -n .
  sleep 5
done


