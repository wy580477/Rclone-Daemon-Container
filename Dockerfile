FROM alpine:latest

COPY ./entrypoint.sh /workdir/

ENV USER=admin
ENV PASSWORD=password
ENV PUID=0
ENV PGID=0
ENV TZ=UTC

RUN apk add --no-cache ca-certificates rclone su-exec tzdata apache2-utils

VOLUME /mnt/config /mnt/data

LABEL org.opencontainers.image.authors="wy580477@outlook.com"
LABEL org.label-schema.name="Rclone-Daemon-Container"
LABEL org.label-schema.description="Rclone container run as daemon"
LABEL org.label-schema.vcs-url="https://github.com/wy580477/Rclone-Daemon-Container"

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]