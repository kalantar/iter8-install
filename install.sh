#!/bin/bash

set -e

# Step 0: Export TAG
export TAG="${TAG:-v0.3.0}"

# Step 1: Install Iter8
echo "Installing Iter8"
kubectl apply -f https://raw.githubusercontent.com/iter8-tools/iter8-install/${TAG}/core/build.yaml

# Step 2: Install stacks
# By default, all are installed. 
# To install a single stack or a subset of the stacks, use kustomize
kubectl apply -f https://raw.githubusercontent.com/iter8-tools/iter8-install/${TAG}/stacks/build.yaml

echo "Verifying Iter8 installation"
kubectl wait --for condition=ready --timeout=300s pods --all -n iter8-system

set +e
