#! /bin/bash

CLUSTER=$(pwd | sed 's,^.*\/,,' | sed 's,-.*,,')

k9s --context $CLUSTER -n default
