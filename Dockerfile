FROM mcr.microsoft.com/devcontainers/go:1-1.23-bookworm

MAINTAINER devContainer
MAINTAINER author=MrAoDragon
RUN rm -rf /etc/apt/sources.list.d/debian.sources
COPY apt/debian.sources /etc/apt/sources.list.d/
VOLUME ["/var/run/docker.sock:/var/run/docker.sock"]
CMD /bin/sh -c "while sleep 1000; do :; done"
