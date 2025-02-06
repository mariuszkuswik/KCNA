
# Gitops
- [What is GitOps by RedHat](https://www.redhat.com/en/topics/devops/what-is-gitops)
- [GitOps vs DevOps by RedHat](https://www.redhat.com/en/topics/devops/what-is-gitops#gitops-vs-devops)

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

# Kubernetes packaging?
## two ways to package, deploy, and manage a Kubernetes application?
- Kubernetes operators and Helm charts are tools that stir up confusion in the industry -- they seem to fill the same role, but they do slightly different things.
- [When to use Kubernetes operators vs. Helm charts](https://www.techtarget.com/searchitoperations/tip/When-to-use-Kubernetes-operators-vs-Helm-charts)

### Helm Charts  
- [HelmCharts](https://helm.sh/docs/topics/charts/)
- [When to use Kubernetes operators vs. Helm charts](https://www.techtarget.com/searchitoperations/tip/When-to-use-Kubernetes-operators-vs-Helm-charts)
- Helm is a packaging format that works well with simple applications like stateless microservices and REST-based APIs with states stored externally in the cloud.
  
Helm is a package manager designed specifically for Kubernetes and improves the management of the YAML manifests required to create Kubernetes projects. At the heart of Helm is the packaging format called charts. Each chart comprises one or more Kubernetes manifests -- and a given chart can have child charts and dependent charts, as well.
  
Thus, Helm can tackle the complexities of dependency management for a Kubernetes project. Rather than an IT admin simply listing the files to install via kubectl, a single command can install an entire application, and Helm will pull the required dependencies and apply the manifests.
  
Helm also retains a release history of all deployed charts, so IT teams can go back to a previous release if something goes wrong.

### Kubernetes operators
- [When to use Kubernetes operators vs. Helm charts](https://www.techtarget.com/searchitoperations/tip/When-to-use-Kubernetes-operators-vs-Helm-charts)
- However, as time progresses and developer teams unlock the full potential of the platform, the application becomes complex and grows in tandem with its additional requirements -- like statefulness -- and requires more complex logic. This complexity creates challenges for authoring those Helm charts-templatized YAML manifests; at this point, it is time to adopt the powerful operator pattern supported in Kubernetes.
   
Operators are geared toward site reliability engineering teams to manage the complex runbooks that orchestrate the deployment of a complex application, along with automating mundane tasks for the Kubernetes platform.
  
Kubernetes operators build on custom resources and controllers. In plain terms, an IT admin can define their resources in Kubernetes and publish logic -- via an operator -- that can handle CRUD operations for the custom resource. These custom resources can model a complex application or a standard templatized application; the operators maintain the resource's lifecycle.


## Deployment strategy 
### Blue/Green
This deployment strategy involves having two identical environments, one hosting the current version of the application (blue) and the other hosting the new version (green). Once the new version is ready and tested in the green environment, the traffic is switched from blue to green. While this method allows for quick rollbacks and minimal downtime, it doesn't inherently support rolling out features to a small subset of users first; instead, it switches all users from the old version to the new one at once.

### Recreate deployments
In this method, the existing version of the application is taken down, and the new version is rolled out. This approach involves downtime, as there is a period when the application is not available to users. Like blue/green deployments, it does not support gradual rollout to a subset of users. Instead, it replaces the old version with the new one for all users simultaneously.

### Canary
Canary deployments involve releasing the new version of an application to a small subset of the user base initially, rather than rolling it out to all users at once. This strategy allows developers and operations teams to monitor the performance and stability of the new release and ensure it behaves as expected under real-world conditions. If the new version proves to be stable and effective, it can then be gradually rolled out to the rest of the user base.

### Red/Black deployment
Similar to blue/green deployments, red/black deployments involve two identical production environments: one that is active (red) and one that is idle (black). Once the new version is ready, traffic is switched from the red environment to the black environment. This strategy is designed for fast rollbacks and zero downtime but, like blue/green deployments, does not target a small subset of users initially; it switches the entire user base to the new version at once.


# IAM 
### RBAC itd.

# Containers
### Docker

### containerd

### cri-o

### LXC
- [Linux Containers](https://linuxcontainers.org/)
LXC is a well-known Linux container runtime that consists of tools, templates, and library and language bindings. It's pretty low level, very flexible and covers just about every containment feature supported by the upstream kernel.



# A Kubernetes developer wants to prevent a job from living after a certain amount of time when it has finished execution. 

- [TTL-after-finished Controller](https://kubernetes.io/docs/concepts/workloads/controllers/ttlafterfinished/)
### Do opisania/sprawdzenia
- DaemonSets
- TerminateAfterMs property within Manifest File
- TTL property within Deployment file


# Kubernetes - architektura
- [Kubernetes components](https://kubernetes.io/docs/concepts/overview/components/)



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



What are two ways to attach metadata to Kubernetes Objects?
	

UserData - 
	 
	

Annotations
	
	

MetaData
	
	

Tags

	

Labels