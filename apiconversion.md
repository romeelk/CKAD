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
