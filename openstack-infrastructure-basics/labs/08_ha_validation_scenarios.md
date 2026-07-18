# Lab 08 - High-Availability Validation Scenarios

## Goal

Design safe failure tests and success criteria. Execute only in a dedicated lab with explicit authorization.

## Scenario 1 - API Container Failure

Action:

- Stop one API container on one controller.

Expected:

- Virtual IP remains reachable
- HAProxy removes the failed backend
- API requests continue through remaining backends
- Alert is generated

Evidence:

- API request success
- HAProxy backend state
- Container state and logs
- Monitoring event

## Scenario 2 - Virtual IP Owner Failure

Action:

- Shut down or isolate the node currently owning the VIP.

Expected:

- VIP moves to another healthy node
- DNS remains unchanged
- Existing and new API calls recover within the defined target

Measure actual interruption time.

## Scenario 3 - Database Member Failure

Action:

- Stop one Galera member using the deployment's approved procedure.

Expected:

- Cluster retains quorum
- Remaining members are ready and synchronized
- APIs continue to write state

Do not test total-cluster recovery without a dedicated restore procedure.

## Scenario 4 - RabbitMQ Member Failure

Action:

- Stop one message-bus member.

Expected:

- Cluster remains healthy
- RPC and notifications continue
- No disk or memory alarm appears
- Queues do not grow without bound

## Scenario 5 - Compute Host Failure

Action:

- Place one host into maintenance or power it off in a lab.

Questions:

- What happens to running instances?
- Is shared storage available?
- Is evacuation configured and authorized?
- How is capacity recalculated?

## Scenario 6 - Network Gateway Failure

Action depends on backend:

- HA router agent
- OVN gateway chassis
- Physical uplink

Validate both outbound and inbound floating-IP traffic and the return path.

## Test Plan Template

```text
Test name:
Purpose:
Preconditions:
Risk:
Rollback:
Action:
Expected control-plane behavior:
Expected workload behavior:
Observability signals:
Success criteria:
Actual result:
Follow-up:
```
