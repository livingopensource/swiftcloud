---
date: 2024-09-11
description: K3S Node Not Ready, and how to debug it
categories:
  - cloud
  - k8s
---

# K3S Node Not Ready

![Banner](https://media.licdn.com/dms/image/D4D12AQE_GzL-3_RoVw/article-cover_image-shrink_600_2000/0/1698599798051?e=2147483647&v=beta&t=l5l7HOKbp6_kR6jtiKshfzlFhb0xu26edhvITcKvu7U)

K3S is a lightweight production grade kubernetes platform.
Its light weight because a lot of unnecessary components have been removed; the unnecessary components include cloud providers, beta features, defaults and the deployment runs in a single binary.

<!-- more -->

Having a single binary makes the deployment a whole lot easier. And now back to the topic of discussion.

NotReady status can be caused by a lot of things, it might be that the node was initially connected to the cluster but is no longer able to communicate with the cluster or the underlying machine is not active. This can be fixed by either starting up the machine if it's off or making sure that the node is able to establish two communication with other nodes in the cluster. This in most cases will turn out to be the underlying host machines networking.

If upon checking on the machine, and it turns out that the machine is running and network connectivity is just fine. Check on the status of the node status using `kubectl`.

```bash
kubectl describe node <node-hostname>
```

The above command gives an very verbose out put of the state of the node. Among the things to look out for in this output are, memory pressure, disk pressure, PID pressure.

A pressure in any of the above can cause the kubelet to fail to run and hence, the node not being usable.

If you notice that the kubelet is not able to start due to memory pressure or CPU & memory limits going going beyond 100%. This is a sign of over-committing resources on your node. This happens when the sum of all Kubernetes resource limits is bigger than the capacity of that resource. When you are over-committing resources in your cluster, everything might run perfectly in normal conditions, but in high load scenarios, the containers could start consuming CPU and memory up to their limit. And in some instances make your node unavailable.

To make your node available with over-committed resources, you'll need to allow this in your kernel, by creating a file in `/etc/sysctl.d`, lets call this file `/etc/sysctl.d/50-kubelet.conf`. In that file, add the following:

```conf
kernel.panic=10
kernel.panic_on_oops=1
vm.overcommit_memory=1
```
To enble the changes just added, execute:

```bash
sysctl --system -p
``` 

After this, restart the k3s daemon if need be (K3S is set to auto-restart by default).

Another issue that might bring up such an issue is the the `invalidDiskCapacity 0`. This is just a warning that normally clears up after sometime, but during the time it shows up, the node wont be available. For further debugging check the github issue [#1857](https://github.com/k3s-io/k3s/issues/1857).

While the above will allow the node to be available with over-committed resources, this is not good practice. To solve this issue you might need to add compute resource limits in your service deployment files that are well within your nodes range.

An even better approach is to set the limits with role(s)/clusterRole(s) so pods cannot use more than allocated.