FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/egomaw/yolks:debian

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update -y \
            && apt upgrade -y \
            && apt install -y --no-install-recommends apt-transport-https wget curl iproute2 libgdiplus gettext-base \
            && wget https://dot.net/v1/dotnet-install.sh \
            && D_V="$(curl -sSL https://dotnet.microsoft.com/en-us/download/dotnet/3.1 | grep -i  '<h3 id="sdk-3.*">SDK 3.1.*</h3>'  | head -1 | awk -F\" '{print $3}' | awk '{print $2;}' | sed 's/<\/h3>//g')" \
            && chmod +x dotnet-install.sh \
			&& ./dotnet-install.sh -i /usr/share -v $D_V \
            && ln -s /usr/share/dotnet /usr/bin/dotnet


USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
