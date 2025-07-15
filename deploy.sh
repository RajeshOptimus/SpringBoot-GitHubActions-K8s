#!/bin/bash

echo "🚀 Starting Minikube with Docker driver..."
minikube start --driver=docker

echo "📦 Creating Persistent Volume and Claim..."
kubectl apply -f k8s/persistent-volume.yaml
kubectl apply -f k8s/persistent-volume-claim.yaml

echo "📤 Deploying application to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "🔄 Rolling out deployment..."
kubectl rollout restart deployment greeting-deployment

echo "🌐 Accessing service via Minikube..."
minikube service greeting-service

echo "✅ Deployment complete. Service is up and running!"
