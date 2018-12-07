#!/usr/bin/env bash
# Copy postgres secrets configuration to common secrets files upon each container startup
sudo cp /etc/appliance-setup-framework/conf/postgres.secrets.ccf-conf.jsonnet $HOME/.ccf/secrets/postgres.secrets.ccf-conf.jsonnet
