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