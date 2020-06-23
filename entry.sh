#!/bin/sh

# check ENV
if [[ -z $DNS_API_USER ]];
then
	exit 10
fi
if [[ -z $DNS_API_PASS ]];
then
	exit 11
fi
if [[ -z $DNS_ZONE ]];
then
	exit 12
fi
if [[ -z $DNS_SUB1 ]];
then
	exit 13
fi

# Add credentials to DynDNS Changer config
#sed -i "s/{{DNS_API_USER}}/$DNS_API_USER/g" /dyndns/config.ini
#sed -i "s/{{DNS_API_PASS}}/$DNS_API_PASS/g" /dyndns/config.ini
#sed -i "s/{{DNS_ZONE}}/$DNS_ZONE/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB1}}/$DNS_SUB1/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB2}}/$DNS_SUB2/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB3}}/$DNS_SUB3/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB4}}/$DNS_SUB4/g" /dyndns/config.ini
#sed -i "s/{{DNS_CRONTAB}}/$DNS_CRONTAB/g" /crontab.txt

# Start cron
/usr/sbin/crond -f -l 8