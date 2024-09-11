---
tags:
  - Architecure
  - Philosophy
---
# SwiftCloud

SwiftCloud is a self-service cloud infrastructure platform designed to accelerate development, by offering a local, cost-effective, and compliant solution, built on top of open source technologies.

With SwiftCloud, developers and businesses gain unprecedented control over their cloud environments. Our platform is built to handle the demands of mission-critical workloads, empowering organizations to localize data and adhere to stringent regulations.

Our mission is to make bleeding edge technology accessible to every developer, creator, and innovator. We believe the "Cloud" is a philosophy of providing ICT infrastructure and services via the internet.
SwiftCloud provides a platform for developers to build and deploy applications on a managed cloud that provides high availability, self healing capabilities and security out of the box.

At the core of all SwiftCloud platform services, is simplicity. From an easy to use user interface (UI) to a platform that makes cloud native technologies as easy as writing a `Hello World` app.

???+ tip "SwiftCloud"

    A trully developer first cloud platform.

## Architecural Design Philosophy

SwiftCloud is build with scale, resilience, fault torelance and high availability in mind. To achieve all this, we follow the methodology of [12 factor apps](https://12factor.net).

Building on this approach, SwiftCloud is built to be a platform that is easy to use, easy to manage and easy to scale.
For this reason we chose  to use Kubernetes as the underlying infrastructure for our platform. To get up and running a self hosted SwiftCloud cluster, below are the prerequisites:

*NOTE:* The ticked ones are mandatory, while the others are optional

### Prerequisites

- [x] __Kubernetes__: A kubernetes cluster running version v1.25 or higher.
- [x] __Knative Eventing__: A Knative Eventing running version v1.15 or higher.
- [x] __Ory Kratos__: A Ory Kratos instance running version v1.2.0 or higher.
- [x] __Ory Keto__: A Ory Keto instance running version v0.15.0 or higher.
- [ ] __Knative Serving__: A Knative Serving instance running version 1.15 or higher.
- [ ] __Cloud Native PostgreSQL__: CNPG version v1.24.0 or higher
- [ ] __KubeVirt__: A KubeVirt instance running version v1.2.0 or higher


## API Conventions

All SwiftCloud API's are RESTful and follow the conventions outlined in the [OpenAPI Specification](https://swagger.io/specification/).
As well as other conventions, such as:

All API endpoints are prefixed with a service name e.g `/domains` and a version number, e.g. `/v1`. to make a path of the form `/domains/v1`

### HTTP Methods


| Method | Description |
| --- | --- |
| GET | Used to retrieve a representation of a resource. |
| POST | Used to create new new resources and sub-resources |
| PUT | Used to update existing resources |
| PATCH | Used to update existing resources |
| DELETE | Used to delete existing resources |

### HTTP Response Codes

All API endpoints under the SwiftCloud platform return the following HTTP responses and the meaning of which should be taken as indicated below:

| HTTP Status Code | Meaning | Description |
| --- | --- | --- |
| 100 | Operation created |	The request is being processed in the background.
| 200 | OK	| The request was successful.
| 201 | Created | The request was successful and a resource was created.
| 202 | Accepted | The request was successful and the response is being processed asynchronously.
| 204 | No Content | The server successfully fulfilled the request and there is no additional content to send.
| 400 | Bad Request | You submitted an invalid request (missing parameters, etc.).
| 401 | Unauthorized | You failed to authenticate for this resource.
| 403 | Forbidden |	You are authenticated, but don't have permission to do this.
| 404 | Not Found |	The resource you're requesting does not exist.
| 405 | Method Not Allowed |	You tried to access a resource with an invalid method.
| 409 | Conflict |	The request could not be completed due to a conflict with the current state of the resource.
| 422 | Unprocessable Entity |	The client submitted malformed data
| 429 | Too Many Requests |	You've hit a rate limit.
| 500 | Internal Server Error |	Some went wrong on the server side.
| 503 | Unable to complete request |	The server is overloaded or down for maintenance.

## Platform Services

SwiftCloud is a platform that provides a range of services to help you manage your cloud infrastructure. These services include:

| Service | URL Path | Description |
| --- | --- | --- |
| [Serverless](Serverless) | /serverless/v1 | A service that provides serverless application capabilities
| [Domain Registration & Management](domains.md) | /domains/v1 | A service that provides API's for managing and creation of domains. |
| [Database As A Service](dbaas.md) | /databases/v1 | A service that provides management and provisioning of databases. |
| [HA Virtual Machines](vm.md) | /virtual-machines/v1 | A service that provides high availability virtual machines. |
| [Web Services](web.md) | /web-services/v1 | A service that provides web services API. |
| [Billing](billing.md) | /billing/v1 | A service that provides API's for managing and creation of billing. |