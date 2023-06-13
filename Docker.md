# Docker

Here is what you need to know about Docker to answer the questions:

## Docker pull
Start with pulling Docker hello from Docker hub

```
docker pull hello-world
```

## Docker run
To run the image use:
```
docker run hello-world
```

You can list the image
```
docker images --all
```

## Create your own Dockerfile

Create a simple docker file that reads a file and prints it out in a loop
```
FROM alpine

COPY file.txt .
CMD while true ; do cat file.txt ; sleep 10 ; done
```

## Docker build 
docker build -t romeelk/helloworld . 

## Docker push
docker push  romeelk/helloworld:1.0  

## Docker run image 
So just run the image:

```
docker run romeelk/helloworld:1.0
```

You can check the status:

```
docker ps --all
CONTAINER ID   IMAGE                                 COMMAND                  CREATED              STATUS                            PORTS                                                                                                                                  NAMES
23df79fe8e23   romeelk/helloworld:1.0                "/bin/sh -c 'while t…"   14 seconds ago       Up 14 seconds         
```
## Exporting a docker image

Docker images are OCI compliant from default. However, you need to know how you would export the image:

To export use the docker save command with -o flag and name of the export .tar file then the image you want to export.
So for the romeelk/helloworld:1.0 image you do the following:
```
docker save -o helloworld.tar romeelk/helloworld:1.0  
```
## Exporting a container

To export a running container use the docker export command:

```
docker export -o  exportedhelloworldcontainer.tar  a593a29c67ae
```

Docker log takes output from stdout so
```
docker logs a593a29c67ae
```
Will list the echo statements

## Stop the container

You can stop a container by:
```
docker stop containerid
```

## Clean up

Do a cleanup of stopped containers:

```
docker rm --force $(docker ps --all --quiet)
```
Cleanup images:

```
docker rmi --force $(docker images --all --quiet)
```
