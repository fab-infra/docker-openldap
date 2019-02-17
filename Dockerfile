# OpeNLDAP server based on openSUSE Leap 15
FROM fcrespel/base-image:opensuse15

# Environment
ENV OPENLDAP_DB_BACKEND="mdb"
ENV OPENLDAP_DB_SUFFIX="dc=localhost"
ENV OPENLDAP_ROOT_DN="cn=root,dc=localhost"
ENV OPENLDAP_ROOT_PASSWORD="secret"

# OpenLDAP
RUN zypper in -y openldap2 &&\
	zypper clean -a

# Files
COPY ./root /
RUN chmod +x /run.sh &&\
	chmod a+rw /etc/passwd /etc/group &&\
	mkdir -p /var/run/slapd &&\
	confd -onetime -backend env &&\
	chmod -R a+rwX /etc/openldap /var/lib/ldap /var/run/slapd

# Ports
EXPOSE 1389
