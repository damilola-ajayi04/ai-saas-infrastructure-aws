cat > README.md <<'EOF'
# Production-Ready AI Application Infrastructure on AWS

A DevOps portfolio project demonstrating Infrastructure as Code, AWS networking, containerisation, infrastructure security, and CI/CD automation using Terraform, Docker, and GitHub Actions.

## Project Goals

- Provision reusable AWS infrastructure using Terraform modules.
- Separate networking, security, compute, IAM, monitoring, and logging concerns.
- Harden infrastructure and container configurations.
- Automate Terraform validation, security scanning, Docker image scanning, and infrastructure planning.
- Use GitHub Actions OIDC authentication for AWS access without long-lived AWS credentials.
- Prepare environment-specific configuration for development, staging, and production.

## Technology Stack

- AWS
- Terraform
- Docker and Nginx
- GitHub Actions
- AWS IAM and OIDC
- Trivy
- Amazon CloudWatch
- Prometheus and Grafana

## Architecture

The infrastructure configuration includes:

- A VPC with public and private subnets across three Availability Zones.
- Network routing and security groups.
- An EC2 application host using Amazon Linux 2023.
- IAM roles and instance-profile configuration.
- An Application Load Balancer with HTTP and conditional HTTPS listener configuration.
- Monitoring and logging configuration using CloudWatch, Prometheus, and Grafana.
- A Dockerised Nginx application.

The Terraform configuration is modular, with reusable components under `modules/`.

## Repository Structure

```text
.
├── .github/workflows/       # CI/CD workflows
├── bootstrap/
│   └── terraform-state/     # Terraform state bucket blueprint
├── docker/                  # Container configuration
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
├── modules/
│   ├── alb/
│   ├── compute/
│   ├── iam/
│   ├── logging/
│   ├── monitoring/
│   ├── network/
│   └── security/
├── nginx/
├── scripts/
├── docs/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
└── versions.tf



Security Measures

The project incorporates:

Encrypted EC2 root volumes.
IMDSv2 enforcement for EC2 instance metadata.
Security groups to control application and administrative access.
Non-root execution for the Nginx container.
Container image security scanning.
Terraform misconfiguration scanning with Trivy.
GitHub Actions OIDC authentication for AWS access.
S3 state bucket configuration with versioning, encryption, public-access blocking, and TLS enforcement.

Security scanners may report documented exceptions for intentional architectural decisions. See .trivyignore.

CI/CD

The GitHub Actions pipeline includes:

Terraform validation.
Terraform security scanning.
Docker image build and security scanning.
Terraform planning using GitHub Actions OIDC authentication.

A successful Terraform plan verifies the proposed infrastructure changes. It does not mean those resources have been deployed.

Environment Strategy

Example configuration files are provided for development, staging, and production.

The environment templates support a future multi-environment workflow. They should not be interpreted as proof that separate staging or production infrastructure has been deployed.

Remote Terraform State

The bootstrap/terraform-state/ directory contains Terraform configuration for an S3 state bucket.

The configuration has been validated locally. The bucket has not been created by this project workflow, and the main infrastructure has not been migrated to a remote backend.

Before adopting remote state, create the bucket through an approved bootstrap process, configure the backend, and migrate existing state carefully. Never delete the existing state as part of an unplanned migration.

Validation

From the repository root, initialise Terraform and validate the configuration:

terraform init -backend=false
terraform validate

Inspect the proposed infrastructure changes with a plan using your own valid environment configuration:

terraform plan -var-file="environments/dev/terraform.tfvars"

The real terraform.tfvars file should remain untracked. Use terraform.tfvars.example as a template and replace placeholders with appropriate values.

To validate the state bucket blueprint:

cd bootstrap/terraform-state
terraform init
terraform validate

These commands validate Terraform configuration. They do not deploy AWS resources.

Deployment Status and Limitations

This repository demonstrates infrastructure design, security controls, and automated validation.

The following distinctions are important:

Terraform configuration validation does not prove that AWS resources can be deployed successfully.
CI planning does not create infrastructure.
Monitoring configuration does not prove that live metrics and dashboards have been tested against deployed resources.
HTTPS requires a suitable domain and validated certificate configuration.
The S3 state bucket blueprint is not a deployed remote backend.

No AWS infrastructure should be created merely to complete the documentation.

Cost Considerations

AWS resources such as NAT Gateways, load balancers, EC2 instances, CloudWatch ingestion, and data transfer can incur charges.

Review the expected costs before deploying. Avoid terraform apply unless deployment is intentional and the associated costs are understood.

Future Improvements
Complete a controlled remote-state migration.
Introduce protected production deployment approvals.
Test the infrastructure in a dedicated AWS environment.
Verify live monitoring and alerting after deployment.
Add automated deployment and rollback procedures.
Author

Damilola Ajayi

DevOps Engineer | AWS | Terraform | Docker | CI/CD | Infrastructure Security
EOF