FROM unixorn/debian-py3

LABEL maintainer="Joe Block <jpb@unixorn.net>"
LABEL description="pihole-controller"
LABEL io.whalebrew.name pihole-controller

RUN mkdir -p /usr/local/bin

RUN python3 -m pip install --no-cache-dir PiHole-api pyyaml
COPY bin/pihole-controller /usr/local/bin

CMD ["pihole-controller"]