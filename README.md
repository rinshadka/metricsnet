# Prerequisites:

    Ubuntu 18.04+ LTS server
    user with sudo privileges


# Install basic utilities:

`sudo apt update && sudo apt install net-tools curl -y`


# Run bootstrap

sudo curl https://raw.githubusercontent.com/rinshadka/metricsnet/master/bootstrap.sh | bash

After bootstrap.sh is complete, exit the shell.


# Change values inside configuration directory as needed:

`cd /etc/appliance-setup-framework/conf`


# Install the appliance:

`cd /etc/appliance-setup-framework`

`bash bin/setup.sh`

# Setup temporary firewall rule for access from docker network:

`sudo ufw allow in on `echo br-$(docker network ls -f name=appliance | awk '{if (NR!=1) {print}}' | awk '{print $1}')` to any port 9100`

`sudo ufw allow in on `echo br-$(docker network ls -f name=appliance | awk '{if (NR!=1) {print}}' | awk '{print $1}')` to any port 8010`

# After setup is completed, reboot the server:

`sudo reboot`
