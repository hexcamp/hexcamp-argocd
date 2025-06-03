#! /bin/bash

kubectl -n repair label kservice hackmd-updater networking.knative.dev/visibility=cluster-local
