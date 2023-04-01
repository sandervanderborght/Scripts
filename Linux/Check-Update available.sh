#!/bin/bash

#--------------------------------------------
# 
# 
# sources: 
# Hmmm...I'm missing something here
# 
# 
# 
#--------------------------------------------


if [[ `which yum` ]]; then
   count=$(yum check-updates | awk 'p;/^$/{p=1}' | grep -c "\.")
elif [[ `which apt` ]]; then
   count=$(apt-get dist-upgrade -s --quiet=2 | grep ^Inst | wc -l)
elif [[ `which pacman` ]]; then
   echo "check not implemented"
elif [[ `which zypper` ]]; then
   echo "check not implemented"
else
   echo "Unknown Platform"
fi

if [[ $count -eq 0 ]]; then
  echo 'no update available'
  exit 0
else
  echo 'update available'
  exit 1
fi
