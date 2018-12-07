#!/usr/bin/env bash
# Copy grafana secrets configuration to common secrets files upon each container startup
sudo cp /etc/appliance-setup-framework/conf/grafana.secrets.ccf-conf.jsonnet $HOME/.ccf/secrets/grafana.secrets.ccf-conf.jsonnet
# Create datasources directory
sudo mkdir -p "etc/provisioning/datasources"
