#!/bin/bash

set -e
set -x

if ! id -u $FTP_USER > /dev/null 2>&1; then
	adduser --system $FTP_USER
	usermod -a -G ftp $FTP_USER
fi

	chown -R $FTP_USER:ftp /var/www/html
	chmod 755 /var/www/html
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

# if ! grep -q "local_root=/var/www/html" /etc/vsftpd.conf; then	
#	echo "
#	userlist_deny=NO
#	local_root=/var/www/html
#	secure_chroot_dir=/var/run/vsftpd/empty
#	userlist_enable=YES
#	userlist_file=/etc/vsftpd/vsftpd.userlist" >> /etc/vsftpd.conf
# fi

exec "$@"
