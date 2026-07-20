# Lab 02 — Design a Highly Available Web Application

## Objective

Design a provider-neutral architecture for the ShopNow workload.

## Requirements

Use `examples/workload-requirements.yaml`.

The design must include:

- Public HTTPS entry point
- Stateless application tier across at least two failure domains
- Relational order database
- Object storage for product images
- Queue or event service for background processing
- Central logs, metrics, and audit events
- Backups and tested restore process
- European primary data location

## Tasks

1. Draw the request flow from user to application and data services.
2. Identify every zonal, regional, and global component.
3. Define health checks and scaling signals.
4. Define database availability and backup behavior.
5. State the RTO and RPO assumptions.
6. Identify at least five failure scenarios.
7. Explain how the design handles each scenario.
8. List the top cost drivers.

## Required Failure Scenarios

- One application instance fails
- One availability zone/domain fails
- Database primary fails
- A deployment introduces an application error
- An operator deletes data
- External identity or DNS is degraded

## Deliverable

A one-page architecture description and a risk table.

## Stretch Goal

Design a warm-standby regional disaster-recovery option and explain its data-consistency and cost trade-offs.
