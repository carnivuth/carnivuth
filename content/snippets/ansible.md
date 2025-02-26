---
title: 'Ansible'
date: '2025-02-15'
draft: false
description: "ansible personal snippets and reference"
tags: ["snippet","ansible","playbooks","inventories","ansible vault"]
---

Personal snippets for ansible playbooks development and reference


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
