FROM mback2k/debian:stretch

RUN adduser --disabled-password --disabled-login --system --group \
        --uid 813 --home /var/lib/buildbot buildbot

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 python3-pip python3-mysqldb \
        python3-psycopg2 python3-twisted python3-sqlalchemy \
        python3-cffi python3-openssl python3-cryptography \
        git patch && \
    apt-get install -y --no-install-recommends \
        msmtp msmtp-mta && \
    apt-get clean

RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install buildbot[bundle,tls]

RUN mkdir -p /var/lib/buildbot
WORKDIR /var/lib/buildbot

VOLUME /var/lib/buildbot
USER buildbot

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

CMD ["/usr/bin/twistd3", "-noy", "/var/lib/buildbot/buildbot.tac"]
