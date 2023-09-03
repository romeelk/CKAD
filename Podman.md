# Podman

Podman is alternative to docker cli. You can use podman to 
do the equivalent of building and publishging containers.

## Build a container

```
podman build -t sample . 
```

## Run the container 

Run the container using:

```
podman run sample --name sample 
```

## Saving an image in OCI format

```
podman save -o mynginx.tar nginx 
```

## Export a running container 

```
podman export 5b1b13172d1af657cfa51ba25ea279391355c885e8ef4d7f37d21833d4e3b1de > mycontainer.tar
```