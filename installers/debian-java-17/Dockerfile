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

FROM        --platform=$TARGETOS/$TARGETARCH openjdk:17-jdk-slim-bullseye

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive
ENV         PATH="/root/.local/bin:${PATH}"

RUN        apt-get update && apt-get upgrade --no-install-recommends -y \
			&& apt-get -y --no-install-recommends install ca-certificates curl git unzip zip tar jq python3 dos2unix wget \
			&& apt-get clean && rm -rf /var/lib/apt/lists/*


RUN	   version=$(curl -s https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r '.tag_name') \
        && curl "https://github.com/mikefarah/yq/releases/download/${version}/yq_linux_amd64" -sSLo /usr/bin/yq \
        && chmod +x /usr/bin/yq

RUN         cd /tmp/ \
            && version=$(curl -s https://api.github.com/repos/sibprogrammer/xq/releases/latest | jq -r '.tag_name') \
            && curl -sSL https://github.com/sibprogrammer/xq/releases/download/${version}/xq_${version}${version}_linux_amd64.tar.gz  -o xq.tar.gz \
            && tar xvf xq.tar.gz -C /usr/local/bin/ && rm xq.tar.gz && chmod +x /usr/local/bin/xq
