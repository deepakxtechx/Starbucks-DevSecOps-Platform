# Starbucks Cloud-Native DevSecOps Platform

A production-oriented **DevSecOps implementation** demonstrating secure CI/CD pipelines, container security, Kubernetes orchestration, Infrastructure as Code, observability, and custom domain configuration on AWS.

---
## 🎥 Project Demo

▶️ **Implementation Video:**  

---

## 📌 Project Overview

This project implements an **end-to-end DevSecOps workflow** for a cloud-native Starbucks web application.  
It integrates security checks directly into the CI/CD pipeline and deploys the application on **Amazon EKS**, with monitoring, notifications, and DNS-based public access.

---

## 🏗 Architecture Overview

The platform follows a secure, automated, and scalable architecture aligned with industry DevSecOps practices:

- Git-based source control with automated CI triggers  
- Security-enforced CI/CD pipeline  
- Containerized application deployed on Kubernetes  
- AWS infrastructure provisioned using Terraform  
- Centralized monitoring and visualization  
- Custom domain configuration using Amazon Route 53  

📌 **Architecture Diagram:**  
`docs/architecture/starbucks-devsecops-architecture.png`

---

## 🔄 Project Workflow

1. Developer pushes application code to GitHub  
2. GitHub Webhook triggers the Jenkins CI pipeline  
3. Jenkins performs static code analysis using SonarQube  
4. Trivy executes file system vulnerability scanning  
5. Docker image is built from validated source code  
6. Trivy scans the Docker image for vulnerabilities  
7. Secure Docker image is pushed to Docker Hub  
8. Application is deployed to an existing Amazon EKS cluster  
9. Prometheus scrapes application and cluster metrics  
10. Grafana visualizes metrics using dashboards  
11. Jenkins sends pipeline status notifications via Gmail  
12. Users access the application using the custom domain **deepakprojects.me** via Amazon Route 53  

---

## 🧩 Architecture Components

### Source Control & CI Trigger
- GitHub hosts the application source code  
- GitHub Webhooks automatically trigger Jenkins pipelines on code push  

### CI/CD & Security
- Jenkins orchestrates the CI/CD pipeline  
- SonarQube performs static code quality and security analysis  
- Trivy scans both the file system and Docker images for vulnerabilities  
- Security checks are enforced before deployment  

### Containerization & Image Registry
- Docker is used to containerize the application  
- Secure container images are pushed to Docker Hub  

### Infrastructure & Orchestration
- Terraform provisions AWS infrastructure including Amazon EKS  
- Amazon EKS manages containerized workloads  
- Kubernetes handles deployment, scaling, and service exposure  

### Observability & Monitoring
- Prometheus collects application and cluster metrics  
- Grafana provides real-time dashboards for monitoring  

### Notifications
- Jenkins sends CI/CD pipeline status notifications via Gmail (SMTP)  

### DNS & User Access
- Amazon Route 53 manages the custom domain **deepakprojects.me**  
- Users securely access the application using the custom domain  

---

## 🛠 Tech Stack

- **Cloud**: AWS (EKS, Route 53)  
- **Infrastructure as Code**: Terraform  
- **CI/CD**: Jenkins, GitHub Webhooks  
- **Security**: SonarQube, Trivy  
- **Containerization**: Docker, Docker Hub  
- **Orchestration**: Kubernetes (EKS)  
- **Monitoring**: Prometheus, Grafana  
- **Notifications**: Gmail (SMTP)  

---

## 🔐 DevSecOps Highlights

- Security integrated directly into the CI pipeline  
- Static code analysis before image build  
- File system and container image vulnerability scanning  
- Secure image promotion to Kubernetes  
- Infrastructure managed using Infrastructure as Code (IaC)  

---

## 📊 Monitoring & Observability

- Real-time application and Kubernetes cluster metrics  
- Grafana dashboards for visibility into system health  
- Enables proactive monitoring and issue detection  

---

## 🌐 Application Access

- Custom domain configured using **Amazon Route 53**  
- Previously accessible via `https://deepakprojects.me`  
- DNS routing to Kubernetes-hosted application  

---

## 📁 Repository Structure

```text
├── kubernetes/        # Kubernetes manifests
├── monitoring/        # Prometheus & Grafana configurations
├── public/            # Static public assets
├── scripts/           # Automation and helper scripts
├── src/               # Application source code
│   ├── assets/
│   │   ├── font/
│   │   └── img/
│   ├── components/
│   ├── data/
│   └── pages/
├── Jenkinsfile        # CI/CD pipeline definition
├── Dockerfile         # Application container image
└── README.md
```
## 🎯 Key Learnings & Outcomes

- Designed and implemented a secure, automated CI/CD pipeline using Jenkins and GitHub Webhooks  
- Applied DevSecOps best practices by integrating security scans directly into the CI workflow  
- Gained hands-on experience provisioning and managing Kubernetes infrastructure on AWS EKS using Terraform  
- Implemented observability for Kubernetes workloads using Prometheus and Grafana dashboards  
- Configured production-style DNS-based access using Amazon Route 53 for custom domain routing  

