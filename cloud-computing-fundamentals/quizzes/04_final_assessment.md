# Final Assessment — Cloud Computing Fundamentals

## Instructions

Answer without provider documentation first. Then verify provider-specific answers against current official documentation.

## Multiple Choice

1. Which design best protects a stateless application from a single-zone failure?
   - A. One large VM with a snapshot
   - B. Multiple instances across at least two zones behind a load balancer
   - C. One instance with a public IP
   - D. A larger database

2. Which statement is correct?
   - A. Managed databases remove all customer security responsibility
   - B. Encryption at rest removes the need for access control
   - C. The customer remains responsible for identities, data, and configuration
   - D. Provider compliance certification automatically certifies every workload

3. Which storage is normally best for product images?
   - A. Object storage
   - B. VM memory
   - C. Block storage attached to one application server
   - D. DNS

4. Which is the strongest reason for multi-cloud?
   - A. Every architecture diagram should have two logos
   - B. A measurable business or regulatory requirement
   - C. Avoiding all provider-native services
   - D. Assuming it always reduces cost

5. Which practice best reduces credential risk for an application running in cloud compute?
   - A. Store an administrator password in the image
   - B. Use a provider workload identity with least privilege
   - C. Share a developer's API key
   - D. Put access keys in source control

6. Which term defines the maximum acceptable data loss measured in time?
   - A. RTO
   - B. RPO
   - C. SLA
   - D. CDN

7. Which is not a complete disaster-recovery plan?
   - A. Tested restore procedures
   - B. DNS and identity recovery considerations
   - C. A statement that the service is managed
   - D. Defined RTO and RPO

8. What is the primary purpose of a landing zone?
   - A. Replace all application teams
   - B. Establish reusable cloud foundations and guardrails
   - C. Eliminate identity management
   - D. Guarantee zero cost

9. Which FinOps action should normally happen before purchasing a large commitment?
   - A. Measure stable baseline usage
   - B. Disable cost reports
   - C. Remove all tags
   - D. Increase log retention indefinitely

10. Why can cross-provider active-active deployment be difficult?
    - A. Clouds do not support networking
    - B. It adds data consistency, identity, operations, egress, and tooling complexity
    - C. Virtual machines cannot run applications
    - D. DNS cannot be used in cloud

## Scenario Questions

11. A team wants to run a single VM in cloud because the provider datacenter is highly available. Identify three architecture risks.
12. A public object-storage bucket contains internal documents. Identify responsibility and remediation steps.
13. A managed database has automated backups, but no restore test has been performed. Explain the remaining risk.
14. A development subscription has no owner tags and has exceeded budget. Propose immediate and preventive actions.
15. Map a basic web application to two cloud providers and explain one meaningful difference between the selected services.

## Answer Key

1. B
2. C
3. A
4. B
5. B
6. B
7. C
8. B
9. A
10. B

Scenario answers should identify ownership, failure domains, identity, public exposure, recovery testing, cost allocation, and provider-specific differences rather than only listing product names.
