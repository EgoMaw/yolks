

FROM        --platform=$TARGETOS/$TARGETARCH debian:stable-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

RUN         dpkg --add-architecture i386 \
				&& apt-get update \
				&& apt-get upgrade -y \
	&& apt-get -y --no-install-recommends install ca-certificates curl wget lib32gcc-s1 libsdl2-2.0-0:i386 git unzip zip tar jq dos2unix
