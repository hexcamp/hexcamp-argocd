#! /bin/bash

LASTNAME=""
while true; do
  NAME=$(tkn -n repair pipelinerun list --limit 1 -o name | sed 's,^.*/,,')
  if [ "$NAME" != "$LASTNAME" ]; then
    LASTNAME=$NAME
    echo
    tkn -n repair pipelinerun list --limit 5
    echo Following $NAME...
    tkn -n repair pipelinerun logs -f $NAME
  fi
  echo -n .
  sleep 5
done


