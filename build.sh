#!/bin/bash

# The first command builds the full Arm NN SDK, a very large task and a 1 time procedure
# It's commented out here to save time, but refer to the Dockerfile and the
# build-armnn.sh script for details 

# Replace the Docker ID in the image tag and make sure to use docker login

# Each command builds a stage in the Dockerfile using the --target

# Base image derived from Ubuntu 18.04 used for all images
docker build --target base -t jasonrandrews/ubuntu-arm-base -f Dockerfile .

# Full Arm NN SDK build
docker build --target sdk -t jasonrandrews/armnn-sdk -f Dockerfile .

# Builds the deverloper image used to create a software application with Arm NN
docker build --target dev -t jasonrandrews/armnn-dev -f Dockerfile .

# Build the release image used to run the application without the source code
docker build --target rel -t jasonrandrews/armnn-rel -f Dockerfile .
