## Building container images - 
Make sure you're able to create your own container image using a tool like Docker or Podman.
## Deployment strategies
- Be aware of common deployment strategies like blue/green and canary deployments. Make sure you have a basic idea of how you could implement these strategies in Kubernetes using Kubernetes objects like Deployments and Services.
## Helm
- You’ll need a basic understanding of the helm package manager. You probably don’t need to go too deep here, just know how to install software using Helm.
## API Change Management Process
- The new CKAD curriculum states that you need to be aware of the Kubernetes API change management process, specifically the deprecation policy for the Kubernetes API. Just a general awareness should suffice here.
## Custom resources (CRD)
- CustomResourceDefinitions (CRD) allow you to easily extend the Kubernetes API, creating your own custom resource types. This feature is now part of the CKAD curriculum. You may need to be aware of how to create a CRD, as well as how to create and interact with custom objects based on your new custom type.
## Authentication and Authorization
- The subject of authentication and authorization was previously reserved for the CKA and CKS certifications, and wasn’t part of the CKAD. However, the new curriculum includes this topic. You should know how to do things like give your applications permissions to access the Kubernetes API and interact with role-based access control (RBAC).
Ingress - Ingresses allow you to route traffic from outside the cluster to Services. They are now covered by the CKAD. The main focus is exposing applications, which means creating Ingresses that route traffic to a Service backend.
