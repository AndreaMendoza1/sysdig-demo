#!/bin/bash
sed s/{{BUILD_NUMBER}}/$1/g deployment.yaml | kubectl -f -
/usr/local/bin/oc project default
cat 
kubectl apply -f service.yaml
rm -f temp.yaml
