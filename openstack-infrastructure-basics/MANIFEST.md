# Course Manifest

This file summarizes the reusable materials included in the course.

## Core Files

| Path | Purpose |
|---|---|
| `README.md` | Course overview, structure, prerequisites, setup, and safety notes |
| `LICENSE.md` | Course-level licensing summary |
| `Makefile` | Short commands for listing, validation, prerequisite checks, and health reports |

## Slides

| Path | Topic |
|---|---|
| `slides/00_course_introduction.md` | Scope, objectives, prerequisites, and learning flow |
| `slides/01_fundamentals_and_architecture.md` | IaaS, control plane, data plane, regions, zones, cells, and roles |
| `slides/02_identity_projects_and_cli.md` | Keystone, projects, roles, endpoints, `clouds.yaml`, and CLI usage |
| `slides/03_compute_placement_and_images.md` | Nova, Placement, Glance, flavors, instances, and scheduling |
| `slides/04_networking_with_neutron.md` | Networks, routers, floating IPs, security groups, OVS, and OVN |
| `slides/05_storage_and_ceph.md` | Cinder, Swift, Manila, ephemeral storage, and Ceph integration |
| `slides/06_deployment_with_kolla_ansible.md` | Inventory, globals, bootstrap, deploy, post-deploy, and lifecycle |
| `slides/07_operations_and_troubleshooting.md` | Health checks, evidence collection, triage, and observability |
| `slides/08_high_availability_and_security.md` | VIPs, HAProxy, Keepalived, Galera, RabbitMQ, failure testing, and security |

## Documentation

| Path | Purpose |
|---|---|
| `docs/architecture_notes.md` | Text diagrams and request flows |
| `docs/service_catalog.md` | OpenStack service responsibilities and dependencies |
| `docs/networking_notes.md` | Neutron concepts and traffic-path troubleshooting |
| `docs/storage_notes.md` | Storage models, Ceph integration, and capacity considerations |
| `docs/kolla_ansible_notes.md` | Generic Kolla-Ansible deployment and lifecycle notes |
| `docs/operations_runbook.md` | Structured health-check and troubleshooting procedure |
| `docs/security_and_publication_notes.md` | Security controls and public-content sanitization guidance |
| `docs/glossary.md` | Key OpenStack terms and concise definitions |
| `docs/instructor_guide.md` | Delivery plan, demonstrations, and timing |
| `docs/useful_links.md` | Official documentation and learning resources |

## Labs, Examples, and Scripts

| Path | Purpose |
|---|---|
| `labs/` | Guided CLI, architecture, troubleshooting, Kolla, and HA exercises |
| `examples/clouds.yaml.example` | Safe placeholder cloud configuration |
| `examples/openrc.example` | Safe placeholder OpenRC configuration |
| `examples/kolla/` | Generic Kolla-Ansible inventory and globals examples |
| `examples/heat/simple_web_server.yaml` | Minimal Heat template for orchestration discussion |
| `scripts/check_prerequisites.sh` | Read-only local tool and capability checks |
| `scripts/openstack_health_report.sh` | Read-only OpenStack resource and service summary |
| `scripts/validate_content.py` | Required-file, link, secret-pattern, and public-content validation |
| `quizzes/` | Fundamentals and operations knowledge checks |
