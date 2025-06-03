---
title: "ansible"
date: 2024-09-29
description: "ansible snippets and personal docs"
tags:
  - "snippet"
  - "ansible"
  - "playbooks"
  - "inventories"
  - "ansible vault"
series:
  - "Technologies notes"
draft: false
series_order: 1
---

[ansible](https://docs.ansible.com/) is an network automation framework that allow to execute a series of tasks in parallel in a set of machines, it allows for both declarative and procedural approaches to define machine state and environment configurations, it's based around 2 simple concepts

- a list of a task to be executed called `playbook`
- a list of host machines to target called `inventory`

>[!NOTE] ansible uses ssh connection and copies python script to execute modules, so the target machine must have ssh enabled and configured and a compatible python interpreter

{{< mermaid >}}
---
title: ansible inner working
---

sequenceDiagram
participant ansible_runner
participant target
ansible_runner ->> target: copies ansible module (python file)
target ->> target: executes ansible module
{{</ mermaid >}}

Ansible content can be distributed in the form of roles or collections, where a role is a set of tasks that made a specific action/configuration (*e.g. Installing docker*) and a collection is a set of roles

## Snippets

- copy script in remote host and set a cronjob

```yaml
- name: Setup cronjob
  block:

    - name: Copy cronjob script
      ansible.builtin.template:
        src: templates/cronjob.sh.j2
        dest: /usr/local/bin/cronjob.sh
        mode: '755'

    - name: Configure cron to run cronjob
      ansible.builtin.cron:
        name: "cronjob"
        minute: "*"
        hour: "*"
        job: "/usr/local/bin/cronjob.sh > /dev/null 2>&1"
```

- Block rescue for installation procedure and notifications

```yaml
- name: Do installation operations
  block:
  # tasks ....
  rescue:
    - name: Notify failed installation
      ansible.builtin.uri:
        url: "{{ ntfy_endpoint }}"
        method: POST
        body: "installation on {{ inventory_hostname }} has encounter some issues"
```

- test a variable and fail if it is undefined

```yaml
- name: Print variables and fail if absent
  block:
    - ansible.builtin.debug:
        var: foo
    - ansible.builtin.fail:
        msg: "{{ foo }} is undefined"
      when: foo is undefined
```
