#!/bin/bash
cd /home/container

# Setup tty width so wine console output doesn't prematurely wrap
stty columns 250

# Information output
echo "Running on Debian $(cat /etc/debian_version)"
echo "Current timezone: $(cat /etc/timezone)"
wine --version

# Make internal Docker IP address available to processes.
export INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')

## just in case someone removed the defaults.
if [ "${STEAM_USER}" == "" ]; then
        echo -e "steam user is not set.\n"
        echo -e "Using anonymous user.\n"
        STEAM_USER=anonymous
        STEAM_PASS=""
        STEAM_AUTH=""
else
        echo -e "user set to ${STEAM_USER}"
fi

## if auto_update is not set or to 1 update
if [[ -z "${AUTO_UPDATE}"  ||  "${AUTO_UPDATE}" == "1" ]]; then
    # Update Source Server
    if [[ -n "${SRCDS_APPID}" ]]; then
	    if [[ "${STEAM_USER}" == "anonymous" ]]; then
            ./steamcmd/steamcmd.sh +force_install_dir /home/container +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ "${WINDOWS_INSTALL}" == "1" ]] && printf %s '+@sSteamCmdForcePlatformType windows' ) +app_update ${SRCDS_APPID} $( [[ -z ${SRCDS_BETAID} ]] || printf %s "-beta ${SRCDS_BETAID}" ) $( [[ -z ${SRCDS_BETAPASS} ]] || printf %s "-betapassword ${SRCDS_BETAPASS}" ) $( [[ -z ${HLDS_GAME} ]] || printf %s "+app_set_config 90 mod ${HLDS_GAME}" ) $( [[ -z ${VALIDATE} ]] || printf %s "validate" ) +quit
	    else
            numactl --physcpubind=+0 ./steamcmd/steamcmd.sh +force_install_dir /home/container +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ "${WINDOWS_INSTALL}" == "1" ]] && printf %s '+@sSteamCmdForcePlatformType windows' ) +app_update ${SRCDS_APPID} $( [[ -z ${SRCDS_BETAID} ]] || printf %s "-beta ${SRCDS_BETAID}" ) $( [[ -z ${SRCDS_BETAPASS} ]] || printf %s "-betapassword ${SRCDS_BETAPASS}" ) $( [[ -z ${HLDS_GAME} ]] || printf %s "+app_set_config 90 mod ${HLDS_GAME}" ) $( [[ -z ${VALIDATE} ]] || printf %s "validate" ) +quit
	    fi
    else
        echo -e "No appid set. Starting Server"
    fi

else
        echo -e "Not updating game server as auto update was set to 0. Starting Server"
fi

if [[ $XVFB == 1 ]]; then
        Xvfb :0 -screen 0 "${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x${DISPLAY_DEPTH}" &
fi

# Install necessary to run packages
echo "First launch will throw some errors. Ignore them"

mkdir -p "$WINEPREFIX"

# Check if wine-gecko required and install it if so
if [[ $WINETRICKS_RUN =~ gecko ]]; then
        echo "Installing Gecko"
        WINETRICKS_RUN=${WINETRICKS_RUN/gecko}

        if [ ! -f "$WINEPREFIX/gecko_x86.msi" ]; then
                wget -q -O "$WINEPREFIX/gecko_x86.msi" http://dl.winehq.org/wine/wine-gecko/2.47.4/wine_gecko-2.47.4-x86.msi
        fi

        if [ ! -f "$WINEPREFIX/gecko_x86_64.msi" ]; then
                wget -q -O "$WINEPREFIX/gecko_x86_64.msi" http://dl.winehq.org/wine/wine-gecko/2.47.4/wine_gecko-2.47.4-x86_64.msi
        fi

        wine msiexec /i "$WINEPREFIX/gecko_x86.msi" /qn /quiet /norestart /log "$WINEPREFIX/gecko_x86_install.log"
        wine msiexec /i "$WINEPREFIX/gecko_x86_64.msi" /qn /quiet /norestart /log "$WINEPREFIX/gecko_x86_64_install.log"
fi

# Check if wine-mono required and install it if so
if [[ $WINETRICKS_RUN =~ mono ]]; then
        echo "Installing mono"
        WINETRICKS_RUN=${WINETRICKS_RUN/mono}

        if [ ! -f "$WINEPREFIX/mono.msi" ]; then
                wget -q -O "$WINEPREFIX/mono.msi" https://dl.winehq.org/wine/wine-mono/7.4.0/wine-mono-7.4.0-x86.msi
        fi

        wine msiexec /i "$WINEPREFIX/mono.msi" /qn /quiet /norestart /log "$WINEPREFIX/mono_install.log"
fi

# List and install other packages
for trick in $WINETRICKS_RUN; do
        echo "Installing $trick"
        winetricks -q "$trick"
done

# Run Preflight Script
if [ -n "$PRE_STARTUP_SCRIPT" ]; then
PRE_STARTUP_SCRIPT=$(echo "${PRE_STARTUP_SCRIPT}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

printf "\033[1;31mcontainer@pterodactyl~\033[0m Running Preflight Script...\n"
eval "${PRE_STARTUP_SCRIPT}"
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | envsubst)
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
