# Chapter 2 - Cloud Native Architecture
## Skalowanie
- vertical scaling - dodawanie ramu, CPU...
- horizontal scaling - nowe instancji aplikacji, np. nowe VM itd. 


## Serverless
- **Serverless** - dostarczamy kod aplikacji, provider robi resztę
Function as a Service (FaaS). The cloud provider abstracts the underlying infrastructure, so that developers can deploy software by uploading their code for example as .zip files or providing a container image.

In contrast to other cloud computing models, serverless computing has an even stronger focus on the on-demand provisioning and scaling of applications.  Autoscaling is an important core concept of serverless and can include scaling and provisioning based on events like incoming requests. This allows for even more precise **billing, which can be based on the events mentioned instead of the widespread time-based billing.**

Instead of fully replacing container orchestration platforms or more traditional virtual machines, FaaS systems are often used in combination or as an extension of existing platforms since they allow for a very fast deployment and make for excellent testing and sandbox environments.

While container images are a great standardized way of packing software for FaaS or serverless systems, systems like **Knative** that are built on top of Kubernetes allow to extend existing platforms with serverless computing abilities. This can be a viable solution for serverless operation in private clouds and on-premises environments. Keep in mind that this can ease the work of a developer, but raise the complexity in operating a cloud platform.

Although there are many advantages to serverless technology, it initially struggled with standardization. Many cloud providers have proprietary offerings that make it difficult to switch between different platforms. To address these problems, the **CloudEvents** project was founded and provides a specification of how event data should be structured. Events are the basis for scaling serverless workloads or triggering corresponding functions. The more vendors and tools adopt such a standard, the easier it becomes to use serverless and event-driven architectures on multiple platforms.

**CloudEvents** is a specification for describing event data in a common way. CloudEvents seeks to dramatically simplify event declaration and delivery across services, platforms, and beyond!

## Open standards
While Docker is often used synonymously with container technologies, the community has committed to the open industry standard of the Open Container Initiative (OCI).

Under the umbrella of the Linux Foundation, the Open Container Initiative provides two standards which define the way how to build and run containers. The image-spec defines how to build and package container images. While the runtime-spec specifies the configuration, execution environment and lifecycle of containers. A more recent addition to the OCI project is the Distribution-Spec, which provides a standard for the distribution of content in general and container images in particular. 

Open standards like this help and complement other systems like Kubernetes, which is the de facto standard platform for orchestrating containers. A few standards that will discover in the following chapters are:
- OCI Spec: image, runtime and distribution specification on how to run, build an distribute containers
- Container Network Interface (CNI): A specification on how to implement networking for Containers.
- Container Runtime Interface (CRI): A specification on how to implement container runtimes in container orchestration systems.
- Container Storage Interface (CSI): A specification on how to implement storage in container orchestration systems.
- Service Mesh Interface (SMI): A specification on how to implement Service Meshes in container orchestration systems with a focus on Kubernetes.

Following this approach, other systems like Prometheus or OpenTelemetry evolved and thrived in this ecosystem and provide additional standards for monitoring and observability.

## Role - stanowiska pracy? 
- DevOps Engineer - Often described as a simple combination of developer and administrator, but that doesn't do the role justice. DevOps engineers use tools and processes that balance out software development and operations. Starting with approaches to writing, building, and testing software throughout the deployment lifecycle.

- Site Reliability Engineer (SRE) - A role with a stronger definition is the Site Reliability Engineer (SRE). SRE was founded around 2003 at Google and became an important job for many organizations. The overarching goal of SRE is to create and maintain software that is reliable and scalable. To achieve this, software engineering approaches are used to solve operational problems and automate operation tasks.

    To measure performance and reliability, SREs use three main metrics:
    - Service Level Objectives (SLO): “Specify a target level for the reliability of your service.” - A goal that is set, for example reaching a service latency of less that 100ms.
    - Service Level Indicators (SLI): “A carefully defined quantitative measure of some aspect of the level of service that is provided” - For example how long a request actually needs to be answered.
    - Service Level Agreements (SLA): “An explicit or implicit contract with your users that includes consequences of meeting (or missing) the SLOs they contain. The consequences are most easily recognized when they are financial – a rebate or a penalty – but they can take other forms.” - Answers the question what happens if SLOs are not met.

    Around these metrics, SREs might define an error budget. An error budget defines the amount (or time) of errors your application can have, before actions are taken, like stopping deployments to production.

