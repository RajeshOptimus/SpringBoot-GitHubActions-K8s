#!/bin/bash

LOG_FILE="/c/Users/rajes/deploy-log.txt"
IMAGE_NAME="rajeshrajatv/springboot-githubactions-k8s"
LAST_DIGEST_FILE="/c/Users/rajes/.last_digest"

echo "$(date): Script triggered" >> "$LOG_FILE"

# Pull the latest image and extract digest
DOCKER_OUTPUT=$(docker pull $IMAGE_NAME:latest 2>&1)
echo "$DOCKER_OUTPUT" >> "$LOG_FILE"

NEW_DIGEST=$(echo "$DOCKER_OUTPUT" | grep "Digest:" | awk '{print $2}')
NEW_DIGEST=$(echo "$NEW_DIGEST" | tr -d '\r\n')  # Remove newline

echo "$(date): Pulled digest: $NEW_DIGEST" >> "$LOG_FILE"

# Load previously stored digest
if [[ -f "$LAST_DIGEST_FILE" ]]; then
  LAST_DIGEST=$(cat "$LAST_DIGEST_FILE" | tr -d '\r\n')
else
  LAST_DIGEST=""
fi

# If digest changed, trigger deployment
if [[ "$NEW_DIGEST" != "$LAST_DIGEST" && -n "$NEW_DIGEST" ]]; then
  echo "$(date): New image detected. Deploying..." >> "$LOG_FILE"
  echo "$NEW_DIGEST" > "$LAST_DIGEST_FILE"

  kubectl apply -f "/c/Users/rajes/Desktop/Project/spring-boot-microservice-GitHubActions/k8s/deployment.yaml" >> "$LOG_FILE" 2>&1
  kubectl apply -f "/c/Users/rajes/Desktop/Project/spring-boot-microservice-GitHubActions/k8s/service.yaml" >> "$LOG_FILE" 2>&1
  kubectl rollout restart deployment greeting-deployment >> "$LOG_FILE" 2>&1

  echo "$(date): Redeploy complete." >> "$LOG_FILE"
else
  echo "$(date): No new image. Skipping redeploy." >> "$LOG_FILE"
fi

# Log current pod status
kubectl get pods >> "$LOG_FILE" 2>&1
