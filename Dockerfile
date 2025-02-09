FROM ubuntu:20.04

RUN apt update && apt install -y \
    python3 \
    python3-pip \
    python3.8-venv \
 && pip install --upgrade build

COPY . /shadowsocks
WORKDIR /shadowsocks
RUN python3 -m build \
    && pip install dist/shadowsocks-3.0.0-py3-none-any.whl

# RUN apt-get update && apt-get install -y \
#     python-software-properties \
#     software-properties-common \
#  && add-apt-repository ppa:chris-lea/libsodium \
#  && echo "deb http://ppa.launchpad.net/chris-lea/libsodium/ubuntu trusty main" >> /etc/apt/sources.list \
#  && echo "deb-src http://ppa.launchpad.net/chris-lea/libsodium/ubuntu trusty main" >> /etc/apt/sources.list \
#  && apt-get update \
#  && apt-get install -y libsodium-dev python-pip

# RUN pip install shadowsocks

# ENTRYPOINT ["/usr/local/bin/ssserver"]

# usage:
# docker run -d --restart=always -p 1314:1314 ficapy/shadowsocks -s 0.0.0.0 -p 1314 -k $PD -m chacha20
