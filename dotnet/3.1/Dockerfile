FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/egomaw/yolks:debian

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update -y \
            && apt upgrade -y \
            && apt install -y --no-install-recommends apt-transport-https wget curl iproute2 libgdiplus gettext-base \
			&& apt-get clean && rm -rf /var/lib/apt/lists/* \
            && curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- -c 3.1 --runtime aspnetcore --install-dir /usr/share \
            && ln -s /usr/share/dotnet /usr/bin/dotnet


USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
