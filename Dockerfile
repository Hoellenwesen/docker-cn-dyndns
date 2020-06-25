FROM alpine:3.12
LABEL maintainer="Hoellenwesen"

ENV API_USER "myuser"
ENV API_PASS "mypass"
ENV ZONE "example.com"
ENV SUB1 "sub1"
ENV SUB2 ""
ENV SUB3 ""
ENV SUB4 ""

ENV BUILD_PACKAGES \
    python3 \
    py3-pip \
    openssl \
    ca-certificates

RUN echo "==> Adding build-dependencies..."  && \
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

RUN echo "==> Adding DynDNS Changer..."
ADD dyndns /dyndns

RUN echo "==> Adding Crontab..."
ADD crontab.txt /crontab.txt
RUN /usr/bin/crontab /crontab.txt

RUN echo "==> Adding additional scripts..."
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

CMD ["/entry.sh"]