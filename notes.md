
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

### Jaeger
- [Jaeger - docsy](https://www.jaegertracing.io/docs/2.2/)
- Jaeger, inspired by Dapper and OpenZipkin, is a distributed tracing platform created by Uber Technologies and donated to Cloud Native Computing Foundation. 
- It can be used for monitoring microservices-based distributed systems:
- With Jaeger you can: 
    - Monitor and troubleshoot distributed workflows
    - Identify performance bottlenecks
    - Track down root causes
    - Analyze service dependencies

