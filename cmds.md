# Cmds

In Docker file specifiy entrypoint to control the command to run.

Use cmd to pass in parameters.

```
FROM ubuntu

ENTRYPOINT [ "sleep" ]
CMD ["5"]
```

The above will run the sleep cmd with parameter 5

```
docker build -f Dockerfile2  -t sleep . --no-cache
```

To override the cmd parameter you can pass on the cmd line the cmd parameter as follows.
The cmd always follows the name of the image to run.

```
docker run sleep 10
```

To override the entry point pass in the entry point cmd line parameter and after the image pass in the cmd parameter.

```
docker run --entrypoint echo sleep hello
```

## Pod equivalent

The entrypoint equivalent of pods is the command and the cmd equivalent is args. See-->:

```
apiVersion: v1
kind: Pod
metadata:
  name: sleeper
  labels:
    name: sleeper
spec:
  containers:
  - name: sleep
    image: sleep
    imagePullPolicy: Never
    command: ["echo"]
    args: ["hello"]
    resources:
      limits:
        memory: "128Mi"
        cpu: "500m"

```