#!/bin/sh
set -e

if [ "${ROLE}" != "slave" ]; then
    exit 0
fi

if [ ! -x "/usr/local/bin/buildslave" ]; then
    exit 0
fi

if [ -z "${BASEDIR}" ]; then
    BASEDIR="/var/lib/buildbot"
fi

if [ -z "${MASTERHOST}" ]; then MASTERHOST="master"; fi
if [ -z "${MASTERPORT}" ]; then MASTERPORT="10000";  fi
if [ -z "${SLAVENAME}" ];  then SLAVENAME="docker";  fi
if [ -z "${SLAVEPASS}" ];  then SLAVEPASS="docker";  fi

if [ -f "${BASEDIR}/buildbot.tac" ]; then
    /usr/local/bin/buildslave upgrade-slave "${BASEDIR}"
else
    /usr/local/bin/buildslave create-slave "${BASEDIR}" "${MASTERHOST}:${MASTERPORT}" "${SLAVENAME}" "${SLAVEPASS}"
fi

unset MASTERHOST
unset MASTERPORT
unset SLAVENAME
unset SLAVEPASS

exit 0
