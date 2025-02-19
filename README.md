
# Gitops
- [What is GitOps by RedHat](https://www.redhat.com/en/topics/devops/what-is-gitops)
- [GitOps vs DevOps by RedHat](https://www.redhat.com/en/topics/devops/what-is-gitops#gitops-vs-devops)
- [KCNA Github](https://github.com/walidshaari/Kubernetes-and-Cloud-Native-Associate#kubernetes-fundamentals---46)
- [RH - A sysadmin's guide to basic Kubernetes components](https://www.redhat.com/en/blog/kubernetes-components)

## Monitoring
### Prometheus 
- [Prometheus vs OpenTelemetry](https://signoz.io/blog/opentelemetry-vs-prometheus/)
- Prometheus deals exclusively with time-series metrics.
- Prometheus is a self-contained system with its own storage and query language (PromQL).

### OpenteTemetry 
- [Prometheus vs OpenTelemetry](https://signoz.io/blog/opentelemetry-vs-prometheus/)
- OpenTelemetry supports metrics, distributed traces, and logs.
- jest bardziej kompleksowy od Prometheusa, potrafi to samo + wspiera metrics, traces, and logs.
- OpenTelemetry uses a vendor-neutral, pluggable design allowing integration with various backends.

### Jaeger - tracing
- [Jaeger - docsy](https://www.jaegertracing.io/docs/2.2/)
- Jaeger, inspired by Dapper and OpenZipkin, is a distributed tracing platform created by Uber Technologies and donated to Cloud Native Computing Foundation. 
- It can be used for monitoring microservices-based distributed systems:
- With Jaeger you can: 
    - Monitor and troubleshoot distributed workflows
    - Identify performance bottlenecks
    - Track down root causes
    - Analyze service dependencies

### Zipkin - tracing
- [Zipkin](https://zipkin.io/)
Zipkin is a distributed tracing system. It helps gather timing data needed to troubleshoot latency problems in service architectures. Features include both the collection and lookup of this data.

### Datadog 
- [Datadog - stronka](https://www.datadoghq.com/)
Paid monitoring system!

### Grafana
- [Grafana](https://grafana.com/grafana/)
Grafana is a visualization tool.

### Loki
Loki is a cloud-native log aggregation system that uses label-based indexing for efficient storage and querying. It's designed for scalability and cost-effectiveness, integrating seamlessly with Grafana and other observability tools. Loki is particularly well-suited for containerized environments and high-volume logging scenarios.

## CI/CD
### Which CNCF project for continuous integration and continuous delivery (CI/CD) comes with both a CLI and Web UI?
### Argo
- [Argo CD vs Flux](https://rajputvaibhav.medium.com/argo-cd-vs-flux-cd-right-gitops-tool-for-your-kubernetes-cluster-c71cff489d26)
Argo comes with a powerful UI that helps visualize relations between different objects and monitor them better while with Flux you rely completely on CLI. You can add on the web UI to Flux but it still stays experimental.
- Both a CLI and Web UI

### Jenkins X
- [Jenkins X](https://jenkins-x.io/)
Jenkins X is opinionated and built to work better with technologies like Docker or Kubernetes. It is not a CNCF project.

### Flux
- [Argo CD vs Flux](https://rajputvaibhav.medium.com/argo-cd-vs-flux-cd-right-gitops-tool-for-your-kubernetes-cluster-c71cff489d26)
Flux is a GitOps tool for Kubernetes that automates deployments by syncing cluster state with Git repositories. It continuously monitors Git for changes and applies them to the cluster, enabling automated, version-controlled infrastructure management.
- Nie ma WEB UI
- Supports Helm and Kustomization
- Automation of Container Updates

### Jenkins
Jenkins is an open-source popular and mature CI/CD tool for any kind of workload.
Jenkins can be used to deploy applications on to Kubernetes.
Jenkins is written in Java and have many plugins for any use case.

### CloudBees 
CloudBees is the commercial distribution of Jenkins and Jenkins X for large and compliance first organizations
CloudBees acquired InfraDNA, InfraDNA organization created Jenkins

### CircleCI
CircleCI is a propriety fully managed CI/CD service to make deployments easy and seamless
CircleCI can support deploying applications to Kubernetes

## Deployment strategy 
### Blue/Green
This deployment strategy involves having two identical environments, one hosting the current version of the application (blue) and the other hosting the new version (green). Once the new version is ready and tested in the green environment, the traffic is switched from blue to green. While this method allows for quick rollbacks and minimal downtime, it doesn't inherently support rolling out features to a small subset of users first; instead, it switches all users from the old version to the new one at once.

### Recreate deployments
In this method, the existing version of the application is taken down, and the new version is rolled out. This approach involves downtime, as there is a period when the application is not available to users. Like blue/green deployments, it does not support gradual rollout to a subset of users. Instead, it replaces the old version with the new one for all users simultaneously.

### Canary
Canary deployments involve releasing the new version of an application to a small subset of the user base initially, rather than rolling it out to all users at once. This strategy allows developers and operations teams to monitor the performance and stability of the new release and ensure it behaves as expected under real-world conditions. If the new version proves to be stable and effective, it can then be gradually rolled out to the rest of the user base.

### A/B, Red/Black deployment
Similar to blue/green deployments, red/black deployments involve two identical production environments: one that is active (red) and one that is idle (black). Once the new version is ready, traffic is switched from the red environment to the black environment. This strategy is designed for fast rollbacks and zero downtime but, like blue/green deployments, does not target a small subset of users initially; it switches the entire user base to the new version at once.


### Dark Launches 
Dark launches – Similar to A/B Testing, except you use a feature flag to rollout new features, and rollback by turning off the feature in the software instead
of reverting infrastructure changes


### Rollout 
Rollout is when you replace or update servers with new version of an application


## Availability 
Availability is the quality of being able to be used or obtained.
If there is not enough capacity (memory, CPU, bandwidth) to meet the demand of traffic then users can experience degraded, delayed experience or no access
to services at all.  
Two important values:  
maxSurge:  
- The amount of pods that can be added
maxUnavailable :  
- The amount of pods that can be unavailable


## Serverless
A serverless service could have all or most of the following characteristics:
- Highly elastic and scalable
- highly available
- Highly durable
- Secure by default


### Knative
Kubernetes-based platform to deploy and manage modern serverless workloads.  
Knative is a project to create a standard set of building blocks for Kubernetes to enable serverless development patterns.  

Knative generally is composed of two parts:
- Knative Serving
  - Take containerized code and deploy it with relative ease.
  - Scale to zero costs
- Knative Eventing
  - Trigger serverless functions based on Kubernetes API events
  - Loop in other event sources to trigger serverless functions

Knative defines its own set of Kubernetes Objects as Kubernetes **Custom Resource Definitions (CRDs).**  
Knative has its own CLI called kn, used alongside Kubectl.

### Function as a Service (FaaS) 
Allows developers to focus on just writing pieces of code (functions)  
Has event-driven integration trigger functions based on event data or to emit event data
Generally multiple functions are orchestrated together to create a serverless app  
Functions generally only run when needed

### OpenFaas 
OpenFaas runs serverless functions anywhere Docker runs. Deploys to Kubernetes or OpenShift
Makes it easy for developers to deploy event-driven functions and microservices to Kubernetes without repetitive, boiler-plate coding

### Faasd 
Faasd is a light-weight version of OpenFaaS that doesn’t need Kubernetes to run.  
It can run on a single underpowered machine. It uses Containerd

### Traces
A history of request that is travels through multiple
Apps/services so we can pinpoint performance or failure.

### Open Telemetry (OTEL) 
is a collection of open-source tools, APIs and SDKs to instrument, generate, collect, and export telemetry data.  
Open Telemetry standardizes the way telemetry data (metrics, logs and traces) are generated and collected

The **Open Telemetry collector** is an agent installed on the target machine, or as a dedicate server and is Vendor-agnostic way to receive, process and export
telemetry data

### Klog
Klog
- Klog is the Kubernetes logging library.
- klog generates log messages for the Kubernetes system components.

### Kustomize
Kustomize provides more flexibility when writing Kubernetes configuration files by allowing you to overlay (override) to “patch” configurations.
- Kustomize is built into KubeCTL
Kustomization file defined what will be overwritten in the base components


# Kubernetes
## Kubernetes Components Overview
### Services
Service - A static IP address and DNS name for a set of pods (persists an address even if a pod dies) and a load balancer.  
A “service” can also mean a container that continuously runs.

Kubernetes Services has following **service types**:
- ClusterIP - is the default service type for a K8 service. It is used for internal traffic. External traffic will not reach the service.  
Traffic will be randomly distributed to any targeted pods.    
**When to use ClusterIP**:  
  - Debugging
  - Testing
  - Internal traffic
  - Internal Dashboards  
- Headless - send traffic to very specific pod, when you have stateful pods eg. Database
- NodePort - external service, allows you to use worker node IP address
- LoadBalancer - similar to nodeport except leverages Cloud Service Provider’s (CSPs) load balancer
- ExternalName - ExternalName Services is the same as ClusterIP Service with the exception of instead returning a StaticIP it returns a CNAME record. 
  - What is a CNAME record? - Canonical Name (CName) record is a DNS record that maps one domain name (an alias) to another name (canonical name)
  
K8s Service allows you set a Traffic policies to determine how ingress traffic is routed.
There are 2 types of Traffic policies:
1. External Traffic Policy - how traffic from external sources is routed:
- Cluster – route external traffic to all ready endpoints
- Local - only route to ready node-local endpoints
2. Internal Traffic Policy - how traffic from internal sources is routed (has the same two values as External)  
  
If the traffic policy is Local and there are no node-local endpoints, then kube-proxy does not forward any traffic for the relevant Service
---

### TODO - zapytać perplexity o co tu właściwie chodzi, czy to coś dla NodePort, czy co?
NodePort - allows you to expose a port for Virtual Machines running pods that the Service is managing
Port - Port exposes the Kubernetes service on the specified port within the cluster. Other pods within the cluster can communicate with this server on the specified port.
TargetPort - 

Port
Port exposes the Kubernetes service on the specified port within the cluster.
Other pods within the cluster can communicate with this server on the specified port.

TargetPort
Target Port is the port on which the service will send requests to, that your pod will be listening on.
Your application in the container will need to be listening on this port also.

NodePort
NodePort exposes a service externally to the cluster by means of the target node's IP address and the NodePort.
NodePort is the default setting if the port field is not specified.

### Ingress
Translates HTTP/S rules to point to services


### Kubelet
Kubelet is an agent installed on all nodes  (including both control plane and worker nodes). 
Kublelet allows users to interact with nodes via the API Server and KubeCTL

#### Kubelet Responsibilities
The Kubelet performs the following tasks:  
- Continuously monitors for pod changes.
- Configures the Container Runtime to:
  - Pull container images.
  - Create namespaces.
  - Run containers.
- Uses PodSpec files to determine which images to pull and which containers to run.

#### Kubelet's Communication and Interfaces
Communication with the API Server:
- Sends back HTTP requests to the API server for container logs and execution requests.
- Interacts with Other Interfaces:
  - Container Runtime Interface (CRI) for container runtime operations, using gRPC.
  - Container Storage Interface (CSI) for storage provisioning, also via gRPC.
  - Container Network Interface (CNI) for network provisioning, typically through binaries.

#### Key Points to Remember
- Kubelet is essential for ensuring that containers run as specified.
- It monitors and manages pod states, and uses standard interfaces for storage, runtime, and networking to maintain seamless communication and operation.

### Network Policy
Acts as a virtual firewall at the namespace-level or pod-level

### ConfigMap
allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable. Used to store non-confidential data in key-value pair

### StatefulSet
Stateful Sets are used when you need traffic to be sent to specific pods.
provides guarantees about the ordering and uniqueness of these Pods
  
Stateful Set will always have:
- a unique and predictable name and address
- ordinal index number assigned to each pod
- a persistent volume attached, with a persistent link from pod to the storage
    - If a pod is rescheduled the original Persistent Volume (PV) will be mounted to ensure data integrity and consistency.
- Stateful Set pods will always start in the same order and terminate in reverse order

StatefulSets currently require a “headless” service to manage the identities

### ReplicaSets
ReplicaSet is a way to maintain a desired amount of redundant pods (replicas) to provide a guarantee of availability.

The pod field metadata.ownerReferences determines the link from a pod to a ReplicaSet. (aby wyświetlić kubectl describe pod)

**It is not recommended to directly create ReplicaSets. Instead, a Deployment can create and manage a ReplicaSet for you.**

Horizontal Pod Autoscaler (HPA) can be used to autoscale a ReplicaSet

### Deployment
A Deployment provides declarative updates for Pods and ReplicaSets.
A Deployment Controller changes the actual state to the desired state at a controlled rate.
- The default Deployment Controller can be swapped out for other deployments tools eg:
    - Argo CD, Flux, Jenkin X…..
  
A Deployment define the desired state of ReplicaSets and Pods.
A deployment will create and manage a ReplicaSet.
A ReplicaSet will manage replicas of pod.

### Stateless vs Stateful
#### Stateless
Every request does not care (forgets) about the previous or current state
- ReplicaSets
- Deployment
- DaemonSet
- Job
- CronJob
- Pod

#### Stateful
Every request relies on state data (remembers) All databases are stateful
- StatefulSets
- PersistentVolume (PV)
- PersistentVolumeClaim (PVC)


## Kubernetes - architektura
### Kubernetes components
[Kubernetes components](https://kubernetes.io/docs/concepts/overview/components/)
From a high-level perspective, Kubernetes clusters consist of two different server node types that make up a cluster:
- **Control plane node(s)**  
These are the brains of the operation. Control plane nodes contain various components which manage the cluster and control various tasks like deployment, scheduling and self-healing of containerized workloads.
- **Worker nodes**  
The worker nodes are where applications run in your cluster. This is the only job of worker nodes and they don’t have any further logic implemented. Their behavior, like if they should start a container, is completely controlled by the control plane node.

![Kubernetes architecture](./pictures/KubernetesArchitecture.png)

### Node components (all nodes)
- **kubelet** - An agent that runs on each node in the cluster. It makes sure that containers are running in a Pod. The kubelet talks to the api-server and the container runtime to handle the final stage of starting containers.  
[Kubelet](https://kubernetes.io/docs/concepts/overview/components/#kubelet)  
- **kube-proxy (optional)** - An application that provides routing and filtering rules for ingress (incoming) traffic to pods.  
A network proxy that handles inside and outside communication of your cluster. Instead of managing traffic flow on its own, the kube-proxy tries to rely on the networking capabilities of the underlying operating system if possible.
- **container runtime** - The container runtime is responsible for running the containers on the worker node. For a long time, Docker was the most popular choice, but is now replaced in favor of other runtimes like [containerd](https://containerd.io/).

### Control plane nodes components 
- **API Server - kube-apiserver** - This is the centerpiece of Kubernetes. All other components interact with the api-server and this is where users would access the cluster.  
[Kubernetes API Docs](https://kubernetes.io/docs/concepts/overview/components/#kube-apiserver)  
- **etcd** - A Key/Value database which holds the state of the cluster. [etcd](https://etcd.io/) is a standalone project and not an official part of Kubernetes.
- **Secheduler - kube-scheduler** - determines where to start a pod on worker node, the kube-scheduler chooses a worker node that could fit, based on different properties like CPU and memory.
[Kube docs - kube-scheduler](https://kubernetes.io/docs/concepts/scheduling-eviction/kube-scheduler/)
- **Controller Manager - kube-controller-manager** - detect state changes (if pod crashes, restart it).   
A control loop that watches the state of the cluster and will change the current state back to the desired state.   
Contains different non-terminating control loops that manage the state of the cluster. For example, one of these control loops can make sure that a desired number of your application is available all the time.  
[Kube docs - controller manager](https://kubernetes.io/docs/concepts/overview/components/#kube-controller-manager)
- **Cloud controller manager - cloud-controller-manager (optional)** - Integrates with the cloud provider, can be used to interact with the API of cloud providers, to create external resources like load balancers, storage or security groups.
A Kubernetes control plane component that embeds cloud-specific control logic. The cloud controller manager lets you link your cluster into your cloud provider's API, and separates out the components that interact with that cloud platform from components that only interact with your cluster.
[Kube docs - cloud controller manager](https://kubernetes.io/docs/concepts/overview/components/#kube-controller-manager)

---
**Namespaces** - Kubernetes also has a concept of *namespaces*, which are not to be confused with kernel namespaces that are used to isolate containers. A Kubernetes namespace can be used to divide a cluster into multiple virtual clusters, which can be used for multi-tenancy when multiple teams share a cluster. **Please note that Kubernetes namespaces are not suitable for strong isolation and should more be viewed like a directory on a computer where you can organize objects and manage which user has access to which folder.**

## Kubernetes API 
The core of the Kubernetes control plane is the API server. Without it, communication with the cluster is not possible, every user and every component of the cluster itself needs the api-server. The Kubernetes API lets you query and manipulates the state of API objects in Kubernetes (for example: Pods, Namespaces, ConfigMaps, and Events).  
**The API server is a component of the Kubernetes control plane** that exposes the Kubernetes API. The API server is the front end for the Kubernetes control plane.  
**The main implementation of a Kubernetes API server is kube-apiserver**.   
**kube-apiserver is designed to scale horizontally—that is, it scales by deploying more instances.** 
You can run several instances of kube-apiserver and balance traffic between those instances.
Everything has to go through the API Server.  
  
You can interact with the API Server in three ways:
- UI*
- API
- CLI KubeCTL

![Access Control Overview](./pictures/AccessControlOverview.png)
**Access Control Overview**, retrieved from the [Kubernetes documentation](https://kubernetes.io/docs/concepts/security/controlling-access/)

Before a request is processed by Kubernetes, it has to go through three stages:
- **Authentication** - **The requester needs to present a means of identity to authenticate against the API.** Commonly done with a digital signed certificate (X.509) or with an external identity management system. Kubernetes users are always externally managed. Service Accounts can be used to authenticate technical users.
- **Authorization** - **It is decided what the requester is allowed to do.** In Kubernetes this can be done with Role Based Access Control (RBAC).
- **Admission Control** - In the last step, admission controllers can be used to modify or validate the request. For example, if a user tries to use a container image from an untrustworthy registry, an admission controller could block this request. Tools like the Open Policy Agent can be used to manage admission control externally.

Like many other APIs, the Kubernetes API is implemented as a RESTful interface that is exposed over HTTPS. Through the API, a user or service can create, modify, delete or retrieve resources that reside in Kubernetes.


- [Working with kubernetes API](https://iximiuz.com/en/series/working-with-kubernetes-api/)
#### Resources and Verbs
[Kubernetes API structure and terminology](https://iximiuz.com/en/posts/kubernetes-api-structure-and-terminology/)
Since it's a RESTful land, we'll be operating in terms of resources (loosely, objects of a certain structure) and verbs (actions on these objects).

When resources are discussed, it's important to differentiate a resource as a certain kind of objects from a resource as a particular instance of some kind. 
Thus, **Kubernetes API endpoints are officially named resource types** to avoid ambiguity with the resource instances. 
However, in the wild, **endpoints are often called just resources**, and the actual meaning of the word is derived from the context.

For extensibility reasons, **resource types are organized into API groups**, and the groups are versioned independently from each other:

```shell
$ kubectl api-resources
NAME                     SHORTNAMES   APIVERSION   NAMESPACED   KIND
bindings                              v1           true         Binding
componentstatuses        cs           v1           false        ComponentStatus
configmaps               cm           v1           true         ConfigMap
endpoints                ep           v1           true         Endpoints
events                   ev           v1           true         Event
limitranges              limits       v1           true         LimitRange
namespaces               ns           v1           false        Namespace
nodes                    no           v1           false        Node
persistentvolumeclaims   pvc          v1           true         PersistentVolumeClaim
persistentvolumes        pv           v1           false        PersistentVolume
pods                     po           v1           true         Pod
...
```
#### Kinds aka Object Schemas
The word kind pops up here and there periodically. For instance, in the kubectl api-resources output, you could see that persistentvolumes resource has a corresponding PersistentVolume kind.  
  
Turns out, in Kubernetes, a kind is the name of an object schema. Like the one you'd typically describe using a JSON schema vocabulary. In other words, a kind refers to a particular data structure, i.e. a certain composition of attributes and properties.  

## Running Containers on Kubernetes
When you create a Pod object in Kubernetes, several components are involved in that process, until you get containers running a node.

Here is an example using containerd:
![containerd example](./pictures/containerd_example.png)
**Running Containers in Kubernetes**






### Container Runtimes 
- **containerd** is a lightweight and performant implementation to run containers. Arguably the most popular container runtime right now. It is used by all major cloud providers for the Kubernetes As A Service products.
Jest to projekt open-source rozwijany przez CNCF (Cloud Native Computing Foundation) i używany jako backend przez Dockera oraz inne systemy, takie jak Kubernetes. Containerd obsługuje standard OCI (Open Container Initiative), co zapewnia kompatybilność z różnymi runtime'ami kontenerów, takimi jak runc czy Kata Containers.
- **CRI-O** was created by Red Hat and with a similar code base closely related to podman and buildah. Implementuje interfejs Kubernetes CRI (Container Runtime Interface), umożliwiając uruchamianie kontenerów za pomocą dowolnego runtime zgodnego z OCI (np. runc lub Kata Containers). Jest lekką alternatywą dla Dockera i skupia się na uproszczeniu oraz zwiększeniu wydajności w środowiskach Kubernetes.
- **Docker** - The standard for a long time, but never really made for container orchestration. The usage of Docker as the runtime for Kubernetes has been deprecated and removed in Kubernetes 1.24. Kubernetes has a great blog article that answers all the questions on the matter.
    
The idea of containerd and CRI-O was very simple: provide a runtime that only contains the absolutely essentials to run containers. Nevertheless, they have additional features, like the ability to integrate with container runtime sandboxing tools. These tools try to solve the security problem that comes with sharing the kernel between multiple containers. The most common tools at the moment are:
  
- **gvisor** - Made by Google, provides an application kernel that sits between the containerized process and the host kernel.
- **Kata Containers** - A secure runtime that provides a lightweight virtual machine, but behaves like a container.
Kata Containers to projekt open-source łączący lekkość tradycyjnych kontenerów z bezpieczeństwem maszyn wirtualnych. Każdy kontener uruchamiany jest wewnątrz lekkiej maszyny wirtualnej, co zapewnia izolację na poziomie sprzętowym. Kata Containers są zgodne z OCI i integrują się z Kubernetes poprzez CRI. Są idealne do zastosowań wymagających wysokiego poziomu bezpieczeństwa i izolacji.
- **LXC** [Linux Containers](https://linuxcontainers.org/)
LXC is a well-known Linux container runtime that consists of tools, templates, and library and language bindings. It's pretty low level, very flexible and covers just about every containment feature supported by the upstream kernel.

## Networking
### Ingress
[Kube docs - Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)  
  
Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. Traffic routing is controlled by rules defined on the Ingress resource.  

![Ingress schema](./pictures/networking-objects/ingress.svg)


## DNS - CoreDNS?
### TODO - opisać


Kubernetes distinguishes between four different networking problems that need to be solved:

1. **Container-to-Container communications** - Can be solved by the Pod concept.
2. **Pod-to-Pod communications** - This can be solved with an overlay network.
3. **Pod-to-Service communications** - It is implemented by the kube-proxy and packet filter on the node.
4. **External-to-Service communications** - It is implemented by the kube-proxy and packet filter on the node.

There are different ways to implement networking in Kubernetes, but also three important requirements:
- All pods can communicate with each other across nodes.
- All nodes can communicate with all pods.
- No Network Address Translation (NAT).
  
To implement networking, you can choose from a variety of network vendors like:
### Project Calico - open-source network and network security solution for containers, VMs, native host-based workloads

Calico Network Policies extends the base functionality of Network Policies:
- policies can be applied to any object
- the rules can contain the specific action
- you can use ports, port ranges, protocols, HTTP/ICMP attributes, IPs or subnets, any selectors as a source/target of the rules
- you can control traffic flows via DNAT settings and policies for traffic forwarding

**Encryption In-Transit** - Data that is secure when moving between locations
Algorithms: TLS, SSL  
**Encryption At-Rest** - Data that is secure when residing on storage or within a database
Algorithms: AES, RSA  
**Transport Layer Security (TLS)** - An encryption protocol for data integrity between two or more communicating computer application.  
**Secure Sockets Layers (SSL)** - An encryption protocol for data integrity between two or more communicating computer application  

### Weave
### Cilium

---
**The Container Networking Interface (CNI)** - is a specification (open standard) for writing plugins to configure networking interfaces for linux containers  
A Service Mesh manages service-to-service communication for microservice architectures.  
A service mesh is an infrastructure layer that can provide the following:  
- Reliability (Traffic Management, Retries, Load Balancing)
- Observability (Metrics, Traces)
- Security (TLS Certifications, Identity)


## Security 
- The 4C's of Cloud Native security are Cloud, Clusters, Containers, and Code
- Depth in Defense - a series of defensive mechanisms are layered in order to protect valuable data and information.  
The Cloud Layer is also known as the base layer.  
  
There are two parts to Cluster Layer security  
  
1. Components of the cluster
Securing configurable cluster components
- Controlling access to the Kubernetes API
  - Use Transport Layer Security (TLS) for all API traffic
  - API Authentication
  - API Authorization
- Controlling access to the Kubelet
- Controlling the capabilities of a workload or user at runtime
  - Limiting resource usage on a cluster
  - Controlling what privileges containers run with
  - Preventing containers from loading unwanted kernel modules
  - Restricting network access
  - Restricting cloud metadata API access
  - Controlling which nodes pods may access
- Protecting cluster components from compromise
  - Restrict access to etcd
  - Enable audit logging
  - Restrict access to alpha or beta features
  - Rotate infrastructure credentials frequently
  - Review third party integrations before enabling them
  - Encrypt secrets at rest
  - Receiving alerts for security updates and reporting vulnerabilities

2. Components in the cluster
- Securing the applications running within the cluster
  - RBAC Authorization (Access to the Kubernetes API)
  - Authentication
  - Application secrets management (and encrypting them in etcd at rest)
- Ensuring that pods meet defined Pod Security Standards
  - Quality of Service (and Cluster resource management)
  - Network Policies
  - TLS for Kubernetes Ingress
- Container Layer
  - Container Vulnerability Scanning and OS Dependency Security
  - Image Signing and Enforcement
  - Disallow privileged users
  - Use container runtime with stronger isolation
- Code Layer
- Application code is one of the primary attack surfaces over which you have the most control
  - Access over TLS only
  - Limiting port ranges of communication
  - 3rd Party Dependency Security
  - Static Code Analysis
  - Dynamic probing attacks
- Authentication, Authorization and Accounting (AAA) framework for Identity management systems.
- Authentication — to identify
  - Static passwords
  - One-time password (OTP) — MFA/UFA
  - Digital certificates (x.509)
- Authorization — to get permission
  - Role Based Access Controls (RBAC)
- Accounting (auditing) —to log and audit trail
  - Audit Policies
  - Audit Backends (where the logs will be stored)

A Secret is similar to a ConfigMap with the exception that they can be encrypted
By default,   
**Secrets are unencrypted in etcd store.**

How to keep Secrets safe:
- Enable Encryption at Rest for Secrets
- Enable or configure RBAC rules that restrict reading data in Secrets
- Use mechanisms such as RBAC to limit which principals are allowed to create new Secrets or replace existing ones  
  
Kubernetes provides a ```certificates.k8s.io``` API, which lets you provision TLS certificates signed by a Certificate Authority (CA) that you control. These CA and certificates can be used by your workloads to establish trust.  
    
### What is a x.509 certificate?  
A standard defined by the International Telecommunication Union (ITU) for public key certifications.
X.509 certificates are used in many Internet protocol:
- SSL/TLS and HTTPS
- Signed and encrypted email
- Code Signing and Document Signing
A certificate contains
- An identity — hostname, organization or individual
- A public key — RSA, DSA, ECDA etc…
  
## Serwisy 
### CoreDNS 
CoreDNS is the default DNS server for Kuberentes and ensures pods and services haves Fully Qualified Domain Name (FQDN). Without CoreDNS the cluster communication would cease to work.  

- [Coredns website](https://coredns.io/)
- [Understanding CoreDNS YouTube](https://www.youtube.com/watch?v=qRiLmLACYSY)

The kube-dns service (or its modern replacement, CoreDNS) doesn't run on a specific node. As a Kubernetes service, it's a cluster-wide abstraction that can direct traffic to DNS pods running on any node in the cluster.   
The actual DNS pods (e.g., CoreDNS pods) that provide the DNS functionality:  
1. Are typically deployed as a Deployment or ReplicaSet
2. Can run on any worker node in the cluster
3. Are usually scheduled by the Kubernetes scheduler for high availability

### Proxy 
A proxy is a server application that acts as an intermediary between a client requesting a resource and the server providing that resource

There are many kinds of proxies you will encounter in Kubernetes:
- Kubectl proxy — proxies from a localhost address to the Kubernetes apiserver
- Apiserver proxy — a bastion built into the apiserver, connects a user outside of the cluster to cluster IPs which otherwise might not be reachable

- Kube proxy (optional) — kube-proxy is a network proxy that runs on each node in your cluster.
[Kube docs - kube proxy](https://kubernetes.io/docs/concepts/overview/components/#kube-proxy)  
It is designed to load **balance traffic to pods.**  
Kube-proxy can run in three modes:  
  1. iptables (default). — Suited for simple use cases
  2. Ipvs — Suites for 1000+ services.
  3. Userspace (legacy) — Not recommended for use

- Proxy/Load balancer in front of API servers — acts as load balancer if there are several apiserver
- Cloud Load Balancers — for external cluster traffic to reach pods
- Forward Proxy - A bunch of servers egressing traffic have to pass through the proxy first
- Reverse Proxy - Ingress traffic trying to reach a collection of servers

## Probes - are used to detect the state of a container
- **liveness probes** - The kubelet uses to know when to restart a container.  
- **readiness probes** - The kubelet uses to know when a container is ready to start accepting traffic.  
- **startup probes** - The kubelet uses to know when a container application has started.  
  
  iptables is a user-space utility program that allows a system administrator to configure the IP packet filter rules of the Linux kernel firewall  
    - iptables applies to IPv4
    - ip6tables to IPv6

## Kubectl - cheat sheet 
- get
  - ```kubectl get pods``` - obtain/list pods in current namespace
  - ```kubectl get pods -A``` OR ```kubectl get pods --all-namespaces``` - obtain pods in all namespaces
  - ```kubectl get pods --selector env=development``` OR ```kubectl get pods -l env=development``` - get pods with labels 
- run
  - ```kubectl run nginx --image=nginx``` - run a pod named nginx using the nginx image
- create
  - deployment 
    - ```kubectl create deploy kcna --image=nginx``` - create a deployment named "kcna" with the nginx image
    - ```kubectl create deploy kcna --image=nginx --replicas=5``` -  create a deployment named "kcna" with the nginx image that deploys 5 pods (replicas)
  - job
    - ```kubectl create job hello --image=busybox --echo "Hello World"``` 
  - cronjob 
    - ```kubectl create cronjob hello --image=busybox --schedule="*/5 * * * *" -- echo "Hello World"``` - cronjob uses cron-like expresion
- ```kubectl api-resources``` -  It provides a comprehensive list of all the resource types available in the cluster along with their names, shortnames, API groups, namespaced status, and kind.  
**It's a helpful command for understanding the resources available for use in Kubernetes but does not directly list the API groups alone.**
- ```kubectl api-version``` -  **it is specifically designed to list all the API versions that are available on the server, which include the groups and versions in the format \<group>/\<version>.**  
This command helps users understand the different API versions and groups that their Kubernetes cluster supports, enabling them to use the appropriate API version for their resources and operations.
- scale 
  - ```kubectl scale --replicas=3 deploy/my-ap```
    - update the amount of replicas in the state of deployment object
    - perform a deploy
- autoscale 
  - ```kubectl autoscale rc foo --min=1 --max=5 --cpu-percent=80``` - create a HorizontalPodAutoscaler
- expose
  - ```kubectl expose deployment my-app --type=NodePort --name=my-service --port=80 --targetport=8080 --nodeport=3000``` - expose deployment outside of the cluster 
- top
  - ```kubectl top pod POD_NAME --sort-by=cpu``` -  show metrics for a given pod and sort it by 'cpu'
- logs
  - ```kubectl logs my-pod``` - dump pod logs (stdout)
  - ```kubectl logs -l name=myLabel``` - dump pod logs, with label name=myLabel (stdout)

## Storage
Container Storage Interface (CSI) standardizes how Container Orchestrator Systems (COS) access various storage providers   
Container Orchestrator Systems (f.e. Kubernetes) ->  CSI -> Storage Providers (f.e. Google Cloud Storage, AWS EBS)

### Rook 
Rook provides guarantees about the ordering and uniqueness of these Pods  
It automates the tasks of a storage administrator: deployment, bootstrapping, configuration, provisioning, scaling, upgrading, migration, disaster recovery, monitoring, and resource management.

### MinIO 
MinIO offers high-performance, S3 compatible object storage.  
Native to Kubernetes, MinIO is the only object storage suite available on every public cloud, every Kubernetes distribution, the private cloud and the edge.  
MinIO is software-defined and is 100% open source under GNU AGPL v3.  
Kubernetes supports many types of volumes. A Pod can use any number of volume types simultaneously.  

### Volumes
#### Persistent Volumes
Attaching an external storage to a pod.  
The data will persist even if the pod is terminated. 

#### Ephemeral Volumes
A volume that’s only exists as long as the pod exists.
Intended for temporary data storage.

#### Projected Volumes
Maps several existing volume sources into the same directory

#### Volume Snapshot
Archiving a volume configuration and its data for tollbacks or backup

### Storage classes
A storage class is a way of defining a class of storage that is backed by a provisioner.  
Storage Class can be used by many Persistent Volumes.  
Storage class contains:  
- Provisioner – who is storage? Eg. Amazon EBS
- Parameters – what type of storage of Amazon EBS to use
- reclaimPolicy — If the pod is gone does the volume remain?

### Persistent Volume Claim (PVC)
A Persistent Volume Claim (PVC) is used to decouple Persistent Volumes from pods.  
A PVC asked for a type of storage, and if a PV that meets the criteria is matched, the PV is Claimed and Bound.  

PVCs are similar to a Pod requesting resources from a Node.  
- Pods consume node resources
    - PVCs consume PV resources
- Pods can request specific levels of resources (CPU and Memory)
    - PVCs can request specific size and access modes (e.g., they can be mounted ReadWriteOnce, ReadOnlyMany or ReadWriteMany, see AccessModes).

### ConfigMaps
A ConfigMap is an API object used to store non-confidential data in key-value pairs for pods  
Pods can consume ConfigMaps as:  
- environment variables
- command-line arguments
- configuration files in a volume
  
A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.

## Service Mesh
- [Tech with Nana - Service Mesh and Istio](https://www.youtube.com/watch?v=16fgzklcF7Y)

Service Mesh is a solution for managing communication between individual microservices in a microservice application. It addresses several challenges that arise when moving from a monolithic to a microservices architecture:

1. **Service Communication**: Microservices need to know how to talk to each other, requiring endpoint configuration for each service[1].
2. **Security**: Within a Kubernetes cluster, communication between microservices is often insecure, using HTTP or other non-encrypted protocols[1].
3. **Retry Logic**: Each microservice needs retry logic to ensure robustness in case of connection issues[1].
4. **Metrics and Monitoring**: Developers need to add monitoring and tracing logic to each service[1].

## Service Mesh Solution

Service Mesh addresses these challenges by:

1. **Sidecar Pattern**: Extracting non-business logic into a small sidecar application that acts as a proxy[1].
2. **Control Plane**: Automatically injecting proxies into microservice pods[1].
3. **Traffic Split**: Enabling easy configuration of traffic routing, such as canary deployments[1].

## Istio Architecture

Istio is an implementation of Service Mesh with the following components:

1. **Data Plane**: Consists of Envoy proxies injected into each microservice pod[1].
2. **Control Plane**: Managed by istiod, which configures and manages the Envoy proxies[1].
3. **Istio Ingress Gateway**: Acts as an entry point into the Kubernetes cluster[1].

## Istio Configuration

Istio is configured using Kubernetes Custom Resource Definitions (CRDs), including:

1. **Virtual Service**: Configures traffic routing to specific services[1].
2. **Destination Rule**: Configures policies for traffic after routing[1].
3. **Gateway**: Configures the Istio Ingress Gateway[1].

## Key Istio Features

1. **Dynamic Service Discovery**: Automatically detects and registers new microservices[1].
2. **Security**: Acts as a Certificate Authority, enabling mutual TLS between services[1].
3. **Metrics and Tracing**: Automatically gathers metrics and tracing data from proxies[1].
4. **Traffic Management**: Enables advanced routing and traffic splitting capabilities[1].

By implementing Service Mesh with Istio, developers can focus on business logic while the infrastructure handles complex networking, security, and monitoring tasks.


## Kubernetes packaging
[When to use Kubernetes operators vs. Helm charts](https://www.techtarget.com/searchitoperations/tip/When-to-use-Kubernetes-operators-vs-Helm-charts) 
  
TL;DR; Helm is great for simple applications, packaging, and quick deployments using templated YAML manifests. Operators are better for complex applications with custom configurations and automation requirements, essentially encapsulating operational expertise into code. You can even use both together! 

### Helm Charts  
Helm is a package manager designed specifically for Kubernetes and improves the management of the YAML manifests required to create Kubernetes projects. At the heart of Helm is the packaging format called charts. Each chart comprises one or more Kubernetes manifests -- and a given chart can have child charts and dependent charts, as well.
  
Thus, Helm can tackle the complexities of dependency management for a Kubernetes project. Rather than an IT admin simply listing the files to install via kubectl, a single command can install an entire application, and Helm will pull the required dependencies and apply the manifests.
  
Helm also retains a release history of all deployed charts, so IT teams can go back to a previous release if something goes wrong.

### Kubernetes operators
However, as time progresses and developer teams unlock the full potential of the platform, the application becomes complex and grows in tandem with its additional requirements -- like statefulness -- and requires more complex logic. This complexity creates challenges for authoring those Helm charts-templatized YAML manifests; at this point, it is time to adopt the powerful operator pattern supported in Kubernetes.
   
Operators are geared toward site reliability engineering teams to manage the complex runbooks that orchestrate the deployment of a complex application, along with automating mundane tasks for the Kubernetes platform.
  
Kubernetes operators build on custom resources and controllers. In plain terms, an IT admin can define their resources in Kubernetes and publish logic -- via an operator -- that can handle CRUD operations for the custom resource. These custom resources can model a complex application or a standard templatized application; the operators maintain the resource's lifecycle.

## IAM w Kubernetesie
### **IAM w Kubernetesie**
IAM w Kubernetesie obejmuje:
1. **Kto** (np. użytkownik, grupa lub konto usługi) ma dostęp do zasobów.
2. **Co** może zrobić (np. odczyt, zapis, usunięcie).
3. **Gdzie** (np. w danym namespace).

### **RBAC - Role-Based Access Control**

To enable RBAC, start the API server with the --authorization-mode flag
```Kube-apiserver –authorization-mode=RBAC``` - enable RBAC
With Kubernetes RBAC there are only Allow Rules, Everything is Deny by default.

The RBAC API declares four kinds of Kubernetes object: Role and RoleBinding, ClusterRole and ClusterRoleBinding.

A Role is a set of permissions for a particular namespace
A ClusterRole is a set of permissions across all namespace
Role Binding and Cluster Role Binding, link Permissions to to Subjects (an Identity).

RBAC to mechanizm zarządzania dostępem oparty na rolach, który umożliwia przypisywanie uprawnień użytkownikom lub usługom w Kubernetesie.

#### **Kluczowe komponenty RBAC**
1. **Role**: Definiuje uprawnienia dla zasobów w obrębie jednego namespace.
   - Przykład: Dostęp do odczytu podów w namespace `development`.
2. **ClusterRole**: Podobna do Role, ale działa na poziomie całego klastra lub zasobów niezwiązanych z namespace.
   - Przykład: Dostęp do wszystkich podów we wszystkich namespaces.
3. **RoleBinding**: Przypisuje Role użytkownikowi, grupie lub kontu usługi w danym namespace.
4. **ClusterRoleBinding**: Przypisuje ClusterRole na poziomie całego klastra.

#### **Proces RBAC**
1. **Uwierzytelnianie (Authentication)**: Weryfikacja tożsamości użytkownika za pomocą certyfikatów X.509, tokenów lub innych metod.
2. **Autoryzacja (Authorization)**: Sprawdzanie, czy użytkownik ma odpowiednie uprawnienia zdefiniowane w Role/ClusterRole.
3. **Admission Control**: Ostateczna walidacja i modyfikacja żądań zgodnie z politykami.

#### **Przykład definicji RBAC w YAML**
```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: development
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
```
Powyższa rola pozwala na odczyt podów w namespace `development`.

### **Porównanie RBAC i ABAC**
- **RBAC** opiera się na rolach przypisanych użytkownikom i grupom.
- **ABAC (Attribute-Based Access Control)** umożliwia bardziej dynamiczne polityki dostępu oparte na atrybutach (np. czas, lokalizacja).

### **Najlepsze praktyki RBAC**
1. Zasada najmniejszych uprawnień (**Least Privilege Principle**) – przyznawaj minimalne wymagane uprawnienia.
2. Wersjonowanie polityk dostępu jako kodu – łatwiejsze zarządzanie i audyt.
3. Regularny przegląd ról i uprawnień – uniknięcie nadmiarowych dostępów.
https://kapitanhack.pl/2023/08/16/id-sec/co-to-jest-rbac-porownanie-rbac-z-abac/


Kubernetes oferuje jeszcze kilka innych mechanizmów kontroli dostępu i zarządzania tożsamością:
1. **Network Policies**: Umożliwiają kontrolę przepływu ruchu między podami oraz między podami a punktami końcowymi sieci, zapewniając mikrosegmentację i zwiększając bezpieczeństwo aplikacji.

2. **Service Accounts**: Pozwalają na przypisanie specyficznych uprawnień do podów, umożliwiając szczegółową kontrolę dostępu i audyt.

3. **Admission Controllers**: Są to wtyczki, które przechwytują żądania do serwera API Kubernetes przed trwałym zapisem obiektu, ale po uwierzytelnieniu i autoryzacji żądania. Mogą one modyfikować lub odrzucać żądania na podstawie zdefiniowanych polityk.

4. **Pod Security Policies (PSP)**: Chociaż są one wycofywane, wciąż są używane w niektórych środowiskach. PSP definiują zestaw warunków, które pod musi spełnić, aby został zaakceptowany przez system[2].

5. **Open Policy Agent (OPA)**: To narzędzie open-source, które można zintegrować z Kubernetes do definiowania i egzekwowania polityk w całym stosie.

## Workload management
### Deployments
Deployments are the primary method for managing stateless applications in Kubernetes. They:
- Provide declarative updates for Pods and ReplicaSets
- Allow easy scaling of applications
- Support rolling updates and rollbacks
- Manage the desired state of the application, ensuring the specified number of replicas are running
Deployments are ideal for stateless applications that don't require persistent storage or stable network identities.

### StatefulSets
StatefulSets are designed to manage stateful applications in Kubernetes. Key features include:
- Stable, unique network identifiers for each pod
- Ordered deployment and scaling of pods
- Persistent storage management
- Integration with Persistent Volumes for data persistence
StatefulSets are perfect for applications like databases, distributed systems, or any workload requiring stable network identity and persistent storage.

### DaemonSets
DaemonSets ensure that a copy of a pod runs on all (or some) nodes in a Kubernetes cluster. They are useful for:
- Deploying cluster-wide services (e.g., monitoring agents, log collectors)
- Running a pod on every node automatically
- Ensuring specific pods are present on nodes with certain characteristics
DaemonSets are ideal for cluster-level operations and services that need to run on all or specific nodes.

### Vertical Pod Autoscaler (VPA)
The Vertical Pod Autoscaler automatically adjusts the CPU and memory reservations for pods to optimize resource utilization. It:
- Analyzes the historical and current resource usage of pods
- Recommends and can automatically apply optimal CPU and memory requests
- Helps improve cluster resource utilization and application performance
VPA is particularly useful for applications with varying resource needs or those that are difficult to manually tune.

### ReplicationController
ReplicationController is an older Kubernetes resource for ensuring a specified number of pod replicas are running. Key aspects include:
- Maintains a stable set of replica pods running at any given time
- Ensures the specified number of pods are always available
- Replaces pods if they fail, are deleted, or are terminated

### Jobs
Run-to-completion workloads for batch processes or one-time tasks.
- Run-to-completion workloads
- Ensure a specified number of pods successfully terminate
- Useful for batch processes, data migrations, or one-time tasks

### CronJobs
Time-based Jobs that run periodically
- Time-based Jobs
- Schedule Jobs to run periodically
- Ideal for automated tasks, backups, or report generation

### ReplicaSets
Ensure a specified number of pod replicas are running.
- Ensure a specified number of pod replicas are running at any given time
- Often used indirectly through Deployments
- Provide pod redundancy and scaling capabilities

### Horizontal Pod Autoscaler (HPA)
Automatically scales the number of pods based on CPU utilization or custom metrics.
- Automatically scales the number of pods in a Deployment, ReplicaSet, or StatefulSet
- Based on observed CPU utilization or custom metrics

### Custom Resources and Operators
Extend Kubernetes API to define and manage application-specific resources.
- Extend Kubernetes API to define and manage application-specific resources
- Allow for complex, stateful applications to be managed natively in Kubernetes

### Pods
The smallest deployable units in Kubernetes, often managed by higher-level controllers.
- The smallest deployable units in Kubernetes
- Can be created and managed directly, though it's usually better to use controllers


### TODO
# A Kubernetes developer wants to prevent a job from living after a certain amount of time when it has finished execution. 
- [TTL-after-finished Controller](https://kubernetes.io/docs/concepts/workloads/controllers/ttlafterfinished/)
### Do opisania/sprawdzenia
- TerminateAfterMs property within Manifest File
- TTL property within Deployment file


# CNCF - Cloud native computing foundation

The CNCF is composed of three main bodies:
- Governing Board (GB) - Marketing Committee
  - responsible for marketing
  - other business oversight
  - budget decisions
- Technical Oversight Committee (TOC) - Special Interest Groups (SIGs) - **provides technical leadership to the cloud native community**
  - defining and maintaining the technical vision for the Cloud Native Computing Foundation,
  - approving new projects and creating a conceptual architecture for the projects,
  - aligning projects and removing or archiving projects,
  - accepting feedback from end user committee and mapping to projects,
  - aligning interfaces to components under management (code reference implementations before standardizing), and
  - defining common practices to be implemented across CNCF projects.
- End User Community (EUC) - End User SIGs, User Groups
  - Providing feedback from companies and startups to improve cloud-native ecosystem

---

Special Interest Groups (SIGs) are specialized committees that work under (report to) the TOC.  
SIGs include around:
- Traffic
- Observability
- Governance
- App Delivery
- Core and Applied Architectures
- Security  
  
CNCF End Users are:
- Individual or organizations that use cloud-native technologies
- But they do not sell cloud-native services

# Distributions 
## Minikube
Minikube sets up a local single-node Kubernetes cluster on macOS, Linux, and Windows for learning purposes.
- Supports the latest Kubernetes release
- Cross-platform
- Deploy as a VM, a container, or on bare-metal
- Multiple container runtimes
- Docker API endpoint for blazing fast image pushes
- Advanced features such as LoadBalancer, filesystem mounts, and FeatureGates
- Addons for easily installed Kubernetes applications
- Supports common CI environments

## K3s and K3d
- K3s - runs in VMs
K3s is a lightweight tool designed to run production-level Kubernetes workloads for low-resourced and remotely located IoT and Edge devices and Bare metal.  
K3s does not use kubelet, but it runs kubelet on the host machine and uses the host’s scheduling mechanism to run containers  
  
k3s can have tighter security deployment than k8s because of their small attack surface area.

### K3d is a platform-agnostic, lightweight wrapper that runs K3s in a docker container. 
- K3d - runs in container
It helps run and scale single or multi-node K3S clusters quickly without further setup while maintaining a high availability mode.

## Kind
- Runs in containers
Primarily designed to test Kubernetes, Kind (Kubernetes in Docker) helps you run Kubernetes clusters locally and in CI pipelines using Docker containers as “nodes”.
It is an open-source CNCF certified Kubernetes installer that supports highly available multi-node clusters and builds Kubernetes release builds from its source.


## MicroK8s
Canonical is the company that publishers of Ubuntu
MicroK8s is created by Canonical and is **installed using Snap**.
  
It is optimized for quick and easy installation of single and multi-node clusters on multiple operating systems, including macOS, Linux, and Windows (as long as you have snap).
It is ideal for running Kubernetes in the cloud, local development environments, and Edge and IoT devices
Microk8s is modular in design, you start with nothing and can enable addons to quickly use exactly what you need

# Losowe
In Kubernetes, two primary ways to attach metadata to objects are **Labels** and **Annotations**:

1. **Labels**:
   - Labels are key-value pairs used to identify and organize Kubernetes objects.
   - They are primarily used for selection and grouping of objects (e.g., using selectors in deployments or services).
   - Example use cases: marking pods as part of a specific application, version, or environment.
   - Example YAML:
     ```yaml
     metadata:
       labels:
         app: my-app
         version: v1
     ```

2. **Annotations**:
   - Annotations are key-value pairs used to attach arbitrary, non-identifying metadata to objects.
   - Unlike labels, annotations cannot be used for selecting or grouping objects.
   - They are often used for storing additional information, such as build details, deployment history, or pointers to external systems.
   - Example YAML:
     ```yaml
     metadata:
       annotations:
         buildVersion: "1.0.0"
         owner: "team-a"
     ```

Both labels and annotations are defined under the `metadata` section of Kubernetes objects and serve different purposes in managing and organizing resources within a cluster.

### Cluster Autoscaling 
Cluster Auto Scaling (Cluster Autoscaler or Karpenter)
Add or remove Nodes (compute servers) based on demand

### Kubernetes Event-driven Autoscaling (KEDA) 
Kubernetes Event-driven Autoscaling (KEDA) allows you scale based on event data.


## BusyBox
BusyBox combines tiny versions of many common UNIX utilities into a single small executable  
It’s The Swiss Army knife of Embedded Linux, as the single executable replaces basic functions of more than 300 common commands  
BusyBox can be used to interactively debug Services to ensure they are working.  