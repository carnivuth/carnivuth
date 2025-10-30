---
title: 'Data Mesh'
date: '2025-10-29'
draft: true
description:
tags:
series: ["Technologies notes"]
series_order: 21
layout: simple
---

# Data mesh

A data mash is a practice born in industry to manage data across different domains with a focus on scalability of the data management infrastructure and a logical division based on data domains

```mermaid
---
title: data mesh logical view
---
flowchart LR
subgraph domain 1
A@{ shape: rect, label: data product}
B@{ shape: rect, label: data product}
end

subgraph domain 2
C@{ shape: rect, label: data product}
D@{ shape: rect, label: data product}
E@{ shape: rect, label: data product}
end

```

## Data product

A data product is the minor component of a data mesh it's composed by:

- code to manage, serve and collect data
- data itself
- infrastructure to build and deploy data products

Formally:

> [!CITE]
> an independently deployable, high-cohesive component encompassing all the structural elements required for its function (architectural quantum)

## Data mesh Component relations

```mermaid
flowchart TD

subgraph Business Domains
A@{ shape: circle }
Ba@{ shape: circle }
end
A --> B & C
Ba --> D

subgraph Data Domains
B@{ shape: circle }
C@{ shape: circle }
D@{ shape: circle }
end
B --> E
C --> F
D --> G & H

subgraph Data bounded Contexts
E@{ shape: circle }
F@{ shape: circle }
G@{ shape: circle }
H@{ shape: circle }
end

E --> I & J
F --> K
G --> E & L & M
H --> N

subgraph Data products
I@{ shape: circle }
J@{ shape: circle }
K@{ shape: circle }
L@{ shape: circle }
M@{ shape: circle }
N@{ shape: circle }
end

I --> O & P & Q & K
J --> Q & R
J --> S & T
K --> U & V & J
M --> X & N
N --> Y

subgraph Data products components
O@{ shape: circle }
P@{ shape: circle }
Q@{ shape: circle }
R@{ shape: circle }
S@{ shape: circle }
T@{ shape: circle }
U@{ shape: circle }
V@{ shape: circle }
X@{ shape: circle }
Y@{ shape: circle }
end

O --> Z1
P --> Z1
Q --> Z1
R --> Z1
S --> Z1
T --> Z2
U --> Z2
V --> Z2
X --> Z2
Y --> Z2

subgraph self serve platform services
Z1@{ shape: circle }
Z2@{ shape: circle }
end

subgraph Operating infrastructure
W1@{ shape: db }
W2@{ shape: cloud }
end
Z1 ~~~ W1
Z2 ~~~ W2
```

The mesh start to appear when components at different levels interact with component on the same level, for example data products can consume input from other data products or components at upper levels can aggregate data from different domains to correlate them

## Data product

A Data product has to accomplish this requirements:

- store domain data
- query input sources to gather data
- exposed data via output ports
- pre-process data

```mermaid
---
title: data product architecture
---
flowchart LR
subgraph inputs
A@{shape: in-out, label: input port}
end
subgraph outputs
direction TB
B@{shape: in-out, label: output port}
G@{shape: in-out, label: Discovery port}
B ~~~ G
end
subgraph core
C@{shape: db, label: data storage}
D@{shape: doc, label: documentation}
E@{shape: rect, label: CI CD pipelines}
F@{shape: rect, label: observability}
H@{shape: rect, label: tests}
I@{shape: rect, label: data trasformation}
C ~~~ D ~~~ H
E ~~~ F ~~~ I
end
inputs ~~~ core ~~~ outputs
```

## Data contracts

Data exposed by a data product are formatted in datasets specified by **data contracts** that define the data format for the dataset
