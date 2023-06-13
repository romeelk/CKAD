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

## 
