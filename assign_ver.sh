#!/bin/bash
sed s/{{BUILD_NUMBER}}/$1/g deployment.yaml > temp.yaml
kubectl apply -f temp.yaml
kubectl apply -f service.yaml
rm -f temp.yaml
