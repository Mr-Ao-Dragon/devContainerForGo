FROM mcr.microsoft.com/devcontainers/go:1-1.23-bookworm
RUN mkdir "/etc/apt/sources.list.d/" && \
    rm -f /etc/apt/sources.list.d/debian.sources
COPY apt/debian.sources /etc/apt/sources.list.d/
ENV DEBIAN_FRONTEND=noninteractive
ENV GOPROXY=https://goproxy.cn
ENV GO111MODULE=ON
VOLUME ["/var/run/docker.sock:/var/run/docker.sock"]
COPY gpg-key.passwd private-file.key  ~/
RUN gpg --batch --passphrase-file passphrase.passwd --import private.key || true
CMD /bin/sh -c "while sleep 1000; do :; done"