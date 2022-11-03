FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/egomaw/yolks:debian

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

ENV         DEBIAN_FRONTEND noninteractive

RUN        apt update -y \
    && apt upgrade -y \
    && apt install -y libgdiplus libc6 libgcc-s1 libgssapi-krb5-2 libicu52 libicu57 libicu63 libicu67 libssl1.0.0 libssl1.1 libstdc++6 zlib1g \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- -c 5.0 --runtime aspnetcore --install-dir /usr/share/dotnet/

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
