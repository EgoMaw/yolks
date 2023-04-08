#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')

# Prevent git terminal prompts if .git exists
if [ -d /home/container/.git ]; then
    export GIT_TERMINAL_PROMPT=0
fi

# Run Preflight Script
if [ -n "$PRE_STARTUP_SCRIPT" ]; then
PRE_STARTUP_SCRIPT=$(echo "${PRE_STARTUP_SCRIPT}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | envsubst)
printf "\033[1;31mcontainer@pterodactyl~\033[0m Running Preflight Script...\n"
printf "%s\n" "$PRE_STARTUP_SCRIPT" > preflight.sh
# shellcheck source=/dev/null
source ./preflight.sh
echo -e " "
fi

# Print Node.js Version
printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0mnode -v\n"
node -v

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | envsubst)

echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
