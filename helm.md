# Helm for the exam

Helm is a package manager for kuberentes manifests 

## Getting started

Helm is organized into charts. Helm charts are temmplates that you configure to package
your applications into releases that can be deployed into a Kubernertes cluster

## Helm repositories

Helm organized charts to install (community created) into repositories

For example bitnami is a helm repository you can use. 

But before using you must add it to your helm install.

```
controlplane $  helm repo add bitnami https://charts.bitnami.com/bitnami
"bitnami" has been added to your repositories
controlplane $ helm repo list
NAME    URL                               
bitnami https://charts.bitnami.com/bitnami
```

For example:
List the existing helm repos and add it to file /opt/question/helmrepos

```
helm repo list >> /opt/questions/repo
```
## Downloading helm chart

To understand the structure of a helm chart download it using the pull command:

```
helm pull --untar bitnami/node 
```

To view the the chart paremeters look at values.yml

## Install the node chart 

Install the node chart with a replicaCount of 5 and a specific version of 19.1.6 

```
helm install myrelease bitnami/node --set replicaCount=5 --version 19.1.6
```
To set a parameter in the values.yaml you must use the --set flag followed by the parameter.
