#!/bin/sh -ex

# Generate configuration
confd -onetime -backend env

# Start OpenLDAP
exec /usr/lib/openldap/start
