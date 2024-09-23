# -----------------------------------------------------
# MariaDB Image for Pterodactyl
# -----------------------------------------------------
FROM        --platform=$TARGETOS/$TARGETARCH mariadb:10.3

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

ENV         DEBIAN_FRONTEND=noninteractive

RUN         apt-get update -y \
            && apt-get install -y gettext-base netcat \
            && useradd -d /home/container -m container -s /bin/bash

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ../entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
