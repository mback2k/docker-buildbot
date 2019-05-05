FROM mback2k/debian:stretch

RUN adduser --disabled-password --disabled-login --system --group \
        --uid 812 --home /var/lib/buildbot buildbot

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python python-pip python-mysqldb \
        python-psycopg2 python-twisted python-sqlalchemy \
        python-cffi python-openssl python-cryptography \
        openssh-client curl git patch && \
    apt-get install -y --no-install-recommends \
        msmtp msmtp-mta && \
    apt-get clean

RUN pip install --upgrade pip setuptools wheel
RUN pip install buildbot==0.8.14 buildbot-slave==0.8.14
RUN pip install txgithub==15.0.0

RUN mkdir -p /var/lib/buildbot
WORKDIR /var/lib/buildbot

VOLUME /var/lib/buildbot
USER buildbot

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/
ENV DOCKER_ENV_HIDEVARS MASTERHOST MASTERPORT SLAVENAME SLAVEPASS

CMD ["/usr/bin/twistd", "-noy", "/var/lib/buildbot/buildbot.tac"]
