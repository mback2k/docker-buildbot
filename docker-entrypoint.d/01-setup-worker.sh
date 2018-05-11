#!/bin/sh
set -e

if [ "${ROLE}" != "worker" ]; then
    exit 0
fi

if [ ! -x "/usr/local/bin/buildbot-worker" ]; then
    exit 0
fi

if [ -z "${BASEDIR}" ]; then
    BASEDIR="/var/lib/buildbot"
fi

if [ -z "${MASTERHOST}" ]; then MASTERHOST="master"; fi
if [ -z "${MASTERPORT}" ]; then MASTERPORT="10000";  fi
if [ -z "${WORKERNAME}" ]; then WORKERNAME="docker"; fi
if [ -z "${WORKERPASS}" ]; then WORKERPASS="docker"; fi

if [ -f "${BASEDIR}/buildbot.tac" ]; then
    /usr/local/bin/buildbot-worker upgrade-worker "${BASEDIR}"
else
    /usr/local/bin/buildbot-worker create-worker "${BASEDIR}" "${MASTERHOST}:${MASTERPORT}" "${WORKERNAME}" "${WORKERPASS}"
fi

unset MASTERHOST
unset MASTERPORT
unset WORKERNAME
unset WORKERPASS

exit 0
