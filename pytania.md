# Chapter 2 - Cloud Native Architecture
## Question 2.1
Cloud native applications are ___________? 

    a. Small, decoupled services
    b. Easy to maintain
    c. Self-healing
    d. All of the above
d. All of the above

## Question 2.2
What are some characteristics of cloud native architecture?

    a. High costs and maintenance
    b. High automation and scalability
    c. High security risk and complexity
    d. All of the above
b. High automation and scalability

## Question 2.3
The Open Container Initiative provides container standards for __________.

    a. Runtime, image, build
    b. Runtime, image, distribution
    c. Image, build, distribution
    d. Docker, build, image
b. Runtime, image, distribution

## Question 2.4
What is the most common pattern for autoscaling in cloud environments?

    a. Vertical Scaling
    b. Diagonal Scaling
    c. Horizontal Scaling
    d. Parallel Scaling
c. Horizontal Scaling

## Question 2.5
Serverless computing does not require _______:

    a. Servers
    b. Provisioning and operating infrastructure
    c. Application Code
    d. Network
b. Provisioning and operating infrastructure

## Question 2.6
The twelve-factor app is a guideline to _______:

    a. Develop cloud native applications
    b. Build containers
    c. Deploy on Kubernetes
    d. All of the above
a. Develop cloud native applications

## Question 2.7
Which of the following is not a standard used for container orchestration?

    a. Container Network Interface (CNI)
    b. Container Deployment Interface (CDI)
    c. Container Runtime Interface (CRI)
    d. Container Storage Interface (CSI)
b. Container Deployment Interface (CDI)

## Question 2.8
Which of the following is not a key metric for Site Reliability Engineers?

    a. Service level agreement (SLA)
    b. Service level indicator (SLI)
    c. Service level objective (SLO)
    d. Service level requirement (SLR)
d. Service level requirement (SLR)

# Chapter 3 - Container Orchestration
## Question 3.1
Containers can help with __________. Select all correct answers.
    a. Dependency management of applications
    b. More efficient use of hardware resources
    c. Writing secure application code
    d. All of the above
a. Dependency management of applications
b. More efficient use of hardware resources

## Question 3.2
The usage of containers and virtual machines are mutually exclusive. True or False?
    a. True
    b. False
b. False

## Question 3.3
Container isolation is achieved by _________.
    a. Namespaces and cgroups
    b. Container Network Interface
    c. Security Groups and Firewall
    d. Service Mesh
a. Namespaces and cgroups

## Question 3.4
A Dockerfile contains instructions on how to _________.
    a. Install Docker
    b. Start multiple containers
    c. Install Kubernetes
    d. Build a container image
d. Build a container image

## Question 3.5
Which command can be used to build a container image with Docker?
    a. docker build
    b. docker create
    c. docker image
    d. docker start
a. docker build

## Question 3.6
Where can you upload container images?
    a. Podman
    b. Registry
    c. Kubernetes
    d. etcd
b. Registry

## Question 3.7
Containers started on the same host share the host system's kernel. True or False?
    a. True
    b. False
a. True

## Question 3.8
Sort the 4C's of cloud native security, starting from the inside.
    a. Code, container, cloud, cluster
    b. Cluster, container, cloud, code
    c. Code, container, cluster, cloud
    d. Container, cluster, cloud, code
c. Code, container, cluster, cloud

## Question 3.9
Which problems can be solved with a container orchestration system?
    a. Scheduling containers
    b. Managing resources like CPU and memroy
    c. Providing a container network
    d. All of the above
d. All of the above

## Question 3.10
What do you call the automatic process of discovering services on a network?
    a. Service Mesh
    b. Service Registry
    c. Service Discovery
    d. Service IP
c. Service Discovery

## Question 3.11
What are the main parts of a Service Mesh?
    a. Controller-Manager and DNS
    b. Data Plane and Control Plane
    c. Virus and Malware scanner
    d. Dockerfile and Network
b. Data Plane and Control Plane

