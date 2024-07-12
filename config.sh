#!/bin/bash

source colors.sh

## Función para imprimir mensajes con colores
print_msg() {
  local color=$1
  local msg=$2
  echo -e "${color}${msg}${reset}"
}

kubectl create namespace monitoring
print_msg $blue "Installing/Upgrading Prometheus-alertmanager"
kubectl apply -f 0-configmaps/0-prometheus-alertmanager-config.yaml
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install alertmanager prometheus-community/alertmanager -n monitoring -f 1-helm-values/0-prometheus-alertmanager-values.yaml
print_msg $green "Prometheus applied successfully."