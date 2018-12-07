#!/usr/bin/env bash
title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

export METRICS_HOME=/etc/metrics
title "Download MetricsNet file into $METRICS_HOME"
sudo git clone --recurse https://github.com/rinshadka/metricsnet $METRICS_HOME

export ASF_HOME=/etc/appliance-setup-framework
sudo curl https://raw.githubusercontent.com/shah/appliance-setup-framework/master/bin/bootstrap.sh | bash

title "Prepare secrets configuration"
sudo cp $METRICS_HOME/conf/grafana.secrets.ccf-tmpl-conf.jsonnet $ASF_HOME/conf/grafana.secrets.ccf-conf.jsonnet
sudo cp $METRICS_HOME/conf/postgres.secrets.ccf-tmpl-conf.jsonnet $ASF_HOME/conf/postgres.secrets.ccf-conf.jsonnet

title "Prepare CCF container configuration variables"
cat $METRICS_HOME/conf/ccf.container.common.ansible-vars.yml  | sudo tee $ASF_HOME/conf/ccf.container.common.ansible-vars.yml > /dev/null

title "Prepare CCF container Ansible Playbook"
sudo cp $METRICS_HOME/playbook/05_ccf-containers.ansible-playbook.yml $ASF_HOME/playbooks/05_ccf-containers.ansible-playbook.yml

title "Prepare appliance admin user common runtime config / secrets directory"
sudo mkdir -p $HOME/.ccf/etc/ $HOME/.ccf/secrets

title "Prepare CCF container configuration customization files"
sudo  cp $METRICS_HOME/conf/prometheus-sql-agent-exporter.ccf-tmpl-conf.jsonnet $HOME/.ccf/etc/prometheus-sql-agent-exporter.ccf-conf.jsonnet
sudo  cp $METRICS_HOME/conf/prometheus.ccf-tmpl-conf.jsonnet $HOME/.ccf/etc/prometheus.ccf-conf.jsonnet
sudo  cp $METRICS_HOME/conf/sql-agent.ccf-tmpl-conf.jsonnet $HOME/.ccf/etc/sql-agent.ccf-conf.jsonnet
