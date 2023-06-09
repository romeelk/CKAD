# API conversion

Kubernetes updates their API control plane. Kuberetes yaml manifest are pinned to a specific version.

When the specification changes you need to know how to update the config files.

## Understanding the kubeapi config
You can find the kubeapi config on linux systems somewhere like:

/etc/kubernetes/manifests
```
cd /etc/kubernetes/manifests
```
## API Groups

The API is logically orgnaized into API groups

Access API groups via kubectl proxy

```
kubectl proxy &
curl -k http://localhost:8001/ 
```

## Conversion of manifest between versions

There is a tool to convert k8s manifests created for a particular version of the API.

It is called kubectl-convert

Install it 

```
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert
```

Make it executable
```
ls 
chmod +x kubectl-convert 
mv kubectl-convert /usr/local/bin/kubectl-convert
```

## Converting an ingress in beta to latest

Run the following:

```
kubectl-convert -f ingress.yaml -o yaml > newver.yaml
```

Notice the version in the apiVer field has been updated

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
  creationTimestamp: null
  name: minimal-ingress
spec:
  ingressClassName: nginx-example
  rules:
  - http:
      paths:
      - backend: {}
        path: /testpath
        pathType: Prefix
status:
  loadBalancer: {}
```
