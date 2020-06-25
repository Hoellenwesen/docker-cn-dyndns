#!/bin/sh

# Add credentials to DynDNS Changer config
sed -i "s/{{DNS_API_USER}}/$DNS_API_USER/g" /dyndns/config.ini
sed -i "s/{{DNS_API_PASS}}/$DNS_API_PASS/g" /dyndns/config.ini
sed -i "s/{{DNS_ZONE}}/$DNS_ZONE/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB1}}/$DNS_SUB1/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB2}}/$DNS_SUB2/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB3}}/$DNS_SUB3/g" /dyndns/config.ini
#sed -i "s/{{DNS_SUB4}}/$DNS_SUB4/g" /dyndns/config.ini

if [[ -z $SUB1 ]];
then
	exit 10
else
    sed -i "s/{{SUB1}}/'$SUB1'/g" /dyndns/config.ini
fi

if [[ -z $SUB2 ]];
then
	sed -i "s/{{SUB2}}//g" /dyndns/config.ini
else
    sed -i "s/{{SUB2}}/,'$SUB2'/g" /dyndns/config.ini
fi

if [[ -z $SUB3 ]];
then
	sed -i "s/{{SUB3}}//g" /dyndns/config.ini
else
    sed -i "s/{{SUB3}}/,'$SUB3'/g" /dyndns/config.ini
fi

if [[ -z $SUB4 ]];
then
	sed -i "s/{{SUB4}}//g" /dyndns/config.ini
else
    sed -i "s/{{SUB4}}/,'$SUB4'/g" /dyndns/config.ini
fi

# Start cron
/usr/sbin/crond -f -l 8