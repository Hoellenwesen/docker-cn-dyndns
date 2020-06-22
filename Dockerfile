FROM alpine:3.12
LABEL maintainer="Hoellenwesen"

ENV DNS_API_USER myuser
ENV DNS_API_PASS mypass

ENV BUILD_PACKAGES \
    python3 \
    py3-pip \
    py3-virtualenv \
    openssl \
    ca-certificates \
    sshpass \
    openssh-client \
    rsync \
    git

RUN set -x && \
    echo "==> Adding build-dependencies..."  && \
    apk --no-cache add --virtual build-dependencies \
        python3-dev \
        libffi-dev \
        openssl-dev \
        build-base && \

    echo "==> Upgrading apk and system..."  && \
    apk update && apk upgrade && \

    echo "==> Adding Python runtime..."  && \
    apk add --no-cache ${BUILD_PACKAGES} && \
    pip3 install --upgrade pip \
        setuptools \
        wheel \
        urllib3 \
        certifi \
        idna \
        requests && \

    echo "==> Cleaning up..."  && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

RUN mkdir /cron-tasks

echo "==> Adding DynDNS Changer..."
ADD dyndns_changer /cron-tasks/dyndns_changer

echo "==> Adding Crontab..."
ADD crontab.txt /crontab.txt
RUN /usr/bin/crontab /crontab.txt

echo "==> Adding additional scripts..."
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

CMD ["/entry.sh"]