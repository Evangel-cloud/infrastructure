<h1>☁️ AWS Terraform Infrastructure Project</h1>
<br>
<h2>🌐 Project Overview</h2>
This project sets up a full-stack cloud infrastructure on AWS using Terraform. It follows a modular design to provision resources such as VPCs, subnets, security groups, load balancers, auto scaling groups, and RDS databases. This is part of a portfolio project to demonstrate Infrastructure as Code, automation, and CI/CD concepts.
<br>
<br>
<h2>🚀 Project Roadmap</h2>
<h3>✅ Phase 1: Infrastructure Setup with Terraform (Completed) </h3>
<h4>Provisioned AWS infrastructure using Terraform modules:</h4>
<ul>
<li>VPC with public and private subnets</li>

<li>Security groups for web, app, and database tiers</li>

<li>Application Load Balancers</li>

<li>Auto Scaling Groups with Launch Templates</li>

<li>RDS database in private subnet</li>
</ul>
<br>
<h3>⚙️ Phase 2: Ansible Configuration for Web Tier (Coming Soon – End July)</h3>
<h4>Automating server provisioning and web app configuration with Ansible</h4>

Planned features:
<ul>
<li>Install necessary packages</li>

<li>Deploy sample web app</li>

<li>Configure Nginx/Apache, systemd services, firewall</li>
</ul>

Status: Learning Ansible in progress
<br>
<br>
<h3>🛠️ Phase 3: CI/CD Pipeline Integration (Coming Soon – End August)</h3>
<h4>Implementing CI/CD pipeline with GitHub Actions</h4>

Planned features:
<ul>
<li>terraform fmt, validate, plan, apply on PR/merge</li>

<li>Secrets management with GitHub Actions</li>

<li>Approval gates before production apply</li>
</ul>

Status: Planning phase
<br>
<br>
<h3>📊 Phase 4: Monitoring, Metrics, and Logging (Planned)</h3>
<h4>Setting up monitoring and observability to ensure application health and performance</h4>

Planned features:
<ul>
<li>Implement metrics collection with Prometheus</li>

<li>Visualize dashboards with Grafana</li>

<li>Centralized logging using Elasticsearch and Kibana</li>

<li>Alerting and notifications on key events and thresholds</li>
</ul>

Status: Planning phase
<br>
<br>

-------------------------------------------------------------------------------------------------
<h3>✅ Phase 1: Infrastructure Setup with Terraform (Completed) </h3>

<h4>📋 Prerequisites</h4>

Make sure you have the following:

- ✅ [Terraform](https://www.terraform.io/downloads.html) installed
- ✅ AWS credentials configured via environment variables or AWS CLI
- ✅ [Git](https://git-scm.com/downloads) installed
<br>
<h4>✨ Features</h4>

- **High Availability** – Designed with public/private subnets across AZs.
- **Scalability** – Auto Scaling Groups for web and app layers.
- **Security** – Isolated layers with Security Groups and private subnets.
<br>
<h4>🌐 Web Tier</h4>

The Web Tier is the **entry point** for incoming user traffic.
- **Application Load Balancer** – Routes traffic to healthy web servers.
- **Launch Template** – Defines EC2 instance configuration.
- **Auto Scaling Group** – Maintains desired instance count.
- **Security Groups** – Controls web access (e.g., HTTP).
<br>
<h4>🚀 Application Tier</h4>

The Application Tier **processes business logic** and interacts with the database.
- **Application Load Balancer** – Private ALB within VPC.
- **Launch Template** – Configuration for app EC2 instances.
- **Auto Scaling Group** – Based on app metrics.
- **Security Groups** – Allow traffic only from Web Tier.
<br>
<h4>💽 Database Tier</h4>

The Database Tier manages **persistent storage** using Amazon RDS.

- **Amazon RDS (MySQL/PostgreSQL)** – Fully managed DB service.
- **DB Subnet Group** – Places DB in private subnets.
- **Security Groups** – Access limited to App Tier only.
<br>
<h3>👨‍💻 Author: Evangel </h3>
<br>
<h3>📄 License </h3>
This project is licensed under the MIT License.
