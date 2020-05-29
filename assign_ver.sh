#!/bin/bash
export KUBECONFIG=kubeconfig
export TOKEN=zu7pIRBLhy5P923iMZDKQM4Zxrr_MFCvEiZeS1MHIs8
oc login --token=$TOKEN --server=https://c100-e.eu-de.containers.cloud.ibm.com:31569
/usr/local/bin/oc project default
touch temp.yaml
sed s/{{BUILD_NUMBER}}/$1/g deployment.yaml > temp.yaml
kubectl -f temp.yaml
rm -f temp.yaml
