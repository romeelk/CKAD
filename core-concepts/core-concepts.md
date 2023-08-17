# Core-concepts

Create a namespace called 'mynamespace' and a pod with image nginx called nginx on this namespace

```
k create ns mynamespace
k run nginx --image=nginx -n mynamespace
```

Create the pod that was just described using YAML

k run nginx --image nginx -n mynamespace --restart Never --dry-run=client -o yaml

```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
  namespace: mynamespace
spec:
  containers:
  - image: nginx
    name: nginx
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Never
status: {}
```

Create a busybox pod (using kubectl command) that runs the command "env". Run it and see the output

k run busybox --image busybox --command --restart Never -it  --rm -- env


Exec into pod

kubectl apply -f https://k8s.io/examples/application/shell-demo.yaml
kubectl exec --stdin --tty shell-demo -- /bin/bash

Get the YAML for a new namespace called 'myns' without creating it

k create  ns myns  -oyaml --dry-run=client

Get the YAML for a new ResourceQuota called 'myrq' with hard limits of 1 CPU, 1G memory and 2 pods without creating it

k create quota myrq --hard cpu=1,memory=1G,pods=2 --dry-run=client -oyaml
apiVersion: v1
kind: ResourceQuota
metadata:
  creationTimestamp: null
  name: myrq
spec:
  hard:
    cpu: "1"
    memory: 1G
    pods: "2"
status: {}

Get pods on all namespaces

k get pods --al-namespaces

Create a pod with image nginx called nginx and expose traffic on port 80

k run nginx --image nginx --restart=Never --port 80

Change pod's image to nginx:1.7.1. Observe that the container will be restarted as soon as the image gets pulled

kubectl set image po/nginx nginx=nginx nginx=nginx:1.7.1

kubectl describe po nginx 

check running image:

Get nginx pod's ip created in previous step, use a temp busybox image to wget its '/'
kubectl get po nginx -o jsonpath='{.status.podIP}'

k run temp --image busybox --restart=Never --rm -it -- wget -O- 172.17.0.8 
Get pod's YAML
k get po/nginx -oyaml

Get information about the pod, including details about potential issues (e.g. pod hasn't started)

k describe pod/nginx

Get pod logs

k logs nginx  

Get previous logs
k logs nginx  --previous

Execute a simple shell on the nginx pod
kubectl exec --stdin --tty nginx -- /bin/bash

Create a busybox pod that echoes 'hello world' and then exits

k run busybox --image busybox  -it --restart=Never  --command -- echo 'hello world'

Do the same, but have the pod deleted automatically when it's completed

k run busybox --image busybox  -it -rm --restart=Never  --command -- echo 'hello world'

Create an nginx pod and set an env value as 'var1=val1'. Check the env value existence within the pod
k run nginx --image nginx --env var1=var 
k exec nginx -it -- env            