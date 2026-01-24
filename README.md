# 🚀 FastAPI K8s Optimization Lab

![Python](https://img.shields.io/badge/Python-3.11-3776AB?style=for-the-badge&logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-0.104.1-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-K3s-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)

A production-grade microservice architecture showcasing the deployment of a FastAPI application using **Docker Compose** for local development and **K3s (Kubernetes)** for bare-metal production environments.

## 🌟 Key Features

* **Optimized Docker Build:** Implements a **Multi-stage build** to reduce image size and ensure a clean runtime environment.
* **Security First:** Runs under a non-root user (`random_user`) to enforce the principle of least privilege.
* **Kubernetes Ready:** Full manifest configuration including **Deployments** (with Liveness/Readiness probes) and **LoadBalancer Services**.
* **High Availability:** Configured for 3 replicas to ensure zero downtime and load distribution.
* **Health Monitoring:** Integrated `/health` endpoint and Docker `HEALTHCHECK` for automated recovery.

---

## 🛠 Tech Stack

* **Backend:** FastAPI (Python 3.11)
* **Server:** Uvicorn (ASGI)
* **Containerization:** Docker & Docker Compose
* **Orchestration:** K3s (Lightweight Kubernetes) on Ubuntu
* **Infrastructure:** Tested on Bare-metal (USB Live Persistence)

---

## 📦 Project Structure

```text
├── main.py              # FastAPI Application entry point
├── requirements.txt     # Python dependencies
├── Dockerfile           # Optimized Multi-stage Dockerfile
├── docker-compose.yml   # Local orchestration setup
├── deployment.yml       # Kubernetes Deployment (3 Replicas + Probes)
├── service.yml          # Kubernetes Service (LoadBalancer)
└── .env.example         # Environment variables template

---

## 🚀 Installation & Setup

### 1. Local Development (Docker Compose)
To spin up the environment locally with resource limits and logging:

Clone the repository
git clone git@github.com:R-Kx/container-orchestration-lab.git

Start the services
docker-compose up -d --build
Access the API at: http://localhost:6767

---

## 2. Production Deployment (Kubernetes / K3s)

Deploying to a bare-metal Kubernetes cluster:
Bash

Apply the Deployment manifest
kubectl apply -f deployment.yml

Apply the Service manifest
kubectl apply -f service.yml

## Accessing the Service: 

Since this is a bare-metal environment using K3s LoadBalancer, the service will be exposed on the node's IP address.

    . Check Service Status: kubectl get svc fastapi-service

    . URL: http://<YOUR-NODE-IP>:67

## 🛡️ Security & Optimization Details

    . Base Image: Uses python:3.11-slim to minimize vulnerability footprint.

    . User Permissions: The Dockerfile creates a specific user (random_user) to avoid running the application as root.

    . Resource Limits: Both Docker Compose and Kubernetes manifests define CPU and Memory limits (256MB RAM) to prevent resource exhaustion.

    # Probes:

        Liveness Probe: Restarts the container if the application becomes unresponsive.

        Readiness Probe: Ensures traffic is only sent to the pod when it is fully ready to accept connections.

📝 Author

 GitHub:@R-Kx
