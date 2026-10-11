cat > docs/README.md <<'EOF'
# AI SaaS Infrastructure on AWS

Production-style Infrastructure as Code portfolio project built with Terraform and AWS.

The project demonstrates modular infrastructure design, security hardening, containerisation, automated validation, infrastructure security scanning, and CI/CD planning.

## Project Progress

### Core Infrastructure

- Completed — Sprint 1: VPC and Networking
- Completed — Sprint 2: Security Groups
- Completed — Sprint 3: EC2 Compute Module
- Completed — Sprint 4: IAM Roles
- Completed — Sprint 5: Application Load Balancer
- Completed — Sprint 6: EC2 Bootstrapping with User Data

### Containerisation and Security

- Dockerised Nginx application
- Non-root container execution
- Container image security scanning
- Terraform security scanning with Trivy
- Encrypted EC2 root volume configuration
- IMDSv2 enforcement
- Infrastructure security hardening

### CI/CD and Automation

- GitHub Actions workflows
- Terraform validation
- Terraform security scanning
- Docker build and security scanning
- Terraform plan automation
- AWS authentication using GitHub Actions OIDC
- Environment parameterisation

### Monitoring and Logging

- CloudWatch configuration
- Prometheus configuration
- Grafana configuration
- Node Exporter and Blackbox monitoring components

Configuration in the repository does not, by itself, establish that monitoring has been tested against live AWS infrastructure.

### Environment and State Management

- Development configuration template
- Staging configuration template
- Production configuration template
- Terraform S3 remote-state bootstrap configuration

The S3 state bucket has not been deployed, and the main Terraform configuration has not been migrated to a remote backend.

## Technologies

- AWS
- Terraform
- Docker
- Nginx
- GitHub Actions
- AWS IAM and OIDC
- Trivy
- Amazon VPC
- EC2
- IAM
- Application Load Balancer
- CloudWatch
- Prometheus
- Grafana

## Validation

Terraform configuration validation and automated CI checks are used to identify configuration errors and security issues.

Validation and planning are not equivalent to deploying the infrastructure or verifying every component in a live AWS environment.

## Documentation

- [Main project README](../README.md)
- [Infrastructure architecture](ARCHITECTURE.md)
- [Operational runbook](RUNBOOK.md)

## Project Status

The project is being finalised as a portfolio repository.

The focus is on documenting the architecture, validating the configuration, and presenting the implemented security and automation work accurately.

Live deployment, production HTTPS, and remote-state migration remain separate activities requiring deliberate configuration and testing.
EOF


ai-saas-infrastructure-aws/
├── README.md                 # Main GitHub project page
├── docs/
│   ├── architecture.png
│   ├── deployment.md         # Setup and operational instructions
│   └── screebshots/          # Existing screenshots folder
├── bootstrap/
├── environments/
├── modules/
├── docker/
└── .github/
