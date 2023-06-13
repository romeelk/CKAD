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
