# SwiftCloud

SwiftCloud is a self-service cloud infrastructure platform designed to accelerate development, by offering a local, cost-effective, and compliant solution, built on top of open source technologies.

With SwiftCloud, developers and businesses gain unprecedented control over their cloud environments. Our platform is built to handle the demands of mission-critical workloads, empowering organizations to localize data and adhere to stringent regulations.

Our mission is to make bleeding edge technology accessible to every developer, creator, and innovator. We believe the "Cloud" is a phylosophy of providing ICT infrastructure and services via the internet.
SwiftCloud gets you from prototype to production in a weekend. All you need is an internet connection and some digital cash.

At the core of all SwiftCloud platform services, is simplicity. From an easy to use user interface (UI) to a platform that makes cloud native technologies as easy as writing a `Dockerfile`.

???+ tip "SwiftCloud"

    A trully developer first cloud platform.

## Architecural Design Phylosophy

SwiftCloud is build with scale, resilience, fault torelance and high availability in mind. To achieve all this, we follow the methodology of [12 factor apps](https://12factor.net) 

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