#!/bin/bash
set -e
systemctl enable kubeadm kubectl-proxy

sed -e "/cadvisor-port=0/d" -i /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl restart kubelet

# Pre pull  images
docker pull nicholasjackson/consul:9587-b2c831b
docker pull hashicorp/consul-k8s:0.6.0

docker pull prom/prometheus:v2.6.0
docker pull grafana/grafana:6.0.0-beta3
docker pull prom/statsd-exporter:latest
docker pull k8s.gcr.io/metrics-server-amd64:v0.3.1