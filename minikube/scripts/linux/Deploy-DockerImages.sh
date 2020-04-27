#!/bin/sh
echo "Deploying Docker images to Minikube..."

# ENV vars
kubectl apply -f ../../config/configmap-env-var.yaml

# modules
kubectl apply -f ../../config/postgres.yaml
kubectl apply -f ../../config/rabbitmq.yaml
kubectl apply -f ../../config/backend.yaml
kubectl apply -f ../../config/frontend.yaml
kubectl apply -f ../../config/packet-writer.yaml
kubectl apply -f ../../config/data-collectors.yaml
kubectl apply -f ../../config/engine-analyzer.yaml
kubectl apply -f ../../config/engine-bruteforcer.yaml

# CronJobs
kubectl kustomize ../../config/cronjob/ | kubectl apply -f -