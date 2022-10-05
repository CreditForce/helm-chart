#!/bin/bash
echo -e "\nCREATING PRE REQUISITES:\n- Namespace\n- Docker Registry\n- Secrets\n- TLS Certificate\n- ..."
while getopts u:a:f: flag
do
    case "${flag}" in
        n) namespace=${OPTARG};;
    esac
done

kubectl create namespace $namespace
for file in ./secrets/*
do
    kubectl create  -f ./secrets/$file --namespace $namespace
done

kubectl create secret tls creditforce-tls-secret \
--key <ARCHIVO_LLAVE_PRIVADA> \
--cert <ARCHIVO_CERTIFICADO>
helm repo add creditforce https://creditforce.github.io/helm-chart/
