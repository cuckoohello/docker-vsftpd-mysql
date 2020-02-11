#!/bin/sh
set -e

envsubst < /config/vsftpd.conf.tpl > /etc/vsftpd/vsftpd.conf
envsubst < /config/vsftpd.mysql.tpl > /etc/pam.d/vsftpd.mysql

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