# Chapter 4 - Kubernetes fundamentals
## Question 4.1
Kubernetes was originally designed and developed by _________.
- a. Google
- b. Facebook
- c. Amazon
- d. The Boring Company
**Correct Answer:** a. Google

## Question 4.2
What are the two types of Kubernetes nodes? Select all answers that apply.
- a. Control Plane Node
- b. Data Node
- c. Security Node
- d. Worker Node
**Correct Answer:** a. Control Plane Node, d. Worker Node

## Question 4.3
The Kubernetes agent running on each worker node is called _______.
- a. systemd
- b. kubelet
- c. containerd
- d. docker
**Correct Answer:** b. kubelet

## Question 4.4
What tool can be used to set up a Kubernetes cluster?
- a. Minikube
- b. Kubeadm
- c. Rancher
- d. All of the above
**Correct Answer:** d. All of the above

## Question 4.5
Sort the three stages a request needs to go through in the api-server.
- a. Admission Control, Authorization, Authentication
- b. Authentication, Admission Control, Authorization
- c. Authentication, Authorization, Admission Control
- d. Authorization, Authentication, Admission Control
**Correct Answer:** c. Authentication, Authorization, Admission Control

## Question 4.6
Which container runtime is marked as deprecated by Kubernetes?
- a. CRI-O
- b. containerd
- c. Docker
- d. gvisor
**Correct Answer:** c. Docker

## Question 4.7
Which of the following is NOT a requirement in Kubernetes networking?
- a. All pods can communicate with each other across nodes
- b. All nodes can communicate with all pods
- c. All pods communicate encrypted
- d. No Network Address Translation (NAT)
**Correct Answer:** c. All pods communicate encrypted

## Question 4.8
Which Kubernetes component is responsible for scheduling?
- a. kube-apiserver
- b. kube-scheduler
- c. kube-controller-manager
- d. kube-proxy
**Correct Answer:** b. kube-scheduler


## Question 5.1
Kubernetes objects can be described in a data-serialization language called _____________.

    a. HTML
    b. PHP
    c. YAML
    d. Python

**Correct Answer:** c. YAML


## Question 5.2
Which of the following is not a required field in a Kubernetes object?

    a. kind
    b. spec
    c. containers
    d. metadata

**Correct Answer:** c. containers


## Question 5.3
What is the name of the official Kubernetes command line interface?

    a. containerctl
    b. kubectl
    c. kube-tool
    d. podctl

**Correct Answer:** b. kubectl


## Question 5.4
What is the smallest deployable compute unit of Kubernetes?

    a. Container
    b. Deployment
    c. Pod
    d. ReplicaSet

**Correct Answer:** c. Pod


## Question 5.5
How do you configure a container to run in a pod before your main container(s)?

    a. bootstrapContainer
    b. initContainer
    c. priorityContainer
    d. startContainer

**Correct Answer:** b. initContainer


## Question 5.6
Which workload object does not exist in Kubernetes?

    a. ReplicaSet
    b. Deployment
    c. ApplicationSet
    d. StatefulSet

**Correct Answer:** c. ApplicationSet


## Question 5.7
Which service types exist in Kubernetes?

    a. NodePort
    b. ClusterIP
    c. LoadBalancer
    d. ExternalName
    e. All of the above

**Correct Answer:** e. All of the above


## Question 5.8
Ingress objects can be used to configure HTTP(S) routing rules. True or False?

    a. True
    b. False

**Correct Answer:** a. True


## Question 5.9
Which Kubernetes object can be used to request storage?

    a. Container Storage Interface
    b. PersistentVolume
    c. PersistentVolumeClaim
    d. StorageClass

**Correct Answer:** c. PersistentVolumeClaim


## Question 5.10
What is the main difference between ConfigMaps and Secrets?

    a. Base64 encoding
    b. Pretty formatting
    c. Encryption
    d. Syntax Highlighting

**Correct Answer:** a. Base64 encoding


## Question 5.11
Which autoscalers are available in Kubernetes?

    a. Horizontal Pod Autoscaler
    b. Cluster Autoscaler
    c. Vertical Pod Autoscaler
    d. All of the above

**Correct Answer:** d. All of the above

