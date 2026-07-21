# Glossary

**Actual state**  
The state currently observed in the target system.

**Application**  
In Argo CD, a custom resource that connects a source of manifests to a destination and synchronization policy.

**ApplicationSet**  
An Argo CD controller and custom resource used to generate multiple Applications from templates and generators.

**AppProject**  
An Argo CD resource that groups applications and constrains allowed sources, destinations, and resource types.

**Artifact**  
A build output such as a container image, package, or Helm chart.

**Convergence**  
The condition reached when actual state matches desired state within the controller's comparison rules.

**Continuous delivery**  
A practice that keeps changes releasable through automated build, test, and delivery processes.

**Continuous deployment**  
A practice where qualified changes are automatically released to production.

**Controller**  
Software that continuously observes state and attempts to move the system toward desired state.

**Declarative configuration**  
A description of the intended result rather than only the commands required to produce it.

**Desired state**  
The approved state declared in a versioned source.

**Diff**  
The calculated difference between desired and actual state.

**Drift**  
A relevant difference between desired and actual state, often caused by manual changes or another controller.

**GitOps**  
An operating model in which desired state is declarative, versioned, automatically pulled, and continuously reconciled.

**Health status**  
An assessment of whether resources are functioning correctly, separate from configuration synchronization.

**Helm**  
A package manager and templating system for Kubernetes.

**Hook**  
A resource executed at a defined phase of a synchronization operation.

**Immutable artifact**  
An artifact whose content does not change after publication and can be identified by version or digest.

**Kustomize**  
A Kubernetes-native configuration customization tool based on bases, overlays, and patches.

**Manifest generation**  
The process of converting source configuration into Kubernetes resource manifests.

**Pruning**  
Deleting live resources that are no longer part of desired state.

**Pull model**  
A delivery model where an agent in or near the target environment retrieves desired state.

**Push model**  
A delivery model where an external system sends changes directly to the target.

**Reconciliation**  
Repeated comparison and corrective action intended to align actual and desired state.

**Repository server**  
The Argo CD component responsible for retrieving and rendering source configuration.

**Rollback**  
Returning desired state to a previous version. It does not automatically reverse external data changes.

**Self-healing**  
Automatic correction of eligible live-state drift.

**Source of truth**  
The authoritative versioned location of approved desired state.

**Sync status**  
Argo CD's assessment of whether live state matches generated desired manifests.

**Sync wave**  
An ordering mechanism used to apply resources in groups during synchronization.

**Sync window**  
A time-based allow or deny rule for application synchronization.

**Target revision**  
The branch, tag, commit, or version selection used as desired state.

**Version promotion**  
Moving the same tested artifact version into the desired state of a later environment.
