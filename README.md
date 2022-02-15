[![build](https://github.com/fab-infra/docker-openldap/actions/workflows/build.yml/badge.svg)](https://github.com/fab-infra/docker-openldap/actions/workflows/build.yml)

# OpenLDAP Docker image

## Ports

The following ports are exposed by this container image.

| Port | Description |
| ---- | ----------- |
| 1389 | LDAP port |

## Environment variables

The following environment variables can be used with this container.

| Variable | Description | Default value |
| -------- | ----------- | ------------- |
| OPENLDAP_DB_BACKEND | Database backend | mdb |
| OPENLDAP_DB_SUFFIX | Database suffix | dc=localhost |
| OPENLDAP_ROOT_DN | Root distinguished name | cn=root,dc=localhost |
| OPENLDAP_ROOT_PASSWORD | Root password | secret |
| OPENLDAP_INIT_FILE | Initialization LDIF file | /var/lib/ldap/init.ldif |

## Volumes

The following container paths can be used to mount a dedicated volume or to customize configuration.

| Path | Description |
| ---- | ----------- |
| /var/lib/ldap | Database directory |
| /var/lib/ldap/init.ldif | Initialization LDIF file |

## Useful links

- [OpenLDAP documentation](https://www.openldap.org/doc/admin24/)
