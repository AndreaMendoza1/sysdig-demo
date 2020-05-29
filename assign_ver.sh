#!/bin/bash
/usr/local/bin/oc project default
touch temp.yaml
sed s/{{BUILD_NUMBER}}/$1/g deployment.yaml > temp.yaml
kubectl -f temp.yaml
rm -f temp.yaml
