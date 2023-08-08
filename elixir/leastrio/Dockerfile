FROM        --platform=$TARGETOS/$TARGETARCH hexpm/elixir:1.14.2-erlang-23.3.4.18-alpine-3.16.2

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apk add --update --no-cache ca-certificates curl git openssl sqlite tar tzdata gettext \
				&& adduser -D -h /home/container container

RUN			mix local.hex --force && mix local.rebar --force

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=500 ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]
