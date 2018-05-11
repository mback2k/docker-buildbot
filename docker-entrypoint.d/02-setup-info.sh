#!/bin/sh
set -e

if [ -z "${BASEDIR}" ]; then
    BASEDIR="/var/lib/buildbot"
fi

if [ ! -d "${BASEDIR}/info" ]; then
    exit 0
fi

whoami > "${BASEDIR}/info/admin"
uname -a > "${BASEDIR}/info/host"

exit 0
