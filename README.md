# Run bootstrap
`sudo apt update && sudo apt install net-tools curl -y && \
curl https://raw.githubusercontent.com/rinshadka/metricsnet/master/bootstrap.sh | bash`

# Install
`cd /etc/appliance-setup-framework`
`bash bin/setup.sh`

`sudo reboot`
