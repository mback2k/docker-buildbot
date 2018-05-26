#!/bin/sh
set -e

if [ -z "${BASEDIR}" ]; then
    BASEDIR="/var/lib/buildbot"
fi

if [ -f "${BASEDIR}/twistd.pid" ]; then
    rm "${BASEDIR}/twistd.pid"
fi

exit 0
