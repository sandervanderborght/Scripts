#!/bin/bash

#-----------------------------------
# 
# Script to set autoamtic updates for a Linux device using crontab
# 
# Sources:
# https://www.baeldung.com/linux/create-crontab-script
# https://www.invoke.coffee/automatic-updates-with-debian.html
# https://stackoverflow.com/questions/3788274/need-linux-equivalent-to-windows-echo-date-time-computername
#-----------------------------------

# Set script to execute daily at 23:30
# Removes duplicates
(crontab -l; echo "30 23 * * * /root/update.sh")|awk '!x[$0]++'|crontab -

# Create script
touch /root/update.sh
echo 'echo $(date +"%m/%d/%Y %H:%M:%S Starting update on host: $HOSTNAME")' > /root/update.sh
echo "apt-get update -y > /root/update.log" >> /root/update.sh
echo "apt-get dist-upgrade -y >> /root/update.log" >> /root/update.sh
echo "apt-get autoremove -y >> /root/update.log" >> /root/update.sh

# Make the script executable
chmod +x /root/update.sh
