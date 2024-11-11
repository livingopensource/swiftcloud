# SwiftCloud Documentation

## Archtiecture

Using kubernetes as the control plane and API server to build a cloud platform.

[SwiftCloud Overview](docs/index.md)

## Platform Architecture

SwiftCloud is a cloud first approach design implementation to buildg the cloud.
The philosophy is built on the premise of using the tried and tested Kubernetes API as the core building block.

The use of kubernetes allows us to have a single platform to build, deploy and manage cloud services.
With all these services having baked in, high avalability, scalability and fault tolerance.

The platform is built around the following main service components

- Kubernetes API Server
- Service Cluster Manager
- Knative Eventing
- Message Broker (RabbitMQ)
- Billing


### Kubernetes API Server

The kubernetes API server is the core of the platform. It allows us to use cloud native design patterns to build the platform.
This in turn allows us to use the same tools and techniques to build the platform across different service teams.
Every component that makes up SwiftCloud is built as an Open Container Initiative (OCI) compliant container.