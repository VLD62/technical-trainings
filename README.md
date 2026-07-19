# Technical Trainings

A collection of reusable technical training materials, presentations, documentation, notebooks, and practical examples.

Each training is organized as an independent module with its own structure, setup instructions, and learning materials.

## Training Catalog

| Training | Description | Materials |
|---|---|---|
| **AI Agents & Workflows: Basics** | Practical introduction to AI agents, workflows, tools, memory, prompt engineering, LangChain, and related concepts. | [Open training](./ai-agents-workflows-basics/) |
| **Jenkins Pipelines: Basics** | Practical introduction to Jenkins, CI/CD workflows, Declarative and Scripted Pipelines, agents, plugins, Jenkinsfiles, and pipeline best practices. | [Open training](./jenkins-pipelines-basics/) |
| **Ansible First Steps** | Hands-on introduction to Ansible automation, inventories, ad-hoc commands, playbooks, facts, handlers, and common operational tasks. | [Open training](./ansible-first-steps/) |
| **JFrog Artifactory: First Steps** | Practical introduction to artifact repositories, repository types, artifact upload and download workflows, publishing, metadata, and automation. | [Open training](./artifactory-first-steps/) |
| **Zabbix Monitoring: Basics** | Practical introduction to Zabbix architecture, server components, Agent 2, templates, Kubernetes monitoring, alerting, access control, and troubleshooting. | [Open training](./zabbix-monitoring-basics/) |
| **Linux Administration: Basics** | Practical, vendor-neutral Linux administration course covering system architecture, command-line tools, package management, filesystems, users, services, networking, security, shell scripting, and preparation for the LPIC-1 101-500 and 102-500 exams. | [Open training](./linux-administration-basics/) |
| **Prometheus & Grafana: Basics** | Hands-on introduction to metrics monitoring, Prometheus architecture, Node Exporter, PromQL, Grafana dashboards, provisioning, alerting, and multi-host Linux monitoring. | [Open training](./prometheus-grafana-basics/) |
| **Virtualization & Container Technologies: Basics** | Practical introduction to virtual machines, hypervisors, container images, engines, runtimes, registries, Docker, Podman, Compose, isolation, and hybrid infrastructure patterns. | [Open training](./virtualization-container-technologies-basics/) |
| **OpenStack Infrastructure: Basics** | Hands-on introduction to OpenStack architecture, core services, Kolla-Ansible deployment, Neutron networking, Ceph storage, operations, troubleshooting, scaling, and high availability. | [Open training](./openstack-infrastructure-basics/) |
| **Kubernetes & Cloud Native Associate** | Structured preparation for the KCNA certification, covering Kubernetes fundamentals, container orchestration, cloud native application delivery, architecture, observability, security, storage, and the CNCF ecosystem. | [Open training](./kubernetes-cloud-native-associate/) |
| **PL/SQL & T-SQL Database Programming: Fundamentals** | Hands-on introduction to database programming with Oracle PL/SQL and Microsoft SQL Server T-SQL, covering procedural SQL, variables, control flow, cursors, stored procedures, functions, packages, transactions, error handling, triggers, dynamic SQL, security, performance, and deployment practices. | [Open training](./plsql-tsql-database-programming-fundamentals/) |
| **Bash Scripting: Fundamentals** | Hands-on introduction to Bash scripting, covering shell fundamentals, variables, parameters, conditions, loops, functions, arrays, text processing, files, error handling, debugging, security, testing, and reusable automation scripts. | [Open training](./bash-scripting-fundamentals/) |

## Repository Structure

```text
technical-trainings/
├── README.md
├── LICENSE
├── ai-agents-workflows-basics/
│   ├── README.md
│   ├── slides/
│   ├── notebooks/
│   ├── docs/
│   └── requirements.txt
├── jenkins-pipelines-basics/
│   ├── README.md
│   ├── slides/
│   ├── docs/
│   └── examples/
├── ansible-first-steps/
│   ├── README.md
│   ├── slides/
│   ├── docs/
│   ├── examples/
│   ├── playbooks/
│   └── requirements.txt
├── artifactory-first-steps/
│   ├── README.md
│   ├── slides/
│   ├── docs/
│   ├── examples/
│   └── requirements.txt
├── zabbix-monitoring-basics/
│   ├── README.md
│   ├── slides/
│   ├── docs/
│   └── examples/
├── linux-administration-basics/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── LICENSE.md
│   ├── Makefile
│   ├── slides/
│   ├── docs/
│   ├── labs/
│   ├── examples/
│   ├── scripts/
│   └── quizzes/
├── prometheus-grafana-basics/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── Makefile
│   ├── slides/
│   ├── docs/
│   ├── exercises/
│   └── lab/
├── virtualization-container-technologies-basics/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── Makefile
│   ├── slides/
│   ├── docs/
│   ├── labs/
│   ├── examples/
│   ├── scripts/
│   └── quizzes/
├── openstack-infrastructure-basics/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── LICENSE.md
│   ├── Makefile
│   ├── slides/
│   ├── docs/
│   ├── labs/
│   ├── examples/
│   ├── scripts/
│   └── quizzes/
├── kubernetes-cloud-native-associate/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── LICENSE.md
│   ├── Makefile
│   ├── slides/
│   ├── docs/
│   ├── labs/
│   ├── examples/
│   ├── scripts/
│   └── quizzes/
├── plsql-tsql-database-programming-fundamentals/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── LICENSE.md
│   ├── Makefile
│   ├── docker-compose.yml
│   ├── slides/
│   ├── docs/
│   ├── labs/
│   ├── examples/
│   ├── scripts/
│   ├── tests/
│   └── quizzes/
└── bash-scripting-fundamentals/
    ├── README.md
    ├── MANIFEST.md
    ├── LICENSE.md
    ├── Makefile
    ├── slides/
    ├── docs/
    ├── labs/
    ├── examples/
    ├── scripts/
    ├── tests/
    └── quizzes/
```

Each training directory contains its own `README.md` with detailed information, prerequisites, setup instructions, and links to the available materials.


## License

Unless stated otherwise within a specific training directory:

- Educational content, including presentations, documentation, diagrams, and exercises, is licensed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**.
- Source code, scripts, notebooks, and executable examples are licensed under the **MIT License**.
- Third-party images, trademarks, and referenced materials remain subject to their respective owners and licenses.

See the license files in the repository for full terms.

## Author

**Vladislav Iliev**

[LinkedIn](https://www.linkedin.com/in/vld62/)
