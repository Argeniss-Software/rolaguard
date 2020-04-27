echo "Deploying Docker images to Minikube..."

# ENV vars
kubectl apply -f ../../config/configmap-env-var.yaml

# modules
(Get-Content ../../config/postgres.yaml).replace('image: "', 'image: "rolaguardcommunity/').replace(':community', ':latest').replace('imagePullPolicy: "Never"', 'imagePullPolicy: "Always"') | kubectl apply -f -
kubectl apply -f ../../config/rabbitmq.yaml
(Get-Content ../../config/backend.yaml).replace('image: "', 'image: "rolaguardcommunity/').replace(':community', ':latest').replace('imagePullPolicy: "Never"', 'imagePullPolicy: "Always"') | kubectl apply -f -
(Get-Content ../../config/frontend.yaml).replace('image: "', 'image: "rolaguardcommunity/').replace(':community', ':latest').replace('imagePullPolicy: "Never"', 'imagePullPolicy: "Always"') | kubectl apply -f -
(Get-Content ../../config/data-collectors.yaml).replace('image: "', 'image: "rolaguardcommunity/').replace(':community', ':latest').replace('imagePullPolicy: "Never"', 'imagePullPolicy: "Always"') | kubectl apply -f -
(Get-Content ../../config/packet-writer.yaml).replace('image: "', 'image: "rolaguardcommunity/').replace(':community', ':latest').replace('imagePullPolicy: "Never"', 'imagePullPolicy: "Always"') | kubectl apply -f -
(Get-Content ../../config/engine-analyzer.yaml).replace('image: "', 'image: "rolaguardcommunity/').replace(':community', ':latest').replace('imagePullPolicy: "Never"', 'imagePullPolicy: "Always"') | kubectl apply -f -
(Get-Content ../../config/engine-bruteforcer.yaml).replace('image: "', 'image: "rolaguardcommunity/').replace(':community', ':latest').replace('imagePullPolicy: "Never"', 'imagePullPolicy: "Always"') | kubectl apply -f -

# CronJobs
kubectl kustomize ../../config/cronjob/ | % {$_.replace('image: ', 'image: rolaguardcommunity/').replace(':community', ':latest').replace('imagePullPolicy: Never', 'imagePullPolicy: Always')} | kubectl apply -f -