FROM unixorn/debian-py3

LABEL maintainer="Joe Block <jpb@unixorn.net>"
LABEL description="pihole-controller"

RUN apt-get update && \
    apt-get install -y apt-utils ca-certificates --no-install-recommends && \
    apt-get upgrade -y --no-install-recommends && \
		update-ca-certificates && \
		rm -fr /tmp/* /var/lib/apt/lists/* && \
    mkdir -p /usr/local/bin

RUN python3 -m pip install --no-cache-dir PiHole-api pyyaml
COPY bin/pihole-controller /usr/local/bin

LABEL io.whalebrew.name pihole-controller
LABEL io.whalebrew.config.working_dir '/work'

CMD ["pihole-controller"]