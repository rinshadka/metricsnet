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


# After setup is completed, reboot the server:

`sudo reboot`
