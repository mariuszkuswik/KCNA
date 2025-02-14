
# Gitops
- [What is GitOps by RedHat](https://www.redhat.com/en/topics/devops/what-is-gitops)
- [GitOps vs DevOps by RedHat](https://www.redhat.com/en/topics/devops/what-is-gitops#gitops-vs-devops)
- [KCNA Github](https://github.com/walidshaari/Kubernetes-and-Cloud-Native-Associate#kubernetes-fundamentals---46)

## Monitoring
### Prometheus 
- [Prometheus vs OpenTelemetry](https://signoz.io/blog/opentelemetry-vs-prometheus/)
- Prometheus deals exclusively with time-series metrics.
- Prometheus is a self-contained system with its own storage and query language (PromQL).

### Opentelemetry 
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
- Paid monitoring system!

### Grafana
- [Grafana](https://grafana.com/grafana/)
- Grafana is a visualization tool.

### Loki

## CI/CD
### Which CNCF project for continuous integration and continuous delivery (CI/CD) comes with both a CLI and Web UI?
### Argo
- [Argo CD vs Flux](https://rajputvaibhav.medium.com/argo-cd-vs-flux-cd-right-gitops-tool-for-your-kubernetes-cluster-c71cff489d26)
Argo comes with a powerful UI that helps visualize relations between different objects and monitor them better while with Flux you rely completely on CLI. You can add on the web UI to Flux but it still stays experimental.
Ma WEB UI

### Jenkins X
- [Jenkins X](https://jenkins-x.io/)
Jenkins X is opinionated and built to work better with technologies like Docker or Kubernetes. It is not a CNCF project.

### Flux
- [Argo CD vs Flux](https://rajputvaibhav.medium.com/argo-cd-vs-flux-cd-right-gitops-tool-for-your-kubernetes-cluster-c71cff489d26)
Flux is a more direct approach to GitOps with lesser human interference. 
Nie ma WEB UI


## Deployment strategy 
### Blue/Green
This deployment strategy involves having two identical environments, one hosting the current version of the application (blue) and the other hosting the new version (green). Once the new version is ready and tested in the green environment, the traffic is switched from blue to green. While this method allows for quick rollbacks and minimal downtime, it doesn't inherently support rolling out features to a small subset of users first; instead, it switches all users from the old version to the new one at once.

### Recreate deployments
In this method, the existing version of the application is taken down, and the new version is rolled out. This approach involves downtime, as there is a period when the application is not available to users. Like blue/green deployments, it does not support gradual rollout to a subset of users. Instead, it replaces the old version with the new one for all users simultaneously.

### Canary
Canary deployments involve releasing the new version of an application to a small subset of the user base initially, rather than rolling it out to all users at once. This strategy allows developers and operations teams to monitor the performance and stability of the new release and ensure it behaves as expected under real-world conditions. If the new version proves to be stable and effective, it can then be gradually rolled out to the rest of the user base.

### Red/Black deployment
Similar to blue/green deployments, red/black deployments involve two identical production environments: one that is active (red) and one that is idle (black). Once the new version is ready, traffic is switched from the red environment to the black environment. This strategy is designed for fast rollbacks and zero downtime but, like blue/green deployments, does not target a small subset of users initially; it switches the entire user base to the new version at once.

# Kubernetes
## Kubernetes - architektura
[Kubernetes components](https://kubernetes.io/docs/concepts/overview/components/)
From a high-level perspective, Kubernetes clusters consist of two different server node types that make up a cluster:
- Control plane node(s)
    These are the brains of the operation. Control plane nodes contain various components which manage the cluster and control various tasks like deployment, scheduling and self-healing of containerized workloads.
- Worker nodes
    The worker nodes are where applications run in your cluster. This is the only job of worker nodes and they don’t have any further logic implemented. Their behavior, like if they should start a container, is completely controlled by the control plane node.

![Kubernetes architecture](./pictures/KubernetesArchitecture.png)
**Kubernetes architecture**
Similar to a microservice architecture you would choose for your own application, Kubernetes incorporates multiple smaller services that need to be installed on the nodes.

### Control plane nodes typically host the following services...  
- **kube-apiserver** - This is the centerpiece of Kubernetes. All other components interact with the api-server and this is where users would access the cluster.
- **etcd** - A database which holds the state of the cluster. [etcd](https://etcd.io/) is a standalone project and not an official part of Kubernetes.
- **kube-scheduler** - When a new workload should be scheduled, the kube-scheduler chooses a worker node that could fit, based on different properties like CPU and memory.
- **kube-controller-manager** - Contains different non-terminating control loops that manage the state of the cluster. For example, one of these control loops can make sure that a desired number of your application is available all the time.
- **cloud-controller-manager (optional)** - Can be used to interact with the API of cloud providers, to create external resources like load balancers, storage or security groups.

### Components of worker nodes  
- **container runtime** - The container runtime is responsible for running the containers on the worker node. For a long time, Docker was the most popular choice, but is now replaced in favor of other runtimes like [containerd](https://containerd.io/).
- **kubelet** - A small agent that runs on every worker node in the cluster. The kubelet talks to the api-server and the container runtime to handle the final stage of starting containers.
- **kube-proxy** - A network proxy that handles inside and outside communication of your cluster. Instead of managing traffic flow on its own, the kube-proxy tries to rely on the networking capabilities of the underlying operating system if possible.

---
**Namespaces** - Kubernetes also has a concept of *namespaces*, which are not to be confused with kernel namespaces that are used to isolate containers. A Kubernetes namespace can be used to divide a cluster into multiple virtual clusters, which can be used for multi-tenancy when multiple teams share a cluster. **Please note that Kubernetes namespaces are not suitable for strong isolation and should more be viewed like a directory on a computer where you can organize objects and manage which user has access to which folder.**

## Kubernetes API 
The Kubernetes API is the most important component of a Kubernetes cluster. Without it, communication with the cluster is not possible, every user and every component of the cluster itself needs the api-server.

![Access Control Overview](./pictures/AccessControlOverview.png)

**Access Control Overview**, retrieved from the [Kubernetes documentation](https://kubernetes.io/docs/concepts/security/controlling-access/)


Before a request is processed by Kubernetes, it has to go through three stages:
- **Authentication** - **The requester needs to present a means of identity to authenticate against the API.** Commonly done with a digital signed certificate (X.509) or with an external identity management system. Kubernetes users are always externally managed. Service Accounts can be used to authenticate technical users.
- **Authorization** - **It is decided what the requester is allowed to do.** In Kubernetes this can be done with Role Based Access Control (RBAC).
- **Admission Control** - In the last step, admission controllers can be used to modify or validate the request. For example, if a user tries to use a container image from an untrustworthy registry, an admission controller could block this request. Tools like the Open Policy Agent can be used to manage admission control externally.

Like many other APIs, the Kubernetes API is implemented as a RESTful interface that is exposed over HTTPS. Through the API, a user or service can create, modify, delete or retrieve resources that reside in Kubernetes.

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
- Project Calico
- Weave
- Cilium


### Kubernetes API Basics - Resources, Kinds, and Objects
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




## Serwisy 
### CoreDNS 
- [Coredns website](https://coredns.io/)
- [Understanding CoreDNS YouTube](https://www.youtube.com/watch?v=qRiLmLACYSY)
CoreDNS has been the default name Domain Name System (DNS) since K8s 1.3

### Kube-dns
- [KubeDNS](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)

### Kubelet
An agent that runs on each node in the cluster. It makes sure that containers are running in a Pod.

- [Kubelet](https://kubernetes.io/docs/concepts/overview/components/#kubelet)
## What are two Kubernetes components that are essential for worker nodes?

### Scheduler 
- [Scheduler](https://kubernetes.io/docs/concepts/scheduling-eviction/kube-scheduler/)
A scheduler watches for newly created Pods that have no Node assigned. For every Pod that the scheduler discovers, the scheduler becomes responsible for finding the best Node for that Pod to run on. The scheduler reaches this placement decision taking into account the scheduling principles described below.

### Controller Manager
Control plane component that runs controller processes.
https://kubernetes.io/docs/concepts/overview/components/#kube-controller-manager


### Cloud Controller Manager
A Kubernetes control plane component that embeds cloud-specific control logic. The cloud controller manager lets you link your cluster into your cloud provider's API, and separates out the components that interact with that cloud platform from components that only interact with your cluster.
https://kubernetes.io/docs/concepts/overview/components/#kube-controller-manager

### The API server
API server is a component of the Kubernetes control plane that exposes the Kubernetes API.
https://kubernetes.io/docs/concepts/overview/components/#kube-apiserver

### Kube Proxy
kube-proxy is a network proxy that runs on each node in your cluster, implementing part of the Kubernetes Service concept.
https://kubernetes.io/docs/concepts/overview/components/#kube-proxy

## Kubectl cheat sheet 
- ```kubectl api-resources``` -  It provides a comprehensive list of all the resource types available in the cluster along with their names, shortnames, API groups, namespaced status, and kind. It's a helpful command for understanding the resources available for use in Kubernetes but does not directly list the API groups alone.

- ```kubectl api-version``` -  it is specifically designed to list all the API versions that are available on the server, which include the groups and versions in the format <group>/<version>. This command helps users understand the different API versions and groups that their Kubernetes cluster supports, enabling them to use the appropriate API version for their resources and operations.

To list the available API groups and their versions you can run kubectl with the “api-versions” option:

kubectl api-versions |more
admissionregistration.k8s.io/v1beta1
apiextensions.k8s.io/v1beta1
apiregistration.k8s.io/v1
apiregistration.k8s.io/v1beta1
...


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
- **ABAC (Attribute-Based Access Control)** umożliwia bardziej dynamiczne polityki dostępu oparte na atrybutach (np. czas, lokalizacja)[9].

### **Najlepsze praktyki RBAC**
1. Zasada najmniejszych uprawnień (**Least Privilege Principle**) – przyznawaj minimalne wymagane uprawnienia.
2. Wersjonowanie polityk dostępu jako kodu – łatwiejsze zarządzanie i audyt.
3. Regularny przegląd ról i uprawnień – uniknięcie nadmiarowych dostępów.
[9] https://kapitanhack.pl/2023/08/16/id-sec/co-to-jest-rbac-porownanie-rbac-z-abac/


Kubernetes oferuje jeszcze kilka innych mechanizmów kontroli dostępu i zarządzania tożsamością:
1. **Network Policies**: Umożliwiają kontrolę przepływu ruchu między podami oraz między podami a punktami końcowymi sieci, zapewniając mikrosegmentację i zwiększając bezpieczeństwo aplikacji.

2. **Service Accounts**: Pozwalają na przypisanie specyficznych uprawnień do podów, umożliwiając szczegółową kontrolę dostępu i audyt[1].

3. **Admission Controllers**: Są to wtyczki, które przechwytują żądania do serwera API Kubernetes przed trwałym zapisem obiektu, ale po uwierzytelnieniu i autoryzacji żądania. Mogą one modyfikować lub odrzucać żądania na podstawie zdefiniowanych polityk[2].

4. **Pod Security Policies (PSP)**: Chociaż są one wycofywane, wciąż są używane w niektórych środowiskach. PSP definiują zestaw warunków, które pod musi spełnić, aby został zaakceptowany przez system[2].

5. **Open Policy Agent (OPA)**: To narzędzie open-source, które można zintegrować z Kubernetes do definiowania i egzekwowania polityk w całym stosie[4].

## Workload management
### Deployments
Deployments are the primary method for managing stateless applications in Kubernetes. They:
- Provide declarative updates for Pods and ReplicaSets
- Allow easy scaling of applications
- Support rolling updates and rollbacks
- Manage the desired state of the application, ensuring the specified number of replicas are running
Deployments are ideal for stateless applications that don't require persistent storage or stable network identities[1][4].

### StatefulSets
StatefulSets are designed to manage stateful applications in Kubernetes. Key features include:
- Stable, unique network identifiers for each pod
- Ordered deployment and scaling of pods
- Persistent storage management
- Integration with Persistent Volumes for data persistence
StatefulSets are perfect for applications like databases, distributed systems, or any workload requiring stable network identity and persistent storage[2][5].

### DaemonSets
DaemonSets ensure that a copy of a pod runs on all (or some) nodes in a Kubernetes cluster. They are useful for:
- Deploying cluster-wide services (e.g., monitoring agents, log collectors)
- Running a pod on every node automatically
- Ensuring specific pods are present on nodes with certain characteristics
DaemonSets are ideal for cluster-level operations and services that need to run on all or specific nodes[1].

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
Run-to-completion workloads for batch processes or one-time tasks[1].
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

Both labels and annotations are defined under the `metadata` section of Kubernetes objects and serve different purposes in managing and organizing resources within a cluster[1][2][7].

# TODO


### TODO - niech GPT wyjasni pytanie
Question: Let's assume that an organization needs to process large amounts of data in bursts, on a cloud-based Kubernetes cluster. For instance: each Monday morning, they need to run a batch of 1000 compute jobs of 1 hour each, and these jobs must be completed by Monday night. What's going to be the most cost-effective method? Possible answers:
A. Run a group of nodes with the exact required size to complete the batch on time, and use a combination of taints, tolerations, and nodeSelectors to reserve these nodes to the batch jobs.
B. Leverage the Kubernetes Cluster Autoscaler to automatically start and stop nodes as they're needed.
C. Commit to a specific level of spending to get discounted prices (with e.g. “reserved instances” or similar mechanisms).
D. Use PriorityСlasses so that the weekly batch job gets priority over other workloads running on the cluster, and can be completed on time.


Poprawne B

### TODO 

Question: Which statement about Ingress is correct? Possible answers:
A. Ingress provides a simple way to track network endpoints within a cluster.
B. Ingress is a Service type like NodePort and ClusterIP.
C. Ingress is a construct that allows you to specify how a Pod is allowed to communicate.
D. Ingress exposes routes from outside the cluster to services in the cluster.

Poprawne D


This is correct because:
Ingress is defined as an API object that manages external access to services within a Kubernetes cluster15.
It acts as a single entry point for incoming traffic, routing it to the appropriate services based on the routing rules set by the developer1.
Ingress provides routing rules to manage access to the services within a Kubernetes cluster, typically using HTTP and HTTPS protocols35.
It allows you to expose multiple services under the same IP address, providing features like SSL termination, load balancing, and name-based virtual hosting69.
The other options are incorrect:
A. This is not the primary function of Ingress.
B. Ingress is not a Service type, but rather a separate API object26.
C. This description is more applicable to NetworkPolicies, not Ingress.

Question: Which storage operator in Kubernetes can help the system to self-scale, self-heal, etc? Possible answers:
A. Rook
B. Kubernetes
C. Helm
D. Container Storage Interface (CSI)


Poprawne A




Question: What are the initial namespaces that Kubernetes starts with? Possible answers:
A. default, kube-system, kube-public, kube-node-lease
B. default, system, kube-public
C. kube-default, kube-system, kube-main, kube-node-lease
D. kube-default, system, kube-main, kube-primary

Poprawne A




Question: What is a probe within Kubernetes? Possible answers:
A. A monitoring mechanism of the Kubernetes API.
B. A pre-operational scope issued by the kubectl agent.
C. A diagnostic performed periodically by the kubelet on a container.
D. A logging mechanism of the Kubernetes API.

Poprawne C




Question: Which feature enables Image Placement Policies to be mapped to target clusters? Possible answers:
A. YAML
B. Labels
C. JSON
D. Categories

Poprawne D


 What native runtime is Open Container Initiative (OCI) compliant?

    A. runC Most Voted
    B. runV
    C. kata-containers
    D. gvisor

A

Question: What feature must a CNI support to control specific traffic flows for workloads running in Kubernetes? Possible answers: 
A. Border Gateway Protocol
B. IP Address Management
C. Pod Security Policy
D. Network Policies;;

Good answer: 
D. Network Policies;;;



Question: What is the main role of the Kubernetes DNS within a cluster? Possible answers:
A. Acts as a DNS server for virtual machines that are running outside the cluster.
B. Provides a DNS as a Service, allowing users to create zones and registries for domains that they own.
C. Allows Pods running in dual stack to convert IPv6 calls into IPv4 calls.
D. Provides consistent DNS Names for Pods and Services for workloads that need to communicate with each other.

Good answer: D. Provides consistent DNS Names for Pods and Services for workloads that need to communicate with each other.


Question: Scenario: You have a Kubernetes cluster hosted in a public cloud provider. When trying to create a Service of type LoadBalancer, the external-ip is stuck in the "Pending" state. Which Kubernetes component is failing in this scenario? Possible answers:
A. Cloud Controller Manager
B. Load Balancer Manager
C. Cloud Architecture Manager
D. Cloud Load Balancer Manager

Poprawne A


Question: What are the characteristics for building every cloud-native application? Possible answers:
A. Resiliency, Operability, Observability, Availability
B. Resiliency, Containerd, Observability, Agility
C. Kubernetes, Operability, Observability, Availability
D. Resiliency, Agility, Operability, Observability

Poprawne D





# TODO

### TODO - Dodać kubectl cheat sheet, często pojawiają się o niego pytania

### TODO - niech GPT wyjasni pytanie
Question: Let's assume that an organization needs to process large amounts of data in bursts, on a cloud-based Kubernetes cluster. For instance: each Monday morning, they need to run a batch of 1000 compute jobs of 1 hour each, and these jobs must be completed by Monday night. What's going to be the most cost-effective method? Possible answers:
A. Run a group of nodes with the exact required size to complete the batch on time, and use a combination of taints, tolerations, and nodeSelectors to reserve these nodes to the batch jobs.
B. Leverage the Kubernetes Cluster Autoscaler to automatically start and stop nodes as they're needed.
C. Commit to a specific level of spending to get discounted prices (with e.g. “reserved instances” or similar mechanisms).
D. Use PriorityСlasses so that the weekly batch job gets priority over other workloads running on the cluster, and can be completed on time.


Poprawne B

### TODO 








Which mechanism in Kubernetes allows you to select information for fields such as name, namespace or status of a Kubernetes object?
- Resource Selectors
- Field Selectors
- Label Selectors
- MetaData Selectors
Poprawne: 
- Field Selectors

Field selectors let you select Kubernetes resources based on the value of one or more resource fields.

https://kubernetes.io/docs/concepts/overview/working-with-objects/field-selectors/

Which component in Kubernetes watches the state of your cluster and will make or request changes when needed?
- API Server
- Controller
- Scheduler
- Watcher
Poprawne:
- Controller

In Kubernetes, controllers are control loops that watch the state of your cluster, then make or request changes where needed. Each controller tries to move the current cluster state closer to the desired state.

https://kubernetes.io/docs/concepts/architecture/controller/#:~:text=In%20Kubernetes%2C%20controllers%20are%20control,closer%20to%20the%20desired%20state.



What are EndpointSlices?
- a lightweight load balancer that cannot resolve a DNS hostname but only operates with IP addresses
- a simple way to track network endpoints within a Kubernetes cluster
- a simple way to split your network traffic across multiple pods
- a simple way to apply HTTP filtering upon incoming requests to route to specific application workloads

Poprawne: 
- a simple way to track network endpoints within a Kubernetes cluster

EndpointSlices provide a simple way to track network endpoints within a Kubernetes cluster. They offer a more scalable and extensible alternative to Endpoints.

https://kubernetes.io/docs/concepts/services-networking/endpoint-slices/

What is a fast serverless framework for Kubernetes with a focus on developer productivity and high performance?
- Knative
- Fission
- Supabase
- Rook
	
Poprawne: 
- Fission
Serverless Functions as a Service for Kubernetes.
https://github.com/fission/fission

Niepoprawne: 
- Knative
It's serverless, but it's not a framework.
Its a Kubernetes-based platform for serverless workloads.

When managing the scale of a group of replicas using the HorizontalPodAutoscaler, it is possible that the number of replicas keeps fluctuating frequently due to the dynamic nature of the metrics evaluated. This is sometimes referred to as ________
- thrashing
- drifting
- slipping
- crashing
- flipping
Poprawne:
- thrashing

When managing the scale of a group of replicas using the HorizontalPodAutoscaler, it is possible that the number of replicas keep fluctuating frequently due to the dynamic nature of the metrics evaluated. This is sometimes referred to as thrashing, or flapping. It's similar to the concept of hysteresis in cybernetics.

https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#flapping

Which mechanism in Kubernetes cleans up related resources before deleting an object?
- Owners
- Garbage Collection
- Tags
- Labels
- Selectors
Poprawne:
- Garbage Collection

In Kubernetes, garbage collection is the correct mechanism responsible for cleaning up resources. When a resource (like a ReplicaSet or Pod) has an owner reference, Kubernetes' garbage collector automatically deletes those resources when the owner object (such as a Deployment) is deleted. This prevents orphaned resources from lingering and consuming resources. Garbage Collection is the correct answer because it specifically refers to the process that cleans up dependent resources once their parent object is deleted.

What are the six layers of the CNCF landscape?
(Choose 6)
- Provisioning
- Networking
- App Definition and Development
- Observability and Analysis
- Runtime
- Orchestration & Management
- Platform
- Storage

Poprawne: 
- Orchestration & Management
- Provisioning
- Observability and Analysis
- Runtime
- App Definition and Development
- Platform

All six are listed on the landscape page. https://landscape.cncf.io/

https://landscape.cncf.io/guide

What are two ways to attach metadata to Kubernetes Objects?
(Choose 2)
- Annotations
- UserData
- MetaData
- Labels
- Tags
Poprawne: 
- Labels
- Annotations
	
You can use either labels or annotations to attach metadata to Kubernetes objects

https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/



What provides a "record of intent" for the Kubernetes API?
- Kubernetes controllers
- Kubernetes objects
- Kubernetes components
- Kubernetes intentors
Poprawne: 
- Kubernetes objects


    A Kubernetes object is a "record of intent"--once you create the object, the Kubernetes system will constantly work to ensure that object exists. By creating an object, you're effectively telling the Kubernetes system what you want your cluster's workload to look like; this is your cluster's desired state.

https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/


Which lightweight Kubernetes distribution is built for IoT and Edge Computing?
- Kind
- K3s
- Minikube
- K3d


__________ refers to making sure that Pods are matched to Nodes so that the kubelet can run them
- Eviction
- Scheduling
- Preemption
- Matching
Poprawne: 
- Scheduling
Scheduling refers to making sure that Pods are matched to Nodes so that the kubelet can run them. 


Which CNCF project for continuous integration and continuous delivery (CI/CD) comes with both a CLI and Web UI?
- Harness
- Argo
- Flux
- Jenkins X
Poprawne: 
- Argo


Argo comes with a powerful UI that helps visualize relations between different objects and monitor them better while with Flux you rely completely on CLI. You can add on the web UI to Flux but it still stays experimental.


A Site Reliability Engineer has the following responsibilities:
(Choose 4)
- Maintain application availability, reliability, and performance from the product user's perspective
- Use open source technology and frameworks to package and deploy applications into clusters.
- Provide developers access to relevant logs, events, and performance metrics necessary to troubleshoot and quickly resolve problems.
- Create runbooks to automate responses to incidents, and apply critical updates to production environments without impacting users.
- Respond to and recover from various outages in underlying IaaS or CaaS services and prevent security breaches
- Manage logging, keys, and other Kubernetes configurations.

Poprawne: 
- Maintain application availability, reliability, and performance from the product user's perspective
- Respond to and recover from various outages in underlying IaaS or CaaS services and prevent security breaches
- Provide developers access to relevant logs, events, and performance metrics necessary to troubleshoot and quickly resolve problems.
- Create runbooks to automate responses to incidents, and apply critical updates to production environments without impacting users.


What is the successor to PodSecurityPolicies?
- Admission Controller
- Kubernetes IAM
- Policies Controller
- Kubernetes RBAC
- Kubernetes ABAC
Poprawne:
- Admission Controller

Kubernetes offers a built-in Pod Security admission controller, the successor to PodSecurityPolicies. Pod security restrictions are applied at the namespace level when pods are created.

https://kubernetes.io/docs/concepts/security/pod-security-admission/

Which property in your manifest file affects when the kubelet will attempt to pull (download) the specified image?
- imageSrc
- imagePullPolicy
- imageUpdatePolicy
- image
Poprawne: 
- imagePullPolicy

	

The imagePullPolicy for a container and the tag of the image will affect the kubelet attempt to pull (download) the specified image.

Values you can set:

    IfNotPresent -  the image is pulled only if it is not already present locally

    Always - every time the kubelet launches a container

    Never - the kubelet does not try fetching the image

https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy

Which Kubernetes component is primarily responsible for managing the desired number of stateless pods to ensure their stability and availability?
- Deployment
- ReplicaSet
- StatefulSet
- Jobs
Poprawne: 
- Deployment

The Kubernetes component primarily responsible for managing stateless pods is the Deployment controller. It:
- Maintains the desired number of pod replicas
- Ensures high availability by automatically replacing failed pods
- Facilitates rolling updates and rollbacks
- Uses ReplicaSets to manage pod lifecycles

Deployments are ideal for stateless applications, offering stability and availability through automated scaling and self-healing capabilities.

Deployments are the recommended way to manage stateless applications in Kubernetes6. They use ReplicaSets under the hood to manage pod replicas.

ReplicaSets are designed for managing stateless applications in Kubernetes, not stateful ones.  

Stronka mówi, że poprawne jest ReplicaSet, AI że Deployment, oba są stateless, Deployment służy do zarządzania replicaset


What best describes the purpose of the Container Networking Interface?
- a load balancer and virtual firewall layer plugin for Kubernetes API Server
- a specification and libraries for writing plugins to configure network interfaces in Linux containers
- a multi-purpose container library that is commonly used to implement a Service Mesh
- a layered abstraction also known as a middleware to intercept networking traffic for network monitoring. 
Poprawne:
- a specification and libraries for writing plugins to configure network interfaces in Linux containers

CNI (Container Network Interface), a Cloud Native Computing Foundation project, consists of a specification and libraries for writing plugins to configure network interfaces in Linux containers, along with a number of supported plugins. CNI concerns itself only with network connectivity of containers and removing allocated resources when the container is deleted. Because of this focus, CNI has a wide range of support and the specification is simple to implement.

https://github.com/containernetworking/cni

Cluster Autoscaler scales to _____ nodes with 30 pods per node
- 1,000
- 1024
- 512
- 10,000
- 100
- 1024
Poprawne: 
- 1000


    As part of Cluster Autoscaler graduation to GA we want to guarantee a certain level of scalability limits that Cluster Autoscaler supports. We declare that Cluster Autoscaler scales to 1000 nodes with 30 pods per node. This document further defines what it means that CA scales to 1000 nodes, describes test scenarios and test setup used to measure scalability of CA and outlines its performance measured at this scale.

https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/proposals/scalability_tests.md#ca-scales-to-1000-nodes

    Avoid using the Cluster Autoscaler with more than 1000 Node Clusters.

https://www.replex.io/blog/kubernetes-in-production-best-practices-for-cluster-autoscaler-hpa-and-vpa


How can you show the logs of a previously terminated container named ruby in the web-1 pod?
- a. kubectl logs web-1 ruby
- b. kubectl logs -p web-1 ruby
- c. kubectl web-1 ruby -p
- d. kubectl logs -p -c ruby web-1
Correct Answer D


Which Prometheus metric type should be used for a value that only increases (e.g., an error_count)?
- a. Histogram
- b. Gauge
- c. Counter
- d. Summary
Correct Answer C Counter

What does CI/CD stand for?
- a. Continuous Installation/Continuous Downtime
- b. Continuous Integration/Continuous Delivery
- c. Container Interface/Container Deployment
- d. Continuous Infrastructure/Continuous Deployment
poprawne b. Continuous Integration/Continuous Delivery

Flux is built with the ____________.
a. Ci/CD Toolkit
b. Cluster Toolkit
c. GitOps Toolkit
d. Infrastructure Toolkit
Correct Answer GitOps Toolkit

Flux and ArgoCD are popular GitOps tools. They use a push-based approach. True or False?
- a. True
- b. False
Poprawne B.  False

Skończyłem na Chapter 6


Which lightweight Kubernetes distribution is built for IoT and Edge Computing?
- K3s
- Kind
- K3d
- Minikube
	
Poprawne: 
- K3s

