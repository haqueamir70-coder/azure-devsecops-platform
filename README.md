# Azure DevSecOps Platform

A Terraform-focused portfolio project for exploring modular Azure infrastructure, environment separation, and security checks as part of an Infrastructure as Code workflow.

## Repository layout

The current repository includes:

- `.github/` for workflow configuration
- `environments/` for environment-specific configuration
- `modules/` for reusable infrastructure components
- `.tflint.hcl` for TFLint configuration

Inspect the current files in each directory to verify which resources and pipeline stages are implemented.

## Goals

- Organize Azure infrastructure as code into understandable modules.
- Separate environment configuration from reusable resource definitions.
- Add consistent formatting, validation, linting, and infrastructure security scanning.
- Make plan output reviewable before infrastructure changes are applied.
- Keep credentials and Terraform state out of source control.

## Recommended local validation

Run commands from the relevant Terraform root module:

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
tflint --recursive
```

The exact command and working directory depend on the repository's module structure. Initialize normally with the configured backend when running a plan that requires remote state.

## Suggested delivery pipeline

```text
Pull request
    |
    v
Format + validate
    |
    v
Lint + IaC security scan
    |
    v
Review Terraform plan
    |
    v
Approved deployment
```

This is a recommended target workflow, not a claim that every stage is already configured. Review `.github/workflows/` for the implemented triggers and jobs.

## Security principles

- Prefer workload identity federation/OIDC for GitHub Actions to Azure where supported.
- Grant only the Azure permissions required by the pipeline.
- Store state in a secured remote backend with access controls and locking.
- Never commit credentials, state files, or sensitive plan artifacts.
- Pin and review GitHub Actions and provider versions.
- Require human review and protected-environment approval before production applies.
- Add logging, diagnostics, policy checks, and a documented rollback/cleanup process.

## Roadmap

- Document each module's inputs, outputs, and examples.
- Add automated format, validation, lint, and IaC security checks.
- Add a clear development/staging/production configuration strategy.
- Document remote state setup and Azure authentication.
- Publish validation evidence and an architecture diagram after testing.

## Author

MD Amirul Haque · [GitHub profile](https://github.com/haqueamir70-coder) · [LinkedIn](https://www.linkedin.com/in/md-amirul-haque/)