# Container Orchestration
## Container Basics
Contrary to popular belief, container technologies are much older than one would expect. One of the earliest ancestors of modern container technologies is the chroot command that was introduced in Version 7 Unix in 1979. The chroot command could be used to isolate a process from the root filesystem and basically "hide" the files from the process and simulate a new root directory. The isolated environment is a so-called chroot jail, where the files can’t be accessed by the process, but are still present on the system.

![chroot](./pictures/chroot_structure.png)


**While chroot is a pretty old technology, it is still in use today by some popular software projects. Container technologies that we have today still embody this very concept, but in a modernized version and with a lot of features on top.**

To isolate a process even more than chroot can do, current Linux kernels provide features like namespaces and cgroups.

Namespaces are used to isolate various resources, for example the network. A network namespace can be used to provide a complete abstraction of network interfaces and routing tables. This allows a process to have its own IP address. The Linux Kernel 5.6 currently provides 8 namespaces:

- pid - process ID provides a process with its own set of process IDs.
- net - network allows the processes to have their own network stack, including the IP address.
- mnt - mount abstracts the filesystem view and manages mount points.
- ipc - inter-process communication provides separation of named shared memory segments.
- user - provides process with their own set of user IDs and group IDs.
- uts - Unix time sharing allows processes to have their own hostname and domain name.
- cgroup - a newer namespace that allows a process to have its own set of cgroup root directories.
- time - the newest namespace can be used to virtualize the clock of the system. 

cgroups are used to organize processes in hierarchical groups and assign them resources like memory and CPU. When you want to limit your application container to let’s say 4GB of memory, cgroups are used under the hood to ensure these limits.


At a first glance, containers seem to be very similar to virtual machines, but it’s crucial to understand that they are very different. While virtual machines emulate a complete machine, including the operating system and a kernel, containers share the kernel of the host machine and, as explained, are only isolated processes.

Virtual machines come with some overhead, be it boot time, size or resource usage to run the operating system. Containers on the other hand are literally processes, like the browser you can start on your machine, therefore they start a lot faster and have a smaller footprint.

![Traditional Deployment vs Virtualized Deployment vs Container Deployment](./pictures/Traditional_Deployment_vs_Virtualized_Deployment_vs_Container%20Deployment.png)
**Traditional Deployment vs Virtualized Deployment vs Container Deployment**

In many cases it is not a question of whether you are using containers or virtual machines, rather you are using both technologies to benefit from the efficiency that containers have but still use the security advantages that the greater isolation of virtual machines bring to the table.


# Building Container Images
![container_images](./pictures/container_images.png)
**Container Images** 


Images can be built by reading the instructions from a buildfile called Dockerfile. The instructions are almost the same as one would use to install an application on a server. Here is an example of a Dockerfile that containerizes a Python script:

```
# Every container image starts with a base image.
# This could be your favorite linux distribution
FROM ubuntu:20.04 

# Run commands to add software and libraries to your image
# Here we install python3 and the pip package manager
RUN apt-get update && \
    apt-get -y install python3 python3-pip 

# The copy command can be used to copy your code to the image
# Here we copy a script called "my-app.py" to the containers filesystem
COPY my-app.py /app/ 

# Defines the workdir in which the application runs
# From this point on everything will be executed in /app
WORKDIR /app

# The process that should be started when the container runs
# In this case we start our python app "my-app.py"
CMD ["python3","my-app.py"]
```

If you have installed Docker on your machine, you can build the image with the following command:

```
docker build -t my-python-image -f Dockerfile
```
With the parameters -t my-python-image you can specify a name tag for your image, and with -f Dockerfile you specify where your Dockerfile can be found. This gives developers the ability to manage all the dependencies of their application and packaging it ready to run instead of leaving that task to another person or team.

To distribute these images, you can use a container registry. This is nothing more than a web server where you can upload and download images. Conveniently, Docker has the push and pull commands built-in:

