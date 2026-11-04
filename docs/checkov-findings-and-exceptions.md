# Checkov Findings and Production Closure

**Status:** Advisory baseline for a development lab. Findings are not silently treated as passes.

## Findings from the current storage module scan

### Customer-managed key (CMK) policy

Checkov reports that the Storage Account does not use a customer-managed key. The current module relies on Azure Storage's Microsoft-managed encryption keys. CMK should be introduced only after the data classification, key ownership, rotation, recovery, purge protection, service identity and Key Vault network design are agreed.

**Before production:** classify the data; if CMK is required by policy, implement a dedicated Key Vault/key lifecycle and Storage managed-identity authorization, then test rotation and recovery.

### Blob read-operation diagnostics

Checkov reports that Blob read logging is not configured. The module currently has no Log Analytics workspace or diagnostic retention policy.

**Before production:** create or reference an approved monitoring workspace, configure Blob service diagnostic settings for the required read/write/delete categories, define retention and cost ownership, and test query/alert coverage.

## Gate behavior

The Checkov step is temporarily advisory (soft_fail: true) while these controls are evaluated. This does not mean the findings are resolved. A production release must close or formally accept each finding with an owner, rationale, compensating control and expiry date, then restore a blocking policy gate.

## Scope

The Terraform lab is not approved for storing sensitive or regulated data until the above controls and the broader threat model are reviewed.
