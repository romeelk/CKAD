# Helm

Example building go app in Docker and package in Helm

## Build Docker image

To build the image run:

```
 docker build --tag docker-gs-echo .
```

## Run the image locally

To run the go docker image locally:
Use the --publish parameter to bind host:container port

If you don't it will run but you won't be able to connect from your host!!

```
docker run --publish 8080:8080 docker-gs-echo
```

## Build this as image in the in-cluster Docker daemon

To build this locally on minikube use the following doc:
https://minikube.sigs.k8s.io/docs/handbook/pushing/#1-pushing-directly-to-the-in-cluster-docker-daemon-docker-env

```
eval $(minikube docker-env)
docker build --tag docker-gs-echo .

```

## Create a pod manifest with imagePull never

Run the following to create pod manifest:
```
k run goecho --image docker-gs-echo  --dry-run=client -oyaml > pod.yaml
```

Then apply:

```
k apply -f pod.yaml
```

Test:
```
k run busybox --image busybox  --rm -it -- /bin/sh
wget -qO- http://172.17.0.9/echo?name=docker       
```

## Install as a helm package

Create a helm package:

```
helm create goecho
```

Install as a release:

```
helm install goechorel goecho
```

## Things to note from helm chart templates

The go app runs on the port 8080. The cmd helm create goecho creates a deployment.yaml with the container port 80 (it uses nginx template).
You need to chage this.

Also the image pull policy must be changed in value.yaml to Never if you run it locally using Docker daemon.

And finally the chart.yaml file must be changed so appVersion: latest. This is because it appends that to the image.

## Override chart values

You can override thr parameters in values.yaml by passing them on command line:

helm install goechorel goecho --set replicatCount=6

## Uninstall the chart

helm  uninstall goechorel   

## List All helm releasee

```
helm list -A > /root/releases
```

## Unistall a release in a namespace

List all helm in all namespace
```
helm list -A  
```

uninstall

```
helm uninstall apiserver -n team-yellow
```

## Install release nginx-stable/nginx-ingress into ns yellow

```
helm install dev-server nginx-stable/nginx-ingress -n team-yellow
```

## Upgrade the release

Get list of charts repo:

```
helm repo list
NAME            URL                               
nginx-stable    https://helm.nginx.com/stable     
bitnami         https://charts.bitnami.com/bitnami
```

Make sure you pick the right repo to search. In this case nginx-stable
Search version of nginx chart 

```
helm search repo nginx-stable
NAME                                            CHART VERSION   APP VERSION                             DESCRIPTION                                      
nginx-stable/nginx-appprotect-dos-arbitrator    0.1.0           1.1.0                                   NGINX App Protect Dos arbitrator                 
nginx-stable/nginx-devportal                    1.7.0           1.7.0                                   A Helm chart for deploying ACM Developer Portal  
nginx-stable/nginx-ingress                      0.18.1          3.2.1                                   NGINX Ingress Controller                         
nginx-stable/nginx-service-mesh                 2.0.0                                                   NGINX Service Mesh                               
nginx-stable/nms                                1.9.0           NIM 2.13.0|ACM 1.8.0|ADM 4.0.0-ea.3     A chart for installing the NGINX Management Suite
nginx-stable/nms-acm                            1.8.0           1.8.0                                   A Helm chart for Kubernetes                      
nginx-stable/nms-adm                            4.0.0           4.0.0                                   A Helm chart for ADM                             
nginx-stable/nms-hybrid                         2.13.0          2.13.0                                  A Helm chart for Kubernetes       ```

The latest version of nginx-stable/nginx-ingress is  CHART VERSION 0.18.1 and APP VERSION 3.2.1

We are interested in chart version: 0.18.1

First update repo

```
helm repo update
```
```
helm upgrade devserver  nginx-stable/nginx-ingress -n team-yellow
```

List the releae:

```
 helm -n team-yellow ls

NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART                   APP VERSION
devserver       team-yellow     3               2023-09-04 12:25:23.524515433 +0000 UTC deployed        nginx-ingress-0.18.1    3.2.1      
```

See the release of the chart is 0.18.1