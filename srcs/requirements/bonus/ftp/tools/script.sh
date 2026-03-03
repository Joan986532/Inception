#!/bin/bash

set -e
set -x

if ! id -u $FTP_USER > /dev/null 2>&1; then
	adduser --disabled-password --gecos "" $FTP_USER
	# adduser --system $FTP_USER
	usermod -a -G ftp $FTP_USER
fi
	usermod -a -G www-data $FTP_USER
	usermod -d /var/www/html $FTP_USER
	chown -R www-data:www-data /var/www/html
	chmod -R 775 /var/www/html
	echo "$FTP_USER:$FTP_PASS" | chpasswd

	mkdir -p /etc/vsftpd/empty
	mkdir -p /var/run/vsftpd
	
if [ ! -f /etc/vsftpd/vsftpd.userlist ]; then
	touch /etc/vsftpd/vsftpd.userlist
	echo "$FTP_USER" >> /etc/vsftpd/vsftpd.userlist
fi

if [ ! -f /etc/vsftpd/empty/chroot/list ]; then
	touch /etc/vsftpd/empty/chroot.list
	echo "$FTP_USER" >> /etc/vsftpd/chroot.list
fi

exec "$@"
