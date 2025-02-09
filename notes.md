
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



## IAM w Kubernetesie i RBAC
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


# Containers
### Docker

### containerd

### cri-o

### kata

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






    Shuffle
    Toggle On
    Alphabetize
    Toggle Off
    Front First
    Toggle On
    Read
    Toggle Off

    Right
    0%0
    Wrong -1

    Wrong
    100%1

Question:
Front

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