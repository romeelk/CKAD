## Readiness and liveness

Readiness = is my pod ready to receive traffic

If not K8s will not direct traffic via Service. Endpoints will not be created

Liveness - is my app running ok?

If not K8s will kill and restart the pod

## Readiness that works

## Readiness causes svc to not direct traffic

The following yaml causes the pod not to be ready because the readiness probe is incorrect

```
apiVersion: v1
kind: Pod
metadata:
  name: myappnotready
  labels:
    name: myappnoreadiness
spec:
  restartPolicy: Always
  containers:
  - name: myapp
    image: nginx
    readinessProbe:
      httpGet:
        path: /incorrect
        port: 80
    ports:
      - containerPort: 80

```

Runing the following command:
```
controlplane $ k get po
NAME            READY   STATUS    RESTARTS   AGE
myapp           1/1     Running   0          8m37s
myappnotready   0/1     Running   0          2m41s
```

If you expose the pod as a service traffic will not get there

```
k expose pod myappnotready --port 80

ontrolplane $ k get svc,ep
NAME                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/kubernetes      ClusterIP   10.96.0.1        <none>        443/TCP   5d21h
service/myappnotready   ClusterIP   10.109.118.204   <none>        80/TCP    2m49s

NAME                      ENDPOINTS         AGE
endpoints/kubernetes      172.30.1.2:6443   5d21h
endpoints/myappnotready    
```

Try to get to the svc

```
 k run busybox --image busybox  --rm -it -- /bin/sh
  wget -qO- http://myappnotready.default.svc.cluster.local
wget: can't connect to remote host (10.109.118.204): Connection refused
```
## Let's fix this

Correc the pod manifest

Reapply

```
 k replace -f podinvalidreadiness.yaml --force
```

Do we have svc endpints now?

YES!!!

```
controlplane $ k get svc,ep 
NAME                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/kubernetes      ClusterIP   10.96.0.1        <none>        443/TCP   5d21h
service/myappnotready   ClusterIP   10.109.118.204   <none>        80/TCP    5m32s

NAME                      ENDPOINTS         AGE
endpoints/kubernetes      172.30.1.2:6443   5d21h
endpoints/myappnotready   192.168.1.25:80   5m32s
```


```
 k run busybox --image busybox  --rm -it -- /bin/sh
  wget -qO- http://myappnotready.default.svc.cluster.local
```