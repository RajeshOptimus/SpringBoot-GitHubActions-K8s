
# SpringBoot-GitHubActions-K8s
Final Project – Docker & Kubernetes Training

## 🧩 Overview

This is a Spring Boot microservice project that demonstrates modern CI/CD and container orchestration practices. The project includes:

- A simple REST API (`/greeting`)
- Dockerized Spring Boot app
- GitHub Actions CI/CD pipeline
- Kubernetes deployment using Minikube
- Automated polling-based redeployment using Task Scheduler and Bash scripting

---

## 📁 Project Structure

```
spring-boot-microservice-GitHubActions
├── src/
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── watch-and-deploy.sh         # Checks Docker image digest and redeploys if updated
├── run-watch-deploy.bat        # Invokes watch-and-deploy.sh via Git Bash
├── deploy-log.txt              # Logs deployment events and pod status
├── .last_digest                # Stores the last deployed Docker image digest
├── Dockerfile
├── pom.xml
└── README.md
```

---

## 🚀 Features

- ✅ REST API at `/greeting`
- ✅ Containerized with Docker
- ✅ Deployed to Kubernetes using `kubectl apply`
- ✅ GitHub Actions CI/CD pipeline for build/test/push
- ✅ Task Scheduler runs every 5 minutes and redeploys only on new image digest
- ✅ Pod restart logic only on image change (optimized!)

---

## 🔧 Prerequisites

- Java 11+
- Maven
- Docker (with Docker Hub account)
- Minikube
- GitHub account
- Git Bash (on Windows)
- Windows Task Scheduler

---

## 🛠️ Setup Instructions

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd spring-boot-microservice-GitHubActions
```

### 2. Build the application

```bash
mvn clean install
```

### 3. Build and push Docker image

```bash
docker build -t rajeshrajatv/springboot-githubactions-k8s:latest .
docker push rajeshrajatv/springboot-githubactions-k8s:latest
```

> Replace `rajeshrajatv` with your Docker Hub username if different.

---

### 4. Deploy to Minikube

Start Minikube:

```bash
minikube start --driver=docker
```

Deploy:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

---

### 5. Run Watch-and-Deploy Script via Task Scheduler

1. Create a `.bat` file (`run-watch-deploy.bat`) that calls Git Bash to run `watch-and-deploy.sh`.
2. Register a Task Scheduler job that:
   - Runs every 5 minutes
   - Calls `run-watch-deploy.bat`
   - Runs under your user account with highest privileges
3. Script checks Docker image digest from Docker Hub and redeploys if it changed

---

## 🌐 Access the Application

Get service URL:

```bash
minikube service greeting-service --url
```

Visit:

```
http://<minikube-ip>:<node-port>/greeting
```

Example:

```
http://192.168.49.2:30213/greeting
```

---

## 🔁 CI/CD Workflow

Your GitHub Actions workflow is defined at:

```
.github/workflows/ci-cd.yml
```

It performs:
- ✅ Code checkout
- ✅ Maven build + test
- ✅ Docker image build
- ✅ Docker image push to Docker Hub

---

## 📋 Logs

- All actions from `watch-and-deploy.sh` are logged to:
  ```
  C:\Users\rajes\deploy-log.txt
  ```
- Last deployed digest is stored in:
  ```
  C:\Users\rajes\.last_digest
  ```
  
## 🙌 Acknowledgments
Thanks to Docker, Kubernetes, and GitHub Actions for making full-stack CI/CD automation approachable and powerful.
This is test message