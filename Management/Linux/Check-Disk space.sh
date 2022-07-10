#!/bin/bash
#---------------------------------------
# Checks Disk space usage on Linux
# 
# 
# 
# Sources:
# based on https://github.com/amidaware/community-scripts/blob/main/scripts_staging/linux_disk_check.sh
# 
# 
# 
#---------------------------------------

output=$(df -h | sed 1d | grep -vE '^Filesystem|tmpfs|cdrom|udev' | awk '{ print $5 " " $6 }')

IFS=$'\n'
for disk in $output; do
    usep=$(echo "${disk}" | awk '{ print $1 }' | cut -d'%' -f1) 
    partition=$(echo "${disk}" | awk '{ print $2 }')
    if [ ${partition} == '/' ]; then
        if [ ${usep} -ge 95 ]; then
            echo "Running out of space $partition ${usep}%"
            exit 1
        else
            echo "${partition} Disk space is fine at ${usep}%"
            exit 0
        fi
    fi
done
