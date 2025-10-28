---
title: "kubernetes"
layout: simple
aliases:
  - /technologies/kubernetes/index.md
  - /technologies/kubernetes
permalink: /technologies/kubernetes/index.md
description: "container orchestrator notes"
date: 2025-04-17
tags:
  - "container orchestrator"
  - "kubernetes cluster"
  - kubectl
  - kubeadm
series: ["Technologies notes"]
draft: false
series_order: 8
---

Kubernetes is a container orchestrator for managing high scale deployment challenges

## Architecture

The kubernetes cluster architecture presents itself as follows:

```mermaid
flowchart TD
subgraph control_plane
A[api-server]
B[scheduler]
C[control manager]
D[etcd]
end
subgraph worker_1
E[kublet]
subgraph container_runtime_1
F[pod]
G[pod]
H[pod]
end
end
subgraph worker_2
I[kublet]
subgraph container_runtime_2
J[pod]
K[pod]
L[pod]
end
end
subgraph worker_3
M[kublet]
subgraph container_runtime_3
N[pod]
O[pod]
P[pod]
end
end
control_plane --> worker_1 & worker_2 & worker_3
```

Where the **control plane** node manages the worker nodes that run pods, pods are managed trough a container runtime (*for example `containerd`*) that runs the containers, the control plane is  also responsible for managing deployments

## Networking in a kubernetes cluster

Containers and pods share a private network stack  that allow them to communicate inside the cluster, and a name service
## Deployment in a kubernetes cluster

Deployment on a kubernetes cluster is done trough the use of the api server using a descriptor that specifies:

- containers
- images
- replicas
- volumes
- configurations

> [!NOTE]
> pods are the minimum unit of deployment in kubernetes

# Installation using `kubeadm`

To install the control plane on a linux machine do the following (*package manager updates are locked*)

```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

This will install necessary components on a node to run the control plane, then initialize the cluster using the `kubeadm` command

```bash
# enable forwarding
sysctl net.ipv4.ip_forward=1 && echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
# install containerd
apt install containerd
# init kluster
kubeadm init
```

### Configuring worker nodes

In worker nodes after installing the `kubeadm` tool, init the kubelet process

```bash
systemctl enable --now kubelet
```

Then join the kluster using `kubeadm join` command
