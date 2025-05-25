#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')

# Prevent git terminal prompts if .git exists
if [ -d /home/container/.git ]; then
    export GIT_TERMINAL_PROMPT=0
fi

# Print bun Version
printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0mbun -v\n"
bun -v

# Run Preflight Script
if [ -n "$PRE_STARTUP_SCRIPT" ]; then
PRE_STARTUP_SCRIPT=$(echo "${PRE_STARTUP_SCRIPT}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

printf "\033[1;31mcontainer@pterodactyl~\033[0m Running Preflight Script...\n"
eval "${PRE_STARTUP_SCRIPT}"
fi

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | envsubst)

printf "\033[1;33mcontainer@pterodactyl~ \033[0m%s\n" "$MODIFIED_STARTUP"

# Run the Server
exec ${MODIFIED_STARTUP}
