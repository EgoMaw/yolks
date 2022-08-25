#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')

# Print Node.js Version
printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0mnode -v\n"
node -v

# Prevent git terminal prompts if .git exists
if [ -d /home/container/.git ]; then
    export GIT_TERMINAL_PROMPT=0
fi

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)" | eval echo "$(cat -)")

echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
