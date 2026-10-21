# Threat Model — Azure DevSecOps Platform

## Purpose and boundaries
This portfolio project models selected Azure infrastructure with Terraform. It is not a claim of a fully deployed production platform. Validate current Terraform resources and workflows before treating any control as implemented.

## Assets to protect
- Azure subscription and resource control plane
- Terraform state and plan artifacts
- Deployment identity and GitHub repository secrets
- Storage data and access keys
- Application endpoints and management access
- CI logs, artifacts, and supply-chain dependencies

## Trust boundaries
1. Developer workstation → Git repository
2. Pull request / GitHub Actions runner → Azure identity
3. Deployment identity → Azure Resource Manager
4. Application subnet → management and data services
5. Public network → application ingress
6. Workload → Storage data plane

## Main threats and mitigations
| Threat | Potential impact | Mitigation / acceptance criteria |
|---|---|---|
| Secret committed to Git | Account or data compromise | Secret scanning; rotate exposed credentials; assess repository history |
| Overly broad inbound rule | Unauthorized access | Permit only required ports and trusted ingress sources |
| Excessive CI identity permissions | Subscription-wide changes | OIDC/workload federation, least privilege, scoped roles, protected environments |
| Unreviewed Terraform apply | Destructive or unintended changes | Plan review, protected branch, environment approval, rollback procedure |
| Public storage endpoint or shared key | Data exposure or key misuse | Private endpoint/network design where appropriate, Entra ID authorization, diagnostics |
| Compromised third-party Action/provider | Supply-chain compromise | Pin and review dependencies; update versions deliberately |
| Sensitive state/plan artifact leakage | Infrastructure and secret disclosure | Restrict backend access, encryption, retention controls, avoid publishing plan files |

## Security acceptance criteria
- Terraform formatting and validation succeed in the relevant root module.
- Lint and IaC security scans run in CI; findings are reviewed, not merely ignored.
- No credentials or state files are committed.
- Inbound and outbound traffic requirements are documented and narrowly scoped.
- Terraform state storage, identity, and access are explicitly designed.
- CI results and limitations are documented with commit-specific evidence.

## Known demo trade-offs
Review the current README and Terraform code before each run. The current example documents storage network-access/shared-key trade-offs and an app-subnet HTTPS rule that may be broader than a hardened deployment should allow. Treat these as review items, not controls to assume are solved.
