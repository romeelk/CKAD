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
