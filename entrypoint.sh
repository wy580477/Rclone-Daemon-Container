#!/bin/sh

htpasswd -csb /workdir/htpasswd ${USER} ${PASSWORD}
exec su-exec ${PUID}:${PGID} rclone rcd \
    --rc-web-gui-no-open-browser \
    --rc-htpasswd=/workdir/htpasswd \
    --rc-addr=:5572 $@
