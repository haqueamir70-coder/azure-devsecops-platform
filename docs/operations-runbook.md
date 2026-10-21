# Operations Runbook

## Before deployment
1. Confirm a non-production subscription and the intended tenant.
2. Run az account show and verify the subscription.
3. Review local variable values; never commit real values.
4. Run terraform fmt -check -recursive, terraform init, and terraform validate from the correct root module.
5. Run TFLint and the configured IaC security scanner; review findings.
6. Generate and inspect a Terraform plan. Confirm names, network exposure, identity permissions, and expected cost.
7. Apply only after explicit review. Do not auto-apply unreviewed changes to production.

## If a deployment fails
1. Stop before retrying if the error suggests partial creation, permission issues, or state drift.
2. Capture the exact error and resource address, excluding secrets and tokens.
3. Check Azure activity logs and Terraform state/backend health.
4. Confirm tenant, subscription, provider version, required permissions, and variable values.
5. Use terraform plan to understand drift before manual changes.
6. Avoid deleting state or manually editing state as a first response.

## If a secret is exposed
1. Revoke or rotate it immediately at the issuing service.
2. Identify affected accounts, resources, and time window.
3. Review audit/activity logs for misuse.
4. Remove it from current code and assess Git history and copied artifacts.
5. Add prevention such as secret scanning, protected secrets, and short-lived identity.

## If unexpected public exposure is found
1. Confirm the affected resource and exact rule/endpoint.
2. Restrict or disable exposure using an approved change, considering service impact.
3. Review logs and identity activity for unauthorized access.
4. Validate with a fresh plan and post-change checks.
5. Record root cause and preventive action.

## Teardown
- Inspect the plan for destructive actions before terraform destroy.
- Confirm the target subscription and resource group.
- Preserve required logs/data and remove only disposable demo resources.
- Verify removal in Azure; account for soft-delete, locks, and retained services.
