#!/bin/bash

echo "************************************"
echo " Display parameter"
echo "************************************"
echo ""
echo "Parameter count : $@"
echo "Parameter zero 'name of the script': $0"
echo "---------------------------------"
echo "Image name                         : $1"
echo "---------------------------------"
echo ""

# **************** Global variables
#export IMAGE_NAME=$1
export IMAGE_NAME='localhost/node-red-custom-starter:v1'
export CONTAINER_NAME='node-red-verification'
export LOCAL_CLOUNANT_URL=YOUR_URL
export LOCAL_NODE_RED_USERNAME="appdomain"
export LOCAL_NODE_RED_PASSWORD="3edC.vfr4"

# **********************************************************************************
# Execution
# **********************************************************************************

cd ..
export ROOT_PATH=$(PWD)
echo "Path: $ROOT_PATH"

echo "************************************"
echo " Clean up container if needed"
echo "************************************"
podman container rm -f "$CONTAINER_NAME"
podman image rm -f "$IMAGE_NAME"

pwd
#podman login quay.io
podman build  --file Dockerfile . --tag "$IMAGE_NAME"


# Run the container
podman run --name="$CONTAINER_NAME" \
           -it \
           --env CLOUDANT_URL=${LOCAL_CLOUNANT_URL} \
           --env NODE_RED_USERNAME=${LOCAL_NODE_RED_USERNAME} \
           --env NODE_RED_PASSWORD=${LOCAL_NODE_RED_PASSWORD} \
           -p 3000:3000/tcp \
           "$IMAGE_NAME"

                      