```
docker push my-registry.com/my-python-image
docker pull my-registry.com/my-python-image
```

# Container Orchestration
## Security
One of the greatest security risks, not only in the container area, is the execution of processes with too many privileges, especially starting processes as root or administrator. Unfortunately, this is a problem that got ignored a lot in the past and there are a lot of containers out there that run as root users. 

A fairly new attack surface that was introduced with containers is the use of public images. Two of the most popular public image registries are Docker Hub and Quay and while it’s great that they provide publicly accessible images, you have to make sure that these images were not modified to include malicious software. 

![Docker security layers](./pictures/Docker_security.png)


## Container Orchestration Fundamentals
Container orchestration systems provide a way to build a cluster of multiple servers and host the containers on top. Most container orchestration systems consist of two parts: a *control plane* that is responsible for the management of the containers and *worker nodes* that actually host the containers.

## Networking
Network namespaces allow each container to have its own unique IP address, therefore multiple applications can open the same network port; for example, you could have multiple containerized web servers that all open port 8080.

To make the application accessible from outside the host system, containers have the ability to map a port from the container to a port from the host system. 

Most overlay networks also take care of IP address management, which would be a lot of work if implemented manually. In this case, the overlay network manages which container gets which IP address and how the traffic has to flow to access the individual containers.

Most modern implementations of container networking are based on the [Container Network Interface (CNI)](https://github.com/containernetworking/cni). CNI is a standard that can be used to write or configure network plugins and makes it very easy to swap out different plugins in various container orchestration platforms.

![Container Network](./pictures/container_network.png)

## Service Discovery & DNS
For a long time, server management in traditional data centers was manageable. Many system administrators even remembered all of the IP addresses of important systems they had to work with. Large lists of servers, their host names, IP addresses, and purposes - all maintained manually - were daily business.

In container orchestration platforms things are a lot more complicated. 

The solution to the problem again is automation. Instead of having a manually maintained list of servers (or in this case containers), all the information is put in a *Service Registry*. Finding other services in the network and requesting information about them is called *Service Discovery*.

- DNS - Modern DNS servers that have a service API can be used to register new services as they are created. This approach is pretty straightforward, as most organizations already have DNS servers with the appropriate capabilities.
- Key-Value-Store - Using a strongly consistent datastore especially to store information about services. A lot of systems are able to operate highly available with strong failover mechanisms. Popular choices, especially for clustering, are [etcd](https://github.com/etcd-io/etcd), [Consul](https://www.consul.io/) or [Apache Zookeeper](https://zookeeper.apache.org/).

## Service Mesh
The software you can use to manage network traffic is called a proxy. This is a server application that sits between a client and server and can modify or filter network traffic before it reaches the server. Popular representatives are nginx, haproxy or envoy.

Taking this idea a step further, a service mesh adds a proxy server to every container that you have in your architecture.
![Istio architecrure](./pictures/Istio_architecture.png)

**Istio Architecture**, retrieved from [istio.io](https://istio.io/v1.10/docs/ops/deployment/architecture/)

You can now use the proxies to handle network communication between your services.

Let’s take encryption as an example. 

When a service mesh is used, applications don’t talk to each other directly, but the traffic is routed through the proxies instead. The most popular service meshes at the moment are istio and linkerd. While they have differences in implementation, the architecture is the same.

</br>
The proxies in a service mesh form the *data plane*. This is where networking rules are implemented and shape the traffic flow.

These rules are managed centrally in the *control plane* of the service mesh. This is where you define how traffic flows from service A to service B and what configuration should be applied to the proxies.
</br>

So instead of writing code and installing libraries, you just write a config file where you tell the service mesh that service A and service B should always communicate encrypted.

The config is then uploaded to the control plane and distributed to the data plane to enforce the new rule.

For a long time the term "service mesh" only described a basic idea of how traffic in container platforms could be handled with proxies. The Service Mesh Interface (SMI) project aims at defining a specification on how a service mesh from various providers can be implemented.

With a strong focus on Kubernetes, their goal is to standardize the end user experience for service meshes, as well as a standard for the providers that want to integrate with Kubernetes. You can find the current specification on [GitHub](https://github.com/servicemeshinterface/smi-spec).

## Storage

