#!/bin/bash

IMAGE_NAME="rajeshrajatv/springboot-githubactions-k8s"
LAST_DIGEST_FILE=".last_digest"

echo "Checking for image update..."

# Get latest image digest from Docker Hub
NEW_DIGEST=$(docker pull $IMAGE_NAME:latest --quiet 2>/dev/null | tail -1)

# Load the last digest
if [[ -f "$LAST_DIGEST_FILE" ]]; then
  LAST_DIGEST=$(cat $LAST_DIGEST_FILE)
else
  LAST_DIGEST=""
fi

# Compare and deploy if updated
if [[ "$NEW_DIGEST" != "$LAST_DIGEST" ]]; then
  echo "New image detected. Triggering deploy.sh..."
  echo "$NEW_DIGEST" > $LAST_DIGEST_FILE
  ./deploy.sh
else
  echo "No update. Current image is up to date."
fi
