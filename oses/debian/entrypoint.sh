#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')

# Run Preflight Script
if [ -n "$PRE_STARTUP_SCRIPT" ]; then
PRE_STARTUP_SCRIPT=$(echo "${PRE_STARTUP_SCRIPT}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

printf "\033[1;31mcontainer@pterodactyl~\033[0m Running Preflight Script...\n"
eval "${PRE_STARTUP_SCRIPT}"
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | envsubst)
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval "$MODIFIED_STARTUP"