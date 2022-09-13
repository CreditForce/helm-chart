# CreditForce Helm Charts

Estos Helm chart están diseñados para ser usado de forma ligera y facil de configurar en cualquier Kubernetes ya sea on-premise, AKS, EKS, etc. Se debe contactar con el K8s ya instalado y configurado.

## Instalación

### Pre-Requisitos

Se debe crear el namespace `creditforce` y agregar las credenciales del repositorio para poder lanzar estos Helm charts.

```console
$ kubectl create namespace creditforce
$ kubectl create secret docker-registry creditforce --docker-server=creditforce.azurecr.io --docker-username=<USUARIO> --docker-password=<CLAVE> --namespace creditforce
$ kubectl create secret Opaque busconnection --BusConnection="<DSN_STRING>"
$ helm repo add creditforce https://creditforce.github.io/helm-chart/
```

### Instalar la Base

```console
$ helm install base creditforce/base --namespace creditforce
$ helm status base --namespace creditforce
```

### Remover la Base

```console
$ helm uninstall base creditforce/base --namespace creditforce
$ helm status base --namespace creditforce
```
