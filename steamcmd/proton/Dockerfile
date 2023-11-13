# ---------------------------------------------
# Steam Proton image
# ---------------------------------------------
FROM        debian:bookworm-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

## install required packages
RUN         dpkg --add-architecture i386
RUN         apt-get update
RUN         apt-get install -y --no-install-recommends wget iproute2 gnupg2 software-properties-common libntlm0 winbind xvfb xauth libncurses5-dev:i386 libncurses6 dbus libgdiplus lib32gcc-s1
RUN         apt-get install -y --no-install-recommends alsa-tools libpulse0 pulseaudio libpulse-dev libasound2 libao-common gnutls-bin gnupg locales numactl cabextract curl python3 python3-pip python3-setuptools jq gettext-base
RUN         useradd -d /home/container -m container

# Download Proton GE
RUN         curl -sSL -o "proton.tar.gz" "$(curl -sSL https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | jq -r '.assets[] | select(.browser_download_url | endswith(".tar.gz")) | .browser_download_url')"
RUN         tar -xzf proton.tar.gz -C /usr/local/bin/ --strip-components=1
RUN         rm proton.tar.gz

# Proton Fix machine-id
RUN         rm -f /etc/machine-id
RUN         dbus-uuidgen --ensure=/etc/machine-id
RUN         rm /var/lib/dbus/machine-id
RUN         dbus-uuidgen --ensure

#Setup Protontricks
RUN         python3 -m pip install protontricks

# Set up Winetricks
RUN	        wget -q -O /usr/sbin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
            && chmod +x /usr/sbin/winetricks

## install rcon
RUN     	cd /tmp/ \
            && version=$(curl -s https://api.github.com/repos/gorcon/rcon-cli/releases/latest | jq -r '.tag_name' | cut -c 2-) \
            && curl -sSL https://github.com/gorcon/rcon-cli/releases/download/v${version}/rcon-${version}-amd64_linux.tar.gz -o rcon.tar.gz \
            && tar xvf rcon.tar.gz && rm rcon.tar.gz \
            && mv rcon-${version}-amd64_linux/rcon /usr/local/bin/

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
