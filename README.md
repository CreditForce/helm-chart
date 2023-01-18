# CreditForce Helm Charts

Estos Helm chart están diseñados para ser usado de forma ligera y facil de configurar en cualquier Kubernetes ya sea on-premise, AKS, EKS, etc. Se debe contactar con el K8s ya instalado y configurado.

## Instalación

### Pre-Requisitos

Se debe crear el namespace `creditforce` y agregar las credenciales del repositorio para poder lanzar estos Helm charts.

```console
$ kubectl create namespace creditforce
$ kubectl create secret docker-registry creditforce \
--docker-server=creditforce.azurecr.io \
--docker-username=<USUARIO> \
--docker-password=<CLAVE> \
--namespace creditforce
$ kubectl create secret generic busconnection \
--from-literal=BusConnection="<STRING>" \
--from-literal=ServiceBusUrl="<URL_API>" \
--from-literal=AuthorizationServiceBusUrl="<URL_API>" \
--namespace creditforce
$ kubectl create secret generic dataprotection  \
--from-literal=BlobName="<BlobName>" \
--from-literal=BlobStorage="<BlobStorage>" \
--from-literal=ContainerName="<ContainerName>" \
--namespace creditforce
$ kubectl create secret generic notificationconnection   \
--from-literal=NotificationConnection="<NotificationConnection>" \
--from-literal=NotificationServiceBusUrl="<URL_API>" \
--namespace creditforce
$ kubectl create secret generic security  \
--from-literal=AuthProvider="<AUTH>" \
--from-literal=CompanyName="<COMPANY>" \
--from-literal=LoginName="<USERNAME>" \
--from-literal=PasswordHash="<PASSWORD>" \
--from-literal=Target="<TARGET>" \
--namespace creditforce
$ kubectl create secret tls creditforce-tls-secret \
--key <ARCHIVO_LLAVE_PRIVADA> \
--cert <ARCHIVO_CERTIFICADO>
$ helm repo add creditforce https://creditforce.github.io/helm-chart/
```

### Instalar la Base

```console
$ helm install base creditforce/base --namespace creditforce --set "global.domain=your.domain.com"
$ helm status base --namespace creditforce
```

### Remover la Base

```console
$ helm uninstall base creditforce/base --namespace creditforce
$ helm status base --namespace creditforce
```

### Originación

### Crear los secrets requeridos

```console
$ kubectl create secret generic creditorigination  \
--from-literal=AuthProvider="<AUTH>" \
--from-literal=CompanyName="<COMPANY>" \
--from-literal=LoginName="<USERNAME>" \
--from-literal=PasswordHash="<PASSWORD>" \
--from-literal=Target="<TARGET>" \
--from-literal=Theme="<Theme>" \
--namespace creditforce
```
### Instalar

```console
$ helm install base creditforce/origination --namespace creditforce --set "global.domain=your.domain.com"
$ helm status origination --namespace creditforce
```

### Portafolio

### Crear los secrets requeridos

```console
$ kubectl create secret generic creditengine  \
--from-literal=AuthProvider="<AUTH>" \
--from-literal=CompanyName="<COMPANY>" \
--from-literal=LoginName="<USERNAME>" \
--from-literal=PasswordHash="<PASSWORD>" \
--from-literal=Target="<TARGET>" \
--from-literal=Theme="<Theme>" \
--namespace creditforce
```
### Instalar

```console
$ helm install base creditforce/portfolio --namespace creditforce --set "global.domain=your.domain.com"
$ helm status portfolio --namespace creditforce
```

### Comercios

### Crear los secrets requeridos

```console
$ kubectl create secret generic creditstore  \
--from-literal=AuthProvider="<AUTH>" \
--from-literal=CompanyName="<COMPANY>" \
--from-literal=LoginName="<USERNAME>" \
--from-literal=PasswordHash="<PASSWORD>" \
--from-literal=Target="<TARGET>" \
--from-literal=Theme="<Theme>" \
--namespace creditforce
```

### Instalar

```console
$ helm install base creditforce/store --namespace creditforce --set "global.domain=your.domain.com"
$ helm status store --namespace creditforce
```

### Cobros

### Crear los secrets requeridos

```console
$ kubectl create secret generic creditcollection   \
--from-literal=AuthProvider="<AUTH>" \
--from-literal=CompanyName="<COMPANY>" \
--from-literal=LoginName="<USERNAME>" \
--from-literal=PasswordHash="<PASSWORD>" \
--from-literal=Target="<TARGET>" \
--from-literal=Theme="<Theme>" \
--namespace creditforce
```
### Instalar

```console
$ helm install base creditforce/collection --namespace creditforce --set "global.domain=your.domain.com"
$ helm status collection --namespace creditforce
```

### Motor de Reglas

### Crear los secrets requeridos

```console
$ kubectl create secret generic rulesmanager   \
--from-literal=AuthProvider="<AUTH>" \
--from-literal=CompanyName="<COMPANY>" \
--from-literal=LoginName="<USERNAME>" \
--from-literal=PasswordHash="<PASSWORD>" \
--from-literal=Target="<TARGET>" \
--from-literal=RulesEngineUrl="<URL_API>" \
--from-literal=Theme="<Theme>" \
--namespace creditforce
```

### Instalar

```console
$ helm install base creditforce/rules --namespace creditforce --set "global.domain=your.domain.com"
$ helm status rules --namespace creditforce
```

### Motor de Flujos de Trabajo

### Crear los secrets requeridos

```console
$ kubectl create secret generic workflow    \
--from-literal=API_ADMIN="<URL_API>" \
--from-literal=API_AUTH="<URL_API>" \
--from-literal=API_DASHBOARD="<URL_API>" \
--from-literal=API_INTERACTION="<URL_API>" \
--from-literal=DBConnection="<STRING_CONNECTION>" \
--from-literal=ValidDashBoardSites="<STRING>" \
--namespace creditforce
```
### Instalar

```console
$ helm install base creditforce/workflow --namespace creditforce  --set "global.domain=your.domain.com"
$ helm status workflow --namespace creditforce
```
