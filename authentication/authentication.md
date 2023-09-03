# RBAC

You can check auth mode by inspecting the kube-api pod

```
k get pod/kube-apiserver-controlplane -n kube-system -oyaml  | grep command -9
- apiVersion: v1
    controller: true
    kind: Node
    name: controlplane
    uid: c11353c5-216b-48e9-900c-348c5bb9ab05
  resourceVersion: "2377"
  uid: f0c02236-f8e4-4c68-85f2-a9a77dd6cd32
spec:
  containers:
  - command:
    - kube-apiserver
    - --advertise-address=172.30.1.2
    - --allow-privileged=true
    - --authorization-mode=Node,RBAC
    - --client-ca-file=/etc/kubernetes/pki/ca.crt
    - --enable-admission-plugins=NodeRestriction
    - --enable-bootstrap-token-auth=true
    - --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt
    - --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
```

## Check if you can run a command

You can check if a particular user can run a command

```
kubectl auth can-i list secrets --namespace dev --as dave
```

## List API groups

You can list api groups

```
k  api-resources
```

## Create a role

```
k create role developer --resource=pods --verb=* -oyaml --dry-run=client 
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  creationTimestamp: null
  name: developer
rules:
- apiGroups:
  - ""
  resources:
  - pods
  verbs:
  - '*'
```

Create a role binding that binds to developer user:

```
k create rolebinding dev-binding --role=developer --user=developer -oyaml --dry-run=client 
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  creationTimestamp: null
  name: dev-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: developer
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: developer
```