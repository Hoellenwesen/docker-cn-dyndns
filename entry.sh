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

# Add credentials to DynDNS Changer config
sed -i "s/{{DNS_API_USER}}/$DNS_API_USER/g" /cron-tasks/dyndns_changer/config.ini
sed -i "s/{{DNS_API_PASS}}/$DNS_API_PASS/g" /cron-tasks/dyndns_changer/config.ini

# Start cron
/usr/sbin/crond -f -l 8