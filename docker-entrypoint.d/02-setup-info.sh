#!/bin/sh
set -e

if [ -z "${BASEDIR}" ]; then
    BASEDIR="/var/lib/buildbot"
fi

if [ ! -d "${BASEDIR}/info" ]; then
    exit 0
fi

whoami > "${BASEDIR}/info/admin"

source /etc/os-release
echo "${PRETTY_NAME}" > "${BASEDIR}/info/host"

exit 0
