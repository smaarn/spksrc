#!/bin/sh

# Package
PACKAGE="bazarr"
DNAME="Bazarr"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PYTHON_DIR="/usr/local/python3"
BAZARR_DIR="${INSTALL_DIR}/share/${PACKAGE}"
VAR_DIR="${INSTALL_DIR}/var";

export PATH="${INSTALL_DIR}/bin:${PYTHON_DIR}/bin:${PATH}"
export LC_ALL=en_US.utf8
export LANG=en_US.utf8

if [ -f "${VAR_DIR}/profile" ]; then
	source "${VAR_DIR}/profile"
fi

PID_FILE="${VAR_DIR}/bazarr.pid"
PYTHON="${PYTHON_DIR}/bin/python3"
BASH="/bin/bash"

USER="sc-bazarr"

start_daemon ()
{
    pushd "${BAZARR_DIR}" >/dev/null \
        && start-stop-daemon -S -q -m -b -N 10 -p "${PID_FILE}" -x "${PYTHON}" -a "${BASH}" -- \
            -c "exec \"${PYTHON}\" bazarr.py --no-update --config \"${VAR_DIR}/data\">>\"${VAR_DIR}/bazarr.log\" 2>&1" \
        && popd >/dev/null;
}

stop_daemon ()
{
    start-stop-daemon -u "${USER}" -K -q -p "${PID_FILE}" -x "${PYTHON}"
    wait_for_status 1 20 || start-stop-daemon -K -s 9 -q -p "${PID_FILE}" -x "${PYTHON}"
}

daemon_status ()
{
    start-stop-daemon -u "${USER}" -K -q -t -p "${PID_FILE}" -x "${PYTHON}"
}

wait_for_status ()
{
    counter=$2
    while [ ${counter} -gt 0 ]; do
        daemon_status
        [ $? -eq $1 ] && return
        let counter=counter-1
        sleep 1
    done
    return 1
}


case $1 in
    start)
        if daemon_status; then
            echo ${DNAME} is already running
        else
            echo Starting ${DNAME} ...
            start_daemon
        fi
        ;;
    stop)
        if daemon_status; then
            echo Stopping ${DNAME} ...
            stop_daemon
        else
            echo ${DNAME} is not running
        fi
        ;;
    status)
        if daemon_status; then
            echo ${DNAME} is running
            exit 0
        else
            echo ${DNAME} is not running
            exit 1
        fi
        ;;
    log)
        exit 1
        ;;
    *)
        exit 1
        ;;
esac
