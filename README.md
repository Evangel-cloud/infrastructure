<h1>🚀 Project Roadmap</h1>


<h2>✅ Phase 1: Infrastructure Setup with Terraform (Completed) </h2>
<h3>Provisioned AWS infrastructure using Terraform modules:</h3>
<ul>
<li>VPC with public and private subnets</li>

<li>Security groups for web, app, and database tiers</li>

<li>Application Load Balancers</li>

<li>Auto Scaling Groups with Launch Templates</li>

<li>RDS database in private subnet</li>
</ul>

<h2>⚙️ Phase 2: Ansible Configuration for Web Tier (Coming Soon – End July)</h2>
<h3>Automating server provisioning and web app configuration with Ansible</h3>

Planned features:
<ul>
<li>Install necessary packages</li>

<li>Deploy sample web app</li>

<li>Configure Nginx/Apache, systemd services, firewall</li>
</ul>

Status: Learning Ansible in progress


<h2>🛠️ Phase 3: CI/CD Pipeline Integration (Coming Soon – End August)</h2>
<h3>Implementing CI/CD pipeline with GitHub Actions</h3>

Planned features:
<ul>
<li>terraform fmt, validate, plan, apply on PR/merge</li>

<li>Secrets management with GitHub Actions</li>

<li>Approval gates before production apply</li>
</ul>

Status: Planning phase

<h2>📊 Phase 4: Monitoring, Metrics, and Logging (Planned)</h2>
<h3>Setting up monitoring and observability to ensure application health and performance</h3>

Planned features:
<ul>
<li>Implement metrics collection with Prometheus</li>

<li>Visualize dashboards with Grafana</li>

<li>Centralized logging using Elasticsearch and Kibana</li>

<li>Alerting and notifications on key events and thresholds</li>
</ul>

Status: Planning phase
