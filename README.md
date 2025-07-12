🚀 Project Roadmap

✅ Phase 1: Infrastructure Setup with Terraform (Completed)
Provisioned AWS infrastructure using Terraform modules:

VPC with public and private subnets

Security groups for web, app, and database tiers

Application Load Balancers

Auto Scaling Groups with Launch Templates

RDS database in private subnet


⚙️ Phase 2: Ansible Configuration for Web Tier (Coming Soon – End July)
Automating server provisioning and web app configuration with Ansible

Plans:

Install necessary packages

Deploy sample web app

Configure Nginx/Apache, systemd services, firewall

Status: Learning Ansible in progress


🛠️ Phase 3: CI/CD Pipeline Integration (Coming Soon – End August)
Implementing CI/CD pipeline with GitHub Actions

Planned features:

terraform fmt, validate, plan, apply on PR/merge

Secrets management with GitHub Actions

Approval gates before production apply

Status: Planning phase

📊 Phase 4: Monitoring, Metrics, and Logging (Planned)
Setting up monitoring and observability to ensure application health and performance

Focus areas:

Implement metrics collection with Prometheus

Visualize dashboards with Grafana

Centralized logging using Elasticsearch and Kibana

Alerting and notifications on key events and thresholds

Status: Planning phase