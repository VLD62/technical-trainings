# Quiz 02 — Security, Infrastructure, and Services

## Questions

1. What does the shared responsibility model describe?
2. Why should workload identities replace embedded credentials?
3. What is least privilege?
4. What is the difference between an availability zone and a region?
5. Why is replication not a complete backup strategy?
6. Define RTO and RPO.
7. Which storage model is commonly used for images and backups?
8. Which storage model is commonly used for an OS disk?
9. Why should a database usually not have a public endpoint?
10. What problem do queues solve between application components?
11. Why are retries dangerous without idempotency?
12. Name four categories of cloud audit or security telemetry.

## Answers

1. The division of security and operational responsibilities between provider and customer.
2. They reduce long-lived secret exposure and can use short-lived, automatically managed credentials.
3. Granting only the required access for only the required time and scope.
4. A region is a geographic area; a zone is an isolated infrastructure location inside a region.
5. Deletion or corruption can replicate, while an isolated retained backup can support recovery to an earlier state.
6. RTO is maximum acceptable recovery time; RPO is maximum acceptable data loss measured in time.
7. Object storage.
8. Block storage.
9. It increases exposure and bypasses private application trust boundaries.
10. They decouple producers and consumers and absorb asynchronous demand.
11. A retried operation may execute more than once and create duplicate side effects.
12. Administrative audit logs, authentication events, network flow logs, application logs, key/secret usage, and security findings are valid examples.
