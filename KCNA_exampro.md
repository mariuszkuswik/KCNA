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

Poprawne: A


Kubernetes utilizes a "hub-and-spoke" API pattern. Which Kubernetes component is responsible as the hub for communication?
- API Server
- Kuberenetes Hub
- Kubectl
- Control Plane
- Kubelet

Poprawne: API Server
Kubernetes has a "hub-and-spoke" API pattern. All API usage from nodes (or the pods they run) terminates at the apiserver.
https://kubernetes.io/docs/concepts/architecture/control-plane-node-communication/




Question: Which statement about Ingress is correct? Possible answers:
A. Ingress provides a simple way to track network endpoints within a cluster.
B. Ingress is a Service type like NodePort and ClusterIP.
C. Ingress is a construct that allows you to specify how a Pod is allowed to communicate.
D. Ingress exposes routes from outside the cluster to services in the cluster.

Poprawne D


This is correct because:
Ingress is defined as an API object that manages external access to services within a Kubernetes cluster.
It acts as a single entry point for incoming traffic, routing it to the appropriate services based on the routing rules set by the developer.
Ingress provides routing rules to manage access to the services within a Kubernetes cluster, typically using HTTP and HTTPS protocols.
It allows you to expose multiple services under the same IP address, providing features like SSL termination, load balancing, and name-based virtual hosting.
The other options are incorrect:
A. This is not the primary function of Ingress.
B. Ingress is not a Service type, but rather a separate API object26.
C. This description is more applicable to NetworkPolicies, not Ingress.


What vendor-agnostic CNCF project provides a set of tools, APIs, and SDKs to create and manage logs, metrics, and traces?
- Grafana
- OpenTelemetry
- Prometheus
- DataDog
Poprawne: OpenTelemetry
OpenTelemetry is a collection of tools, APIs, and SDKs. It is used to instrument, generate, collect, and export telemetry data (metrics, logs, and traces) to help you analyze your software’s performance and behavior.


Which kubectl command can be used to list all available API groups?
- kubectl api-resources
- kubectl api-versions
- kubectl api-groups
- There is no such kubectl command
	

Poprawne:
- kubectl api-versions

it is specifically designed to list all the API versions that are available on the server, which include the groups and versions in the format <group>/<version>. This command helps users understand the different API versions and groups that their Kubernetes cluster supports, enabling them to use the appropriate API version for their resources and operations.

To list the available API groups and their versions you can run kubectl with the “api-versions” option:

```shell
kubectl api-versions |more
admissionregistration.k8s.io/v1beta1
apiextensions.k8s.io/v1beta1
apiregistration.k8s.io/v1
apiregistration.k8s.io/v1beta1
...
```


What are two ways to package, deploy, and manage a Kubernetes application?
(Choose 2)
- Terraform
- Helm Charts
- Kubernetes operators
- Kubectl
Poprawne:
- Helm Charts
- Kubernetes operators

Kubernetes operators and Helm charts are tools that stir up confusion in the industry -- they seem to fill the same role, but they do slightly different things.

https://searchitoperations.techtarget.com/tip/When-to-use-Kubernetes-operators-vs-Helm-charts




Which CNCF project is a Distributed Tracing Platform?
- DataDog
- Jaeger
- Zipkin
- Prometheus
Poprawne: 
	
Jaeger, inspired by Dapper and OpenZipkin, is a distributed tracing platform created by Uber Technologies and donated to Cloud Native Computing Foundation. It can be used for monitoring microservices-based distributed systems:

https://github.com/jaegertracing/jaeger


### TODO 




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


### TODO - Dodać kubectl cheat sheet, często pojawiają się o niego pytania

### TODO - niech GPT wyjasni pytanie
Question: Let's assume that an organization needs to process large amounts of data in bursts, on a cloud-based Kubernetes cluster. For instance: each Monday morning, they need to run a batch of 1000 compute jobs of 1 hour each, and these jobs must be completed by Monday night. What's going to be the most cost-effective method? Possible answers:
A. Run a group of nodes with the exact required size to complete the batch on time, and use a combination of taints, tolerations, and nodeSelectors to reserve these nodes to the batch jobs.
B. Leverage the Kubernetes Cluster Autoscaler to automatically start and stop nodes as they're needed.
C. Commit to a specific level of spending to get discounted prices (with e.g. “reserved instances” or similar mechanisms).
D. Use PriorityСlasses so that the weekly batch job gets priority over other workloads running on the cluster, and can be completed on time.


Poprawne B


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

- IfNotPresent -  the image is pulled only if it is not already present locally
- Always - every time the kubelet launches a container
- Never - the kubelet does not try fetching the image

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