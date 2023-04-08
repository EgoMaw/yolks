#!/bin/bash



# Default the TZ environment variable to UTC.
TZ=${TZ:-UTC}
export TZ

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Switch to the container's working directory
cd /home/container || exit 1

# Prevent git terminal prompts if .git exists
if [ -d /home/container/.git ]; then
    export GIT_TERMINAL_PROMPT=0
fi

# Print Java version
printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0mjava -version\n"
java -version
echo -e " "

# Run Preflight Script
if [ -n "$PRE_STARTUP_SCRIPT" ]; then
PRE_STARTUP_SCRIPT=$(echo "${PRE_STARTUP_SCRIPT}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | envsubst)
printf "\033[1;31mcontainer@pterodactyl~\033[0m Running Preflight Script...\n"
printf "%s\n" "$PRE_STARTUP_SCRIPT" > preflight.sh
# shellcheck source=/dev/null
source preflight.sh
echo -e " "
fi

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

# Display the command we're running in the output, and then execute it with the env
# from the container itself.
printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0m%s\n" "$MODIFIED_STARTUP"

# shellcheck disable=SC2086
eval ${MODIFIED_STARTUP}
