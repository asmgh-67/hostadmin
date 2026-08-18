FROM alpine:latest AS build
WORKDIR /
RUN apk add -U --no-cache ca-certificates \
    musl-dev \
    build-base \
    dotnet10-sdk \
    aspnetcore10-runtime \
    libmsquic \
    git \
    wget \
    curl \
    && mkdir ../../etc/dns

FROM alpine:latest
WORKDIR /

EXPOSE \
  53/udp 53/tcp      \
  853/udp 853/tcp    \
  443/udp 443/tcp    \
  80/tcp 8053/tcp    \
  5380/tcp 53443/tcp \
  67/udp

LABEL org.opencontainers.image.title = "DNS-67 ( Fork of Technitium DNS )"
LABEL org.opencontainers.image.source = "https://github.com/asmgh-67/hostadmin"
LABEL org.opencontainers.image.description = "Private Homelab DNS Server"
LABEL org.opencontainers.image.url = "https://github.com/asmgh-67/hostadmin"
LABEL org.opencontainers.image.licenses = "MIT"
