
# Gitops
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

### Datadog 
- [Datadog - stronka](https://www.datadoghq.com/)
- Paid monitoring system!

### Grafana
- [Grafana](https://grafana.com/grafana/)
- Grafana is a visualization tool.

# Kubernetes packaging?
## two ways to package, deploy, and manage a Kubernetes application?
- Kubernetes operators and Helm charts are tools that stir up confusion in the industry -- they seem to fill the same role, but they do slightly different things.
- [When to use Kubernetes operators vs. Helm charts](https://www.techtarget.com/searchitoperations/tip/When-to-use-Kubernetes-operators-vs-Helm-charts)

### Helm Charts  
- [HelmCharts](https://helm.sh/docs/topics/charts/)

### Kubernetes operators




# IAM 
### RBAC itd.