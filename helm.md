# Helm for the exam

Helm is a package manager for kuberentes manifests 

## Getting started

Helm is organized into charts. Helm charts are templates that you configure to package
your applications into releases that can be deployed into a Kubernertes cluster.

## Helm repositories

Helm organizes charts to install into repositories.

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
helm repo list >> /opt/questions/helmrepos
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

To override values in a chart, use either the '--values' flag and pass in a file or use the '--set' flag and pass configuration from.

## Upgrading a chart

To upgrade a chart to latest version use the following:

```
 helm upgrade myrelease bitnami/node
```

## Check status of release

```
controlplane $ helm history myrelease
REVISION        UPDATED                         STATUS          CHART           APP VERSION     DESCRIPTION     
1               Wed Jun 14 11:10:16 2023        superseded      node-19.1.6     16.18.0         Install complete
2               Wed Jun 14 11:10:55 2023        deployed        node-19.1.7     16.18.0         Upgrade complete
```

## Rollback a chart to the first installed version

By looking at the chart history you can use the revision number to roll back

```
helm rollback myrlease 1
```

The above will rollback to the release revision 1. If you do not specify the revision arg it will rollback to the previous revision.

## Uninstall a release

To uninstall a release use the following:

```
helm uninstall myrelease
```

## Searching a repo 

If you want to search an installed repo use the helm search repo command

```
controlplane $ helm search repo node  
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                                       
bitnami/node            19.1.7          16.18.0         DEPRECATED Node.js is a runtime environment bui...
bitnami/node-exporter   3.5.3           1.6.0           Prometheus exporter for hardware and OS metrics...
```
