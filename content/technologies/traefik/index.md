---
title: "traefik"
aliases:
  - /technologies/traefik/index.md
  - /technologies/traefik
permalink: /technologies/traefik/index.md
description: "Notes application proxy for cloud based environments"
date: 2025-05-30
series: ["Technologies notes"]
draft: false
series_order: 18
---

Traefik is an open source application proxy to route traffic inside containers, it's based on 4 based principles

- `services` services to forward traffic to
- `providers` where traefik gets configuration for routing traffic (*eg docker*)
- `routes` dinamically generated rules
- `entrypoints` where traefik receives traffic to route (eg ports `80,443,UDP,TCP`)
- `middleware`  middleware to process traffic (*login ecc*)

## Configuration with docker provider

```yaml
services:
  traefik:
    image: traefik:v3.4
    # Enables the web UI and tells Traefik to listen to docker
    command: --api.insecure=true --providers.docker
    ports:
      # The HTTP port
      - "80:80"
      # The Web UI (enabled by --api.insecure=true)
      - "8080:8080"
    volumes:
      # So that Traefik can listen to the Docker events
      - /var/run/docker.sock:/var/run/docker.sock

  navidrome:
    container_name: navidrome
    image: deluan/navidrome:latest
    restart: unless-stopped
    environment:
      ND_SCANSCHEDULE: 1h
      ND_LOGLEVEL: info
      ND_SESSIONTIMEOUT: 24h
      ND_BASEURL: "/navidrome"
    labels:
	  # entrypoints for this app as http
      - traefik.http.routers.traefik.entrypoints=http
	  # rule for router, forward traffic that starts with /navidrome prefix
      - "traefik.http.routers.navidrome.rule=PathPrefix(`/navidrome`)"
	  # container port to forward traffic to
      - "traefik.http.services.navidrome.loadbalancer.server.port=4533"
	  services:
  # example using host in router rule
  portainer:
    container_name: portainer
    image: portainer/portainer-ce:latest
    restart: unless-stopped
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    labels:
      - traefik.http.routers.traefik.entrypoints=http
      - "traefik.http.routers.portainer.rule=Host(`portainer.docker.localhost`)"
      - "traefik.http.services.portainer.loadbalancer.server.port=9000"

```
>[!NOTE] files can be separated in multiple docker compose files

### labels

Possible labels for routers when using the docker provider can be found [here](https://doc.traefik.io/traefik/routing/routers/#rule)
