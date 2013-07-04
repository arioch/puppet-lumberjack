#!/bin/sh
# BEGIN INIT INFO
# Provides:          lumberjack
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO

. /lib/lsb/init-functions

name="lumberjack"

# Read configuration variable file if it is present
[ -r /etc/default/$name ] && . /etc/default/$name

lumberjack_bin="/opt/lumberjack/bin/lumberjack.sh"
pid_file="/var/run/$name.pid"
cwd=`pwd`

start () {
        command="${lumberjack_bin}"

        if start-stop-daemon --start --quiet --oknodo --pidfile "$pid_file" -b -m -N 19 --exec $command -- --host $LUMBERJACK_HOST --port $LUMBERJACK_PORT --ssl-ca-path $LUMBERJACK_SSL_CA_PATH --window-size $LUMBERJACK_WINDOW_SIZE $LUMBERJACK_LOGS; then
                log_end_msg 0
        else
                log_end_msg 1
        fi
}

stop () {
        start-stop-daemon --stop --quiet --oknodo --pidfile "$pid_file"
}

status () {
        status_of_proc -p $pid_file "" "$name"
}

case $1 in
        start)
                if status; then exit 0; fi
                echo -n "Starting $name: "
                start
                echo "$name."
                ;;
        stop)
                echo -n "Stopping $name: "
                stop
                echo "$name."
                ;;
        restart)
                echo -n "Restarting $name: "
                stop
                sleep 1
                start
                echo "$name."
                ;;
        status)
                status && exit 0 || exit $?
                ;;
        *)
                echo "Usage: $0 {start|stop|restart|status}"
                exit 1
                ;;
esac

exit 0

