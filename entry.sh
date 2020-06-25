#!/bin/sh

# Add variables to DynDNS config
if [ -z "$API_USER" ]
then
      echo "Empty API_USER. Please set your CoreNetworks API user."
      exit 10
else
      sed -i "s/{{API_USER}}/$API_USER/g" /dyndns/config.ini
fi

if [ -z "$API_PASS" ]
then
      echo "Empty API_PASS. Please set your CoreNetworks API password."
      exit 11
else
      sed -i "s/{{API_PASS}}/$API_PASS/g" /dyndns/config.ini
fi

if [ -z "$ZONE" ]
then
      echo "Empty ZONE. Please define your DNS zone (e.g. example.com)"
      exit 12
else
      sed -i "s/{{ZONE}}/$ZONE/g" /dyndns/config.ini
fi

if [[ -z $SUB1 ]];
then
	echo "Empty SUB1. Please define at least one subdomain"
    exit 13
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