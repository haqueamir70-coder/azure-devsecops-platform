# Security Policy

## Scope
This is a learning and portfolio project. Do not use it to host production workloads or real sensitive data without a separate security review.

## Reporting a concern
Open a private security advisory through GitHub's Security tab when available. Do not publish credentials, tokens, subscription identifiers, private IP inventories, or exploitable details in a public issue.

## Safe-use checklist
- Use a non-production Azure subscription.
- Never commit credentials, private keys, Terraform state, real variable files, or sensitive plan files.
- Rotate any credential that may have entered Git history; deleting a file does not erase earlier commits.
- Review Terraform plans before applying.
- Scope inbound rules to known ingress paths and trusted sources.
- Prefer short-lived identity federation and least-privilege roles.
- Review storage public network access, shared-key authentication, diagnostics, retention, and recovery before handling data.
- Pin and periodically review providers, GitHub Actions, and scanner versions.

## Validation status
A passing static check does not prove the architecture is secure or production-ready. Record the commit, tool versions, findings, and accepted exceptions for each validation run.
