#! /bin/bash

kubectl -n repair label kservice ip-collector networking.knative.dev/visibility=cluster-local

