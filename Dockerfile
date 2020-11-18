FROM python:alpine
LABEL maintainer="Sebastian Weyer"

ENV API_USER ""
ENV API_PASS ""
ENV ZONE ""
ENV SUB1 ""
ENV SUB2 ""
ENV SUB3 ""
ENV SUB4 ""
ENV TZ ""

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN echo "==> Adding DynDNS Changer..."
ADD dyndns /dyndns

RUN echo "==> Adding Crontab..."
ADD crontab.txt /crontab.txt
RUN /usr/bin/crontab /crontab.txt

RUN echo "==> Adding additional scripts..."
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

CMD ["/entry.sh"]