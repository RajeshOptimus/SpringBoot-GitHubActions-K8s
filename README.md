# SpringBoot-GitHubActions-K8s
Final Project- Docker Training
# Spring Boot Microservice

This project is a Spring Boot microservice that demonstrates the use of containerization and CI/CD practices. It is designed to be deployed in a Kubernetes environment and utilizes GitHub Actions for automated build and deployment processes.

## Project Structure

```
spring-boot-microservice
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── abc
│   │   │           └── microservice
│   │   │               ├── Application.java
│   │   │               └── controller
│   │   │                   └── GreetingController.java
│   │   └── resources
│   │       ├── application.properties
│   │       └── static
│   └── test
│       └── java
│           └── com
│               └── abc
│                   └── microservice
│                       └── ApplicationTests.java
├── .github
│   └── workflows
│       └── ci-cd.yml
├── k8s
│   ├── deployment.yaml
│   └── service.yaml
├── Dockerfile
├── pom.xml
└── README.md
```

## Features

- RESTful API with a `/greeting` endpoint.
- Containerized using Docker.
- Deployable to a Kubernetes cluster.
- CI/CD pipeline configured with GitHub Actions.

## Getting Started

### Prerequisites

- Java 11 or higher
- Maven
- Docker
- Kubernetes cluster (e.g., Minikube, GKE, EKS)
- GitHub account

### Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   cd spring-boot-microservice
   ```

2. Build the application:
   ```
   mvn clean install
   ```

3. Build the Docker image:
   ```
   docker build -t <your-dockerhub-username>/spring-boot-microservice .
   ```

4. Push the Docker image to Docker Hub:
   ```
   docker push <your-dockerhub-username>/spring-boot-microservice
   ```

5. Deploy to Kubernetes:
   ```
   kubectl apply -f k8s/deployment.yaml
   kubectl apply -f k8s/service.yaml
   ```

### Usage

Access the application at `http://<your-kubernetes-service-ip>:<port>/greeting` to receive a greeting message.

### CI/CD

The CI/CD pipeline is defined in `.github/workflows/ci-cd.yml` and will automatically build, test, and deploy the application on every commit to the main branch.

## License

This project is licensed under the MIT License.