# SwiftCloud

SwiftCloud is a self-provisioning cloud infrastructure platform designed to accelerate development for both solo entrepreneurs and large enterprises. By offering a local, cost-effective, and compliant solution, we challenge the status quo of cloud computing dominated by global giants.

With SwiftCloud, developers and businesses gain unprecedented control over their cloud environments. Our platform is built to handle the demands of mission-critical workloads, empowering organizations to localize data and adhere to stringent regulations.

Whether you're a solo developer looking to rapidly iterate or an enterprise seeking to optimize costs and compliance, SwiftCloud provides the foundation for your digital transformation. We're not just building a cloud platform; we're creating an ecosystem that fosters innovation and drives business success.

## API Conventions

All SwiftCloud API's are RESTful and follow the conventions outlined in the [OpenAPI Specification](https://swagger.io/specification/).
As well as other conventions, such as:

All API endpoints are prefixed with a version number e.g `/v1.0` and a service name, e.g. `/v1.0/domains`.

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
| [Billing](billing.md) | /v1.0/billing | A service that provides API's for managing and creation of billing. |
| [Domain Registration & Management](domains.md) | /v1.0/domains | A service that provides API's for managing and creation of domains. |
| [Database As A Service](dbaas.md) | /v1.0/databases | A service that provides management and provisioning of databases. |
| [HA Virtual Machines](vm.md) | /v1.0/virtual-machines | A service that provides high availability virtual machines. |
| [Web Services](web.md) | /v1.0/web-services | A service that provides web services API. |