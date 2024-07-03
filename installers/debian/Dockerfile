#
# Copyright (c) 2022 EgoMaw
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

FROM        --platform=$TARGETOS/$TARGETARCH debian:stable-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

RUN         dpkg --add-architecture i386 \
				&& apt-get update \
				&& apt-get upgrade -y --no-install-recommends \
				&& apt-get -y --no-install-recommends install ca-certificates curl wget lib32gcc-s1 lib32stdc++6 libsdl2-2.0-0 libsdl2-2.0-0:i386 git unzip zip tar jq dos2unix xz-utils libtbbmalloc2 libtbbmalloc2:i386 lib32z1 \
				&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN         cd /tmp/ \
            && version=$(curl -s https://api.github.com/repos/itzg/restify/releases/latest | jq -r '.tag_name') \
            && curl -sSL https://github.com/itzg/restify/releases/download/${version}/restify_${version}_linux_amd64.tar.gz -o restify.tar.gz \
            && tar xvf restify.tar.gz -C /usr/local/bin/ && rm restify.tar.gz && chmod +x /usr/local/bin/restify

RUN        link=$(curl -s https://api.github.com/repos/sibprogrammer/xq/releases/latest | jq -r '.assets | map(select(.browser_download_url | contains("linux_amd64.tar.gz"))) | .[] | .browser_download_url') \
            && curl -sSL "$link" -o /tmp/xq.tar.gz \
            && tar xvf /tmp/xq.tar.gz -C /usr/local/bin/ && rm /tmp/xq.tar.gz && chmod +x /usr/local/bin/xq
