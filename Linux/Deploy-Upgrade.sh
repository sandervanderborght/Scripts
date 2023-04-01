#!/bin/bash

#-------------------------------
# 
# sources:
# based on https://github.com/amidaware/community-scripts/blob/main/scripts_staging/linux_os_update.sh
# 
#-------------------------------

if [[ `which yum` ]]; then
   yum -y upgrade
elif [[ `which apt` ]]; then
   apt-get -y update
   apt-get -y dist-upgrade
elif [[ `which pacman` ]]; then
   pacman -Syu
elif [[ `which zypper` ]]; then
   zypper update
else
   echo "Unknown Platform"
fi
