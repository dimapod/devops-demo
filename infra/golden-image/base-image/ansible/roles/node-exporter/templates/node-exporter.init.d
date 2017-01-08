#!/bin/sh

### BEGIN INIT INFO
# Provides:          node_exporter
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Prometheus node_exporter system metrics server
# Description:       starts node_exporter using start-stop-daemon
### END INIT INFO

NAME=node_exporter
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
PROMDIR=/home/ubuntu/node_exporter-0.13.0.linux-amd64
DAEMON=/home/ubuntu/node_exporter-0.13.0.linux-amd64/$NAME
DAEMON_OPTS=""
USER=ubuntu


test -x $DAEMON || exit 0

set -e

. /lib/lsb/init-functions

case "$1" in
        start)
                echo -n "Starting $NAME: "
                start-stop-daemon -b -m -c $USER -d $PROMDIR --start --quiet --pidfile $PROMDIR/$NAME.pid \
                    --exec $DAEMON -- $DAEMON_OPTS || true
                echo "$NAME."
                ;;

        stop)
                echo -n "Stopping $NAME: "
                start-stop-daemon --stop --quiet --pidfile $PROMDIR/$NAME.pid \
                    --exec $DAEMON || true
                echo "$NAME."
                ;;

        status)
                status_of_proc -p $PROMDIR/$NAME.pid "$DAEMON" $NAME && exit 0 || exit $?
                ;;
        *)
                echo "Usage: $NAME {start|stop|status}" >&2
                exit 1
                ;;
esac

exit 0