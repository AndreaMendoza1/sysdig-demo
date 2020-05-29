#!/bin/bash
sed s/{{BUILD_NUMBER}}/$1/g deployment.yaml > temp.yaml
