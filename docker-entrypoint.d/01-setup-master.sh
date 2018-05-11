#!/bin/sh
set -e

if [ "${ROLE}" != "master" ]; then
    exit 0
fi

if [ -z "${BASEDIR}" ]; then
    BASEDIR="/var/lib/buildbot"
fi

if [ -f "${BASEDIR}/buildbot.tac" ]; then
    /usr/local/bin/buildbot upgrade-master "${BASEDIR}"
else
    /usr/local/bin/buildbot create-master -r "${BASEDIR}"
fi

exit 0
