#!/bin/bash

# Variables
IMAGE_NAME="rajeshrajatv/springboot-githubactions-k8s"
IMAGE_TAG="latest"

echo "Starting Minikube with Docker driver..."
minikube start --driver=docker

echo "Substituting variables in deployment template..."
export IMAGE_NAME
export IMAGE_TAG
envsubst < k8s/deployment.yaml.template > k8s/deployment.yaml

echo "Creating Persistent Volume and Claim..."
kubectl apply -f k8s/persistent-volume.yaml      # Only for Minikube
kubectl apply -f k8s/persistent-volume-claim.yaml

echo "Deploying to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Accessing service..."
minikube service greeting-service
echo "✅ Deployment complete. You can access the service via the Minikube URL."
