#!/bin/bash
# Default the TZ environment variable to UTC.
export TZ=${TZ:-UTC}

# Default the DOTNET_ROOT environment variable to /usr/share/dotnet.
export DOTNET_ROOT=${DOTNET_ROOT:-/usr/share/dotnet}

# Make internal Docker IP address available to processes.
export INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')

# Print Java version
printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0mdotnet --list-runtimes\n"
dotnet --list-runtimes

if [ -n "$PRE_STARTUP_SCRIPT" ]; then
PRE_STARTUP_SCRIPT=$(echo "${PRE_STARTUP_SCRIPT}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | envsubst)
printf "\033[1;31mcontainer@pterodactyl~\033[0m Running Preflight Script...\n"
printf "%s\n" "$PRE_STARTUP_SCRIPT" > preflight.sh
# shellcheck source=/dev/null
chmod a+x ./preflight.sh
./preflight.sh
echo -e " "
fi

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Display the command we're running in the output, and then execute it with the env
# from the container itself.
printf ":/home/container$ ${PARSED}"
# shellcheck disable=SC2086
eval ${PARSED}
