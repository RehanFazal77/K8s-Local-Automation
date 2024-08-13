#!/bin/bash

# Step 1: Create Kind Cluster
echo "Creating Kind Cluster..."
kind create cluster
if [ $? -ne 0 ]; then
  echo "Failed to create Kind cluster. Exiting."
  exit 1
fi

echo "Waiting for the cluster to be ready..."
sleep 20  # Adjust the sleep time if needed

# Step 2: Deploy Nginx Pod
echo "Deploying Nginx Pod..."
kubectl run nginx-pod --image=nginx --restart=Never --port=80 -n default
if [ $? -ne 0 ]; then
  echo "Failed to deploy Nginx Pod. Exiting."
  exit 1
fi

# Step 3: Wait for the Nginx Pod to be Running
echo "Waiting for Nginx Pod to be in 'Running' state..."
kubectl wait --for=condition=Ready pod/nginx-pod -n default --timeout=60s
if [ $? -ne 0 ]; then
  echo "Nginx Pod did not reach 'Running' state. Exiting."
  exit 1
fi

# Step 4: Expose the Nginx Pod
echo "Exposing Nginx Pod as a service..."
kubectl expose pod nginx-pod --type=NodePort --port=80 --name=nginx-service -n default
if [ $? -ne 0 ]; then
  echo "Failed to expose Nginx Pod. Exiting."
  exit 1
fi

# Step 5: Port Forward to Access the Service
echo "Setting up port forwarding to access the service..."
kubectl port-forward svc/nginx-service 8080:80 -n default &
if [ $? -ne 0 ]; then
  echo "Failed to set up port forwarding. Exiting."
  exit 1
fi

# Step 6: Display the URL to Access the Service
echo "Access the Nginx service at http://localhost:8080"

