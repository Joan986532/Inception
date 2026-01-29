#!/bin/bash

service vsftpd start

adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PWD" | chpasswd

echo $FTP_USER | tee -a /etc/vsftpd.userlist

service vsftpd restart
