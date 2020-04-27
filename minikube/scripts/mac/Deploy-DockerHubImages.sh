#!/bin/sh

echo "Deploying Docker images to Minikube..."

# ENV vars
kubectl apply -f ../../config/configmap-env-var.yaml

# modules
sed -e 's!image: "!image: "rolaguardcommunity/!; s/:community/:latest/; s/imagePullPolicy: "Never"/imagePullPolicy: "Always"/' ../../config/postgres.yaml | kubectl apply -f -
kubectl apply -f ../../config/rabbitmq.yaml
sed -e 's!image: "!image: "rolaguardcommunity/!; s/:community/:latest/; s/imagePullPolicy: "Never"/imagePullPolicy: "Always"/' ../../config/backend.yaml | kubectl apply -f -
sed -e 's!image: "!image: "rolaguardcommunity/!; s/:community/:latest/; s/imagePullPolicy: "Never"/imagePullPolicy: "Always"/' ../../config/frontend.yaml | kubectl apply -f -
sed -e 's!image: "!image: "rolaguardcommunity/!; s/:community/:latest/; s/imagePullPolicy: "Never"/imagePullPolicy: "Always"/' ../../config/data-collectors.yaml | kubectl apply -f -
sed -e 's!image: "!image: "rolaguardcommunity/!; s/:community/:latest/; s/imagePullPolicy: "Never"/imagePullPolicy: "Always"/' ../../config/packet-writer.yaml | kubectl apply -f -
sed -e 's!image: "!image: "rolaguardcommunity/!; s/:community/:latest/; s/imagePullPolicy: "Never"/imagePullPolicy: "Always"/' ../../config/engine-analyzer.yaml | kubectl apply -f -
sed -e 's!image: "!image: "rolaguardcommunity/!; s/:community/:latest/; s/imagePullPolicy: "Never"/imagePullPolicy: "Always"/' ../../config/engine-bruteforcer.yaml | kubectl apply -f -

# CronJobs
kubectl kustomize ../../config/cronjob/ | sed -e 's!image: !image: rolaguardcommunity/!; s/:community/:latest/; s/imagePullPolicy: Never/imagePullPolicy: Always/' | kubectl apply -f -