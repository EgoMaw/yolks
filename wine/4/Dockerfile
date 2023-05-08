# ----------------------------------
# Generic Wine 6 image
# ----------------------------------
FROM    ghcr.io/egomaw/yolks:debian

LABEL   author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

## install required packages
RUN     dpkg --add-architecture i386 \
        && apt-get update -y \
        && apt-get install -y --no-install-recommends gnupg2 software-properties-common libntlm0 winbind xvfb xauth python3 libncurses5:i386 libncurses6:i386

# Install winehq-stable and with recommends
RUN     wget -nc https://dl.winehq.org/wine-builds/winehq.key \
        && apt-get-key add winehq.key \
        && echo "deb https://dl.winehq.org/wine-builds/debian/ bullseye main" >> /etc/apt-get/sources.list \
        && wget -O- -q download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_11/Release.key | apt-get-key add - \
        && echo "deb http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_11 ./" | tee /etc/apt-get/sources.list.d/wine-obs.list \
        && apt-get update \
        && apt-get install -y --install-recommends winehq-stable=4.0.4~bullseye wine-stable=4.0.4~bullseye wine-stable-amd64=4.0.4~bullseye wine-stable-i386=4.0.4~bullseye cabextract xvfb gettext-base

# Set up Winetricks
RUN	wget -q -O /usr/sbin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
        && chmod +x /usr/sbin/winetricks

ENV     HOME=/home/container
ENV     WINEPREFIX=/home/container/.wine
ENV     WINEDLLOVERRIDES="mscoree,mshtml="
ENV     DISPLAY=:0
ENV     DISPLAY_WIDTH=1024
ENV     DISPLAY_HEIGHT=768
ENV     DISPLAY_DEPTH=16
ENV     AUTO_UPDATE=1
ENV     XVFB=1

USER    container
WORKDIR	/home/container

COPY    ./../entrypoint.sh /entrypoint.sh
CMD	["/bin/bash", "/entrypoint.sh"]
