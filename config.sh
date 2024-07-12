#!/bin/bash

source colors.sh

## Función para imprimir mensajes con colores
print_msg() {
  local color=$1
  local msg=$2
  echo -e "${color}${msg}${reset}"
}

# Create the monitoring namespace
kubectl create namespace monitoring
kubectl apply -f 2-rules/0-prometheus-rule-test.yaml
# Instalar Prometheus usando Helm
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack -n monitoring -f 1-helm-values/1-prometheus-values.yaml
