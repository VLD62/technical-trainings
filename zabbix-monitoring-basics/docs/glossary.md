# Zabbix Glossary

## Action

A set of conditions and operations that controls notifications, escalation, or approved automation after an event.

## Active check

A check where the Zabbix agent obtains its item configuration and sends collected values to a server or proxy.

## Agent

A lightweight process installed on a monitored host to collect operating-system and application metrics.

## Agent 2

A newer plugin-based Zabbix agent implementation supporting active and passive checks on supported Linux and Windows systems.

## Autoregistration

A mechanism that allows active agents to register with a server or proxy and trigger automated configuration actions.

## Dashboard

A configurable view that combines widgets such as problems, graphs, item values, maps, and host status.

## Discovery

Automatic detection of networks, hosts, interfaces, filesystems, services, or other resources.

## Event

A record of a state change, such as a trigger changing from OK to problem or back to OK.

## Frontend

The web interface used to configure Zabbix and view monitoring data.

## High availability

A configuration using multiple Zabbix server nodes to reduce service interruption when one server node fails.

## History

Detailed item values stored for a configured retention period.

## Host

A monitored entity such as a server, device, application, or cluster component.

## Host group

A logical group used for organization, permissions, actions, and filtering.

## Housekeeping

The removal of expired history, trends, events, and other data according to configured retention rules.

## Item

A definition of one value that Zabbix should collect.

## Item key

The identifier that specifies which metric an agent, integration, or other item type should return.

## Latest data

A frontend view showing recently collected item values.

## Low-level discovery

A mechanism that discovers multiple similar entities and creates item, trigger, graph, or host prototypes for them.

## Macro

A reusable placeholder value used in templates, hosts, items, triggers, and other configuration objects.

## Maintenance

A time window used to manage data collection and problem notification behavior during planned work.

## Media type

The notification channel definition, such as email, webhook, chat, or script.

## Passive check

A check where the server or proxy connects to an agent and requests a value.

## Problem

An active abnormal condition created by a problem event.

## Proxy

A Zabbix component that collects and buffers data on behalf of the central server.

## Recovery event

An event created when a trigger returns from problem state to OK state.

## Server

The central Zabbix component that processes monitoring data, evaluates triggers, creates events, and runs actions.

## Template

A reusable collection of items, triggers, graphs, discovery rules, dashboards, macros, and related monitoring configuration.

## Trend

Aggregated historical values stored for long-term analysis with less detail than history.

## Trigger

A logical expression that evaluates item values and detects an abnormal condition.

## User group

A group of users used to assign frontend access, authentication behavior, and permissions to monitored objects.

## User role

A definition of which frontend and API capabilities a user can access.

## Value map

A mapping that converts raw values into readable labels.

## Zabbix sender

A command-line utility or protocol client used to send values to trapper items on a server or proxy.
