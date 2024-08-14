# Cluster Manager

The Swift Cluster Manager is a service that is used to communcate with the kubernetes clusters.

The system philosophy is to have an independent kubernetes cluster for each services, i.e:

* [Postgres Cluster](postgres)
* [MySQL Cluster](mysql)

This service provides a RESTful service to communicate with the right cluster depending on the service being referred to.