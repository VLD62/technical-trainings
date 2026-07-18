# Instructor Guide

## Audience

The course is designed for engineers with Linux and networking fundamentals who need a structured introduction to private-cloud architecture and operations.

## Recommended Delivery Options

### Option A - Three Concept Sessions

**Session 1 - Architecture and Identity, 60 minutes**

- Course introduction
- OpenStack architecture
- Services, regions, zones, projects, and quotas
- Keystone and CLI demonstration

**Session 2 - Workload Resources, 60 minutes**

- Nova, Placement, Glance
- Neutron networking
- Cinder and Ceph concepts
- Resource creation demonstration

**Session 3 - Deployment and Operations, 75 minutes**

- Kolla-Ansible model
- Health checks and troubleshooting
- HA and security
- Scenario discussion

### Option B - Full-Day Workshop

| Time | Activity |
|---|---|
| 09:00-09:30 | Introduction and architecture |
| 09:30-10:30 | Identity, projects, quotas, and CLI lab |
| 10:45-12:00 | Images, flavors, instances, and compute lab |
| 13:00-14:30 | Networking and floating-IP lab |
| 14:45-15:30 | Volumes and storage lab |
| 15:30-16:15 | Operations and health-report lab |
| 16:15-17:00 | Kolla and HA design scenarios |

## Demonstration Sequence

1. `openstack token issue`
2. `openstack catalog list`
3. Inspect project quotas
4. List image, flavor, network, and key-pair resources
5. Create a server in a training project
6. Trace its ports and volume attachments
7. Run the health-report script
8. Review a generic Kolla inventory and globals file

## Instructor Preparation

- Create a dedicated project for each participant or team
- Set small quotas
- Preload one verified cloud image
- Create one provider network or provide a shared external network
- Confirm floating-IP capacity
- Confirm volume backend capacity
- Prepare cleanup instructions
- Test all commands with the exact cloud policy and service versions

## Discussion Questions

- Where is the strongest failure domain in this architecture?
- Which resource is owned by the project and which by the operator?
- What happens if Placement is healthy but Neutron port binding fails?
- What is the difference between a snapshot and a backup?
- How would you prove that API high availability actually works?
- Which configuration files are secrets?

## Assessment

A successful participant can:

- Draw the major service relationships
- Explain a server-creation request flow
- Use the CLI without exposing credentials
- Create and clean up a basic workload stack
- Trace compute, network, and storage dependencies
- Describe the Kolla-Ansible deployment phases
- Propose safe evidence collection before remediation
