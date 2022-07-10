#!/bin/bash
#-----------------------------
# 
# 
# Checks if a reboot is required after updating
# 
# Sources: 
# Hmm...I'm missing something here
# 
#------------------------------


if [ -f /var/run/reboot-required ]; then
  echo 'reboot required'
  exit 1
fi
