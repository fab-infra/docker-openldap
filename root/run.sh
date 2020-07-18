#!/bin/sh -e

# Generate configuration
confd -onetime -backend env

# Load init file
if [ ! -e "/var/lib/ldap/data.mdb" ]; then
	if [ -e "$OPENLDAP_INIT_FILE" ]; then
		echo "Loading initial data from $OPENLDAP_INIT_FILE ..."
		slapadd -f /etc/openldap/slapd.conf -l "$OPENLDAP_INIT_FILE" -c
	else
		echo "$OPENLDAP_INIT_FILE does not exist, skipping init"
	fi
else
	echo "LDAP database already exists, skipping init"
fi

# Start OpenLDAP
exec /usr/lib/openldap/start
