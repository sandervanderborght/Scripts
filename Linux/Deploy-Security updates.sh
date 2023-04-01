#!/bin/bash

#-------------------------------
# 
# sources:
# based on https://github.com/amidaware/community-scripts/blob/main/scripts_staging/linux_os_update.sh
# https://serverfault.com/questions/270260/how-do-you-use-apt-get-to-only-install-critical-security-updates-on-ubuntu
# 
#-------------------------------

if [[ `which yum` ]]; then
   echo "Not yet implemented
elif [[ `which apt` ]]; then
   apt-get -y update
   apt-get -y upgrade -o Dir::Etc::SourceList=/etc/apt/security.sources.list
elif [[ `which pacman` ]]; then
   echo "Not yet implemented"
elif [[ `which zypper` ]]; then
   echo "Not yet implemented"
else
   echo "Unknown Platform"
fi
