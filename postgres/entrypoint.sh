#!/bin/ash
cd /home/container

#output current postgres version
postgres --version

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')

# Replace Startup Variables
PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | envsubst)
printf "\033[1;33mcontainer@pterodactyl~ \033[0m%s\n" "${PARSED}"

# Run the Server
eval "${MODIFIED_STARTUP}"
