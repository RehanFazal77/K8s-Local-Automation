# Kubernetes Nginx Deployment with Kind

This project provides a simple script to automate the deployment of an Nginx pod in a Kubernetes cluster using Kind. 
The script sets up a local Kubernetes cluster, deploys an Nginx pod, exposes it as a service, and sets up port forwarding for easy access.

**Prerequisites**
Before running the script, ensure that you have the following installed on your machine:

1. **Docker**
2. **Kind**
3. **kubectl**


Getting Started<br/>
Step 1: Clone the Repository<br/>
  Clone this repository to your local machine:<br/>
  git clone https://github.com/RehanFazal77/K8s-Local-Automation.git <br/>
  cd kubernetes-nginx-kind<br/>

Step 2: Run the Deployment Script
Make the deployment script executable and run it:<br/>
chmod +x deploy_nginx.sh<br/>
./deploy_nginx.sh<br/>

# Script Overview<br/>
The script automates the following steps:
**Create Kind Cluster:** <br/>
The script creates a local Kubernetes cluster using Kind.<br/>
It waits for the cluster to be ready before proceeding to the next steps.<br/>

**Deploy Nginx Pod:** <br/>
An Nginx pod is deployed in the default namespace.<br/>
The script checks if the deployment is successful.<br/>
Wait for the Nginx Pod to be Running:<br/>
The script waits for the Nginx pod to reach the Running state before proceeding.<br/>

Expose the Nginx Pod:<br/>
The Nginx pod is exposed as a service using NodePort type.<br/>
The service is named nginx-service.<br/>
Port Forward to Access the Service:<br/>

Port forwarding is set up to access the Nginx service on http://localhost:8080.<br/>
Display the URL to Access the Service:<br/>
The script provides the URL where the Nginx service can be accessed locally.<br/>
Accessing the Nginx Service<br/>
Once the script completes successfully, you can access the Nginx service by navigating to:<br/>

http://localhost:8080

# Troubleshooting
If you encounter any issues, make sure that:<br/>
Docker is running on your machine.<br/>
The Kind cluster was created successfully.<br/>
The Nginx pod is in the Running state.<br/>
Port 8080 is not being used by another service on your machine.<br/>

# Cleanup <br/>
To delete the Kind cluster and clean up resources, run:<br/>
 **kind delete cluster**
