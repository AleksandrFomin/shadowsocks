FROM ubuntu:20.04

RUN apt update && apt install -y \
    python3 \
    python3-pip \
    python3.8-venv \
 && pip install --upgrade build \
 && pip install tinydb

# ENTRYPOINT ["bash /shadowsocks/develop/startup.sh"]

# usage:
# docker run -d --restart=always -p 1314:1314 ficapy/shadowsocks -s 0.0.0.0 -p 1314 -k $PD -m chacha20
