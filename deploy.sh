#!/bin/bash

echo "Starting Minikube with VirtualBox driver..."
minikube start --driver=docker

echo "Deploying to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Accessing service..."
minikube service greeting-service
