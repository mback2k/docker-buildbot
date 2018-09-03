#!/bin/sh
set -e

echo "#!/bin/bash" > /usr/local/bin/twistd-buildbot

echo "unset MASTERHOST" >> /usr/local/bin/twistd-buildbot
echo "unset MASTERPORT" >> /usr/local/bin/twistd-buildbot
echo "unset SLAVENAME" >> /usr/local/bin/twistd-buildbot
echo "unset SLAVEPASS" >> /usr/local/bin/twistd-buildbot
echo "unset WORKERNAME" >> /usr/local/bin/twistd-buildbot
echo "unset WORKERPASS" >> /usr/local/bin/twistd-buildbot

echo "exec /usr/bin/twistd -noy /var/lib/buildbot/buildbot.tac" >> /usr/local/bin/twistd-buildbot

chown --reference=/usr/bin/twistd /usr/local/bin/twistd-buildbot
chmod --reference=/usr/bin/twistd /usr/local/bin/twistd-buildbot

exit 0
