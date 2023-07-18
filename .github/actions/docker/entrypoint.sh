#!/bin/bash

GITHUB_PUSH_SECRET=$1
DOCKER_IMAGE)NAME=$2
DOCKER_IMAFE_TAG=$3
DOCKERFILE_PATH=$4
BUILD_CONTEXT=$5
BUILD_ONLY=$6

#login to GHCR
echo $GITHUB_PUSH_SECRET | docker login ghcr.io -u $GITHUB_ACTOR --password-stdin

# Gitub_repository is the name of the repository in the format owner/repo-name
GITHUB_OWNER=$(echo $GITHUB_REPOSITORY | cut -d'/' -f1)

# Set up full image with tag
IMAGE_ID=ghcr.io/$GITHUB_OWNER/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG
IMAGE_ID=$(echo $IMAGE_ID | tr '[:upper:]' '[:lower:]')

# Build the image
echo build -t $IMAGE_ID -f $DOCKERFILE_PATH $BUILD_CONTEXT
docker build -t $IMAGE_ID -f $DOCKERFILE_PATH $BUILD_CONTEXT

# Push the image
if [ "$BUILD_ONLY" != "true" ]; then
  echo "skipping push"

else
  echo docker push $IMAGE_ID
  docker push $IMAGE_ID
fi
