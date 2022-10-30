# OpeNLDAP server based on openSUSE Leap 15.4
FROM ghcr.io/fab-infra/base-image:opensuse15.4

# Environment
ENV OPENLDAP_DB_BACKEND="mdb" \
	OPENLDAP_DB_SUFFIX="dc=localhost" \
	OPENLDAP_ROOT_DN="cn=root,dc=localhost" \
	OPENLDAP_ROOT_PASSWORD="secret" \
	OPENLDAP_INIT_FILE="/var/lib/ldap/init.ldif"

# OpenLDAP
RUN zypper in -y openldap2 openldap2-client &&\
	zypper clean -a

# Files
COPY ./root /
RUN chmod a+rw /etc/passwd /etc/group &&\
	mkdir -p /var/run/slapd &&\
	confd -onetime -backend env &&\
	chmod -R a+rwX /etc/openldap /var/lib/ldap /var/run/slapd

# Ports
EXPOSE 1389
