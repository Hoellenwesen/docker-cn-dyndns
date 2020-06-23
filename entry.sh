#!/bin/sh

# Add credentials to DynDNS Changer config
#sed -i "s/{{DNS_API_USER}}/$DNS_API_USER/g" /dyndns/config.ini
#sed -i "s/{{DNS_API_PASS}}/$DNS_API_PASS/g" /dyndns/config.ini
#sed -i "s/{{DNS_ZONE}}/$DNS_ZONE/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB1}}/$DNS_SUB1/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB2}}/$DNS_SUB2/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB3}}/$DNS_SUB3/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB4}}/$DNS_SUB4/g" /dyndns/config.ini

# Start cron
/usr/sbin/crond -f -l 8