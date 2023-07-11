# Network policy

Expose pod svc

```
 k expose pod myapp --port 80
```
Run 

```
k run busybox --image busybox --rm -it -- /bin/sh
```

## Deny ingress


## Allow ingress


## Allow dev ns

Create ns dev and label as env=dev

```
k create ns dev
k label namespace/dev  env=dev
```

Apply pol

```
k apply -f allow-dev-namespace.yaml
```

Run pond in dev ns to check access

```
 k run busybox --image busybox --namespace dev  --rm -it -- /bin/sh
 wget -qO- http://myapp.default.svc.cluster.local

```
Above works!!!

Now try from default ns or prod

```
k run busybox --image busybox --namespace=dev --rm -it -- /bin/sh
 wget -qO- http://myapp.default.svc.cluster.local --timeout=2
wget: download timed out
```

```
k run busybox --image busybox --namespace=prod --rm -it -- /bin/sh
 wget -qO- http://myapp.default.svc.cluster.local --timeout=2
wget: download timed out
```